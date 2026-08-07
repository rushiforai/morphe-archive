.class Lcom/p1/mobile/putong/data/BubbleInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/BubbleInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/BubbleInfo;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/BubbleInfo;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/data/Owner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 18
    .line 19
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const/4 v1, 0x3

    .line 29
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 35
    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    const/4 v1, 0x4

    .line 39
    sget-object v2, Lcom/p1/mobile/putong/data/TextTheme;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 40
    .line 41
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 47
    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    const/4 v1, 0x5

    .line 51
    sget-object v2, Lcom/p1/mobile/putong/data/Emotion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 52
    .line 53
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 59
    .line 60
    if-eqz v0, :cond_5

    .line 61
    .line 62
    const/4 v1, 0x6

    .line 63
    sget-object v2, Lcom/p1/mobile/putong/data/MessageLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->status:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz v0, :cond_6

    .line 73
    .line 74
    const/4 v1, 0x7

    .line 75
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    add-int/2addr p0, v0

    .line 80
    :cond_6
    const/16 v0, 0x8

    .line 81
    .line 82
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->createdTime:D

    .line 83
    .line 84
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    add-int/2addr p0, v0

    .line 89
    const/16 v0, 0x9

    .line 90
    .line 91
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->haveLiked:Z

    .line 92
    .line 93
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    add-int/2addr p0, v0

    .line 98
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->media:Ljava/util/List;

    .line 99
    .line 100
    if-eqz v0, :cond_7

    .line 101
    .line 102
    sget-object v1, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 103
    .line 104
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    const/16 v2, 0xa

    .line 109
    .line 110
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    add-int/2addr p0, v0

    .line 115
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->biz:Ljava/lang/String;

    .line 116
    .line 117
    if-eqz v0, :cond_8

    .line 118
    .line 119
    const/16 v1, 0xb

    .line 120
    .line 121
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    add-int/2addr p0, v0

    .line 126
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->userId:Ljava/lang/String;

    .line 127
    .line 128
    if-eqz v0, :cond_9

    .line 129
    .line 130
    const/16 v1, 0xc

    .line 131
    .line 132
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    add-int/2addr p0, v0

    .line 137
    :cond_9
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 138
    .line 139
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 140
    check-cast p1, Lcom/p1/mobile/putong/data/BubbleInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/BubbleInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/BubbleInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/BubbleInfo;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/BubbleInfo;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/data/Owner;->new_()Lcom/p1/mobile/putong/data/Owner;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 30
    .line 31
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 32
    .line 33
    if-nez p1, :cond_2

    .line 34
    .line 35
    iput-object v1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 36
    .line 37
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 38
    .line 39
    if-nez p1, :cond_3

    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/data/TextTheme;->new_()Lcom/p1/mobile/putong/data/TextTheme;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 46
    .line 47
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 48
    .line 49
    if-nez p1, :cond_4

    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/data/Emotion;->new_()Lcom/p1/mobile/putong/data/Emotion;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iput-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 56
    .line 57
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 58
    .line 59
    if-nez p1, :cond_5

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/data/MessageLocation;->new_()Lcom/p1/mobile/putong/data/MessageLocation;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 66
    .line 67
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->status:Ljava/lang/String;

    .line 68
    .line 69
    if-nez p1, :cond_6

    .line 70
    .line 71
    iput-object v1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->status:Ljava/lang/String;

    .line 72
    .line 73
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->media:Ljava/util/List;

    .line 74
    .line 75
    if-nez p1, :cond_7

    .line 76
    .line 77
    new-instance p1, Ljava/util/ArrayList;

    .line 78
    .line 79
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 80
    .line 81
    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->media:Ljava/util/List;

    .line 83
    .line 84
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->biz:Ljava/lang/String;

    .line 85
    .line 86
    if-nez p1, :cond_8

    .line 87
    .line 88
    iput-object v1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->biz:Ljava/lang/String;

    .line 89
    .line 90
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->userId:Ljava/lang/String;

    .line 91
    .line 92
    if-nez p1, :cond_12

    .line 93
    .line 94
    iput-object v1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->userId:Ljava/lang/String;

    .line 95
    .line 96
    return-object p0

    .line 97
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iput-object v0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->userId:Ljava/lang/String;

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iput-object v0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->biz:Ljava/lang/String;

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 112
    .line 113
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    check-cast v0, Ljava/util/List;

    .line 122
    .line 123
    iput-object v0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->media:Ljava/util/List;

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->haveLiked:Z

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 134
    .line 135
    .line 136
    move-result-wide v0

    .line 137
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->createdTime:D

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    iput-object v0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->status:Ljava/lang/String;

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :sswitch_6
    sget-object v0, Lcom/p1/mobile/putong/data/MessageLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 150
    .line 151
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    check-cast v0, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 156
    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :sswitch_7
    sget-object v0, Lcom/p1/mobile/putong/data/Emotion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 162
    .line 163
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    check-cast v0, Lcom/p1/mobile/putong/data/Emotion;

    .line 168
    .line 169
    iput-object v0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 170
    .line 171
    goto/16 :goto_0

    .line 172
    .line 173
    :sswitch_8
    sget-object v0, Lcom/p1/mobile/putong/data/TextTheme;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 174
    .line 175
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    check-cast v0, Lcom/p1/mobile/putong/data/TextTheme;

    .line 180
    .line 181
    iput-object v0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 182
    .line 183
    goto/16 :goto_0

    .line 184
    .line 185
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    iput-object v0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 190
    .line 191
    goto/16 :goto_0

    .line 192
    .line 193
    :sswitch_a
    sget-object v0, Lcom/p1/mobile/putong/data/Owner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 194
    .line 195
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    check-cast v0, Lcom/p1/mobile/putong/data/Owner;

    .line 200
    .line 201
    iput-object v0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 202
    .line 203
    goto/16 :goto_0

    .line 204
    .line 205
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    iput-object v0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 210
    .line 211
    goto/16 :goto_0

    .line 212
    .line 213
    :sswitch_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 214
    .line 215
    if-nez p1, :cond_9

    .line 216
    .line 217
    iput-object v1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 218
    .line 219
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 220
    .line 221
    if-nez p1, :cond_a

    .line 222
    .line 223
    invoke-static {}, Lcom/p1/mobile/putong/data/Owner;->new_()Lcom/p1/mobile/putong/data/Owner;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    iput-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 228
    .line 229
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 230
    .line 231
    if-nez p1, :cond_b

    .line 232
    .line 233
    iput-object v1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 234
    .line 235
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 236
    .line 237
    if-nez p1, :cond_c

    .line 238
    .line 239
    invoke-static {}, Lcom/p1/mobile/putong/data/TextTheme;->new_()Lcom/p1/mobile/putong/data/TextTheme;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    iput-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 244
    .line 245
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 246
    .line 247
    if-nez p1, :cond_d

    .line 248
    .line 249
    invoke-static {}, Lcom/p1/mobile/putong/data/Emotion;->new_()Lcom/p1/mobile/putong/data/Emotion;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    iput-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 254
    .line 255
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 256
    .line 257
    if-nez p1, :cond_e

    .line 258
    .line 259
    invoke-static {}, Lcom/p1/mobile/putong/data/MessageLocation;->new_()Lcom/p1/mobile/putong/data/MessageLocation;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    iput-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 264
    .line 265
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->status:Ljava/lang/String;

    .line 266
    .line 267
    if-nez p1, :cond_f

    .line 268
    .line 269
    iput-object v1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->status:Ljava/lang/String;

    .line 270
    .line 271
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->media:Ljava/util/List;

    .line 272
    .line 273
    if-nez p1, :cond_10

    .line 274
    .line 275
    new-instance p1, Ljava/util/ArrayList;

    .line 276
    .line 277
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 278
    .line 279
    .line 280
    iput-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->media:Ljava/util/List;

    .line 281
    .line 282
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->biz:Ljava/lang/String;

    .line 283
    .line 284
    if-nez p1, :cond_11

    .line 285
    .line 286
    iput-object v1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->biz:Ljava/lang/String;

    .line 287
    .line 288
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->userId:Ljava/lang/String;

    .line 289
    .line 290
    if-nez p1, :cond_12

    .line 291
    .line 292
    iput-object v1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->userId:Ljava/lang/String;

    .line 293
    .line 294
    :cond_12
    return-object p0

    .line 295
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
        0x41 -> :sswitch_4
        0x48 -> :sswitch_3
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

    .line 295
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/BubbleInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/BubbleInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/data/Owner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 28
    .line 29
    if-eqz p0, :cond_3

    .line 30
    .line 31
    const/4 v0, 0x4

    .line 32
    sget-object v1, Lcom/p1/mobile/putong/data/TextTheme;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 33
    .line 34
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    const/4 v0, 0x5

    .line 42
    sget-object v1, Lcom/p1/mobile/putong/data/Emotion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 43
    .line 44
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 45
    .line 46
    .line 47
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 48
    .line 49
    if-eqz p0, :cond_5

    .line 50
    .line 51
    const/4 v0, 0x6

    .line 52
    sget-object v1, Lcom/p1/mobile/putong/data/MessageLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 53
    .line 54
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 55
    .line 56
    .line 57
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->status:Ljava/lang/String;

    .line 58
    .line 59
    if-eqz p0, :cond_6

    .line 60
    .line 61
    const/4 v0, 0x7

    .line 62
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_6
    const/16 p0, 0x8

    .line 66
    .line 67
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->createdTime:D

    .line 68
    .line 69
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 70
    .line 71
    .line 72
    const/16 p0, 0x9

    .line 73
    .line 74
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->haveLiked:Z

    .line 75
    .line 76
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->media:Ljava/util/List;

    .line 80
    .line 81
    if-eqz p0, :cond_7

    .line 82
    .line 83
    sget-object v0, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const/16 v1, 0xa

    .line 90
    .line 91
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 92
    .line 93
    .line 94
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->biz:Ljava/lang/String;

    .line 95
    .line 96
    if-eqz p0, :cond_8

    .line 97
    .line 98
    const/16 v0, 0xb

    .line 99
    .line 100
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 101
    .line 102
    .line 103
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->userId:Ljava/lang/String;

    .line 104
    .line 105
    if-eqz p0, :cond_9

    .line 106
    .line 107
    const/16 p1, 0xc

    .line 108
    .line 109
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 110
    .line 111
    .line 112
    :cond_9
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 113
    check-cast p1, Lcom/p1/mobile/putong/data/BubbleInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/BubbleInfo$1;->serialize(Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
