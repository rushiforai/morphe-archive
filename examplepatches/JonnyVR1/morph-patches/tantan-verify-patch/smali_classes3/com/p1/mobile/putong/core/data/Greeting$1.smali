.class Lcom/p1/mobile/putong/core/data/Greeting$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Greeting;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/Greeting;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Greeting;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->owner:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    sget-object v2, Lcom/p1/mobile/putong/core/data/GreetingMessages;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->readUntil:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v0, :cond_4

    .line 47
    .line 48
    const/4 v1, 0x5

    .line 49
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->status:Ljava/lang/String;

    .line 55
    .line 56
    if-eqz v0, :cond_5

    .line 57
    .line 58
    const/4 v1, 0x6

    .line 59
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz v0, :cond_6

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
    :cond_6
    const/16 v0, 0x8

    .line 75
    .line 76
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Greeting;->mm:I

    .line 77
    .line 78
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    add-int/2addr p0, v0

    .line 83
    const/16 v0, 0x9

    .line 84
    .line 85
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Greeting;->userMessageCount:I

    .line 86
    .line 87
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    add-int/2addr p0, v0

    .line 92
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->kankan:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 93
    .line 94
    if-eqz v0, :cond_7

    .line 95
    .line 96
    const/16 v1, 0xa

    .line 97
    .line 98
    sget-object v2, Lcom/p1/mobile/putong/data/IdBoxed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 99
    .line 100
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    add-int/2addr p0, v0

    .line 105
    :cond_7
    const/16 v0, 0xb

    .line 106
    .line 107
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Greeting;->createdTime:D

    .line 108
    .line 109
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    add-int/2addr p0, v0

    .line 114
    const/16 v0, 0xc

    .line 115
    .line 116
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Greeting;->latestTime:D

    .line 117
    .line 118
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    add-int/2addr p0, v0

    .line 123
    const/16 v0, 0xd

    .line 124
    .line 125
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Greeting;->updatedTime:D

    .line 126
    .line 127
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    add-int/2addr p0, v0

    .line 132
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 133
    .line 134
    if-eqz v0, :cond_8

    .line 135
    .line 136
    const/16 v1, 0xe

    .line 137
    .line 138
    sget-object v2, Lcom/p1/mobile/putong/data/IdBoxed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 139
    .line 140
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    add-int/2addr p0, v0

    .line 145
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 146
    .line 147
    if-eqz v0, :cond_9

    .line 148
    .line 149
    const/16 v1, 0xf

    .line 150
    .line 151
    sget-object v2, Lcom/p1/mobile/putong/data/Channel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 152
    .line 153
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    add-int/2addr p0, v0

    .line 158
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->clearedUntil:Ljava/lang/String;

    .line 159
    .line 160
    if-eqz v0, :cond_a

    .line 161
    .line 162
    const/16 v1, 0x10

    .line 163
    .line 164
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    add-int/2addr p0, v0

    .line 169
    :cond_a
    const/16 v0, 0x11

    .line 170
    .line 171
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Greeting;->clearedTime:D

    .line 172
    .line 173
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    add-int/2addr p0, v0

    .line 178
    const/16 v0, 0x12

    .line 179
    .line 180
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Greeting;->localIsUnread:Z

    .line 181
    .line 182
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    add-int/2addr p0, v0

    .line 187
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 188
    .line 189
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 190
    check-cast p1, Lcom/p1/mobile/putong/core/data/Greeting;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Greeting$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Greeting;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Greeting;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/Greeting;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->owner:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->owner:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GreetingMessages;->new_()Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 42
    .line 43
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->readUntil:Ljava/lang/String;

    .line 44
    .line 45
    if-nez p1, :cond_4

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->readUntil:Ljava/lang/String;

    .line 48
    .line 49
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->status:Ljava/lang/String;

    .line 50
    .line 51
    if-nez p1, :cond_5

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->status:Ljava/lang/String;

    .line 54
    .line 55
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 56
    .line 57
    if-nez p1, :cond_6

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 60
    .line 61
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->kankan:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 62
    .line 63
    if-nez p1, :cond_7

    .line 64
    .line 65
    invoke-static {}, Lcom/p1/mobile/putong/data/IdBoxed;->new_()Lcom/p1/mobile/putong/data/IdBoxed;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->kankan:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 70
    .line 71
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 72
    .line 73
    if-nez p1, :cond_8

    .line 74
    .line 75
    invoke-static {}, Lcom/p1/mobile/putong/data/IdBoxed;->new_()Lcom/p1/mobile/putong/data/IdBoxed;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 80
    .line 81
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 82
    .line 83
    if-nez p1, :cond_9

    .line 84
    .line 85
    sget-object p1, Lcom/p1/mobile/putong/data/Channel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 86
    .line 87
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    check-cast p1, Lcom/p1/mobile/putong/data/Channel;

    .line 92
    .line 93
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 94
    .line 95
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->clearedUntil:Ljava/lang/String;

    .line 96
    .line 97
    if-nez p1, :cond_14

    .line 98
    .line 99
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->clearedUntil:Ljava/lang/String;

    .line 100
    .line 101
    return-object p0

    .line 102
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->localIsUnread:Z

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 110
    .line 111
    .line 112
    move-result-wide v0

    .line 113
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->clearedTime:D

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->clearedUntil:Ljava/lang/String;

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/data/Channel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 124
    .line 125
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    check-cast v0, Lcom/p1/mobile/putong/data/Channel;

    .line 130
    .line 131
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :sswitch_4
    sget-object v0, Lcom/p1/mobile/putong/data/IdBoxed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 135
    .line 136
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    check-cast v0, Lcom/p1/mobile/putong/data/IdBoxed;

    .line 141
    .line 142
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 143
    .line 144
    goto/16 :goto_0

    .line 145
    .line 146
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 147
    .line 148
    .line 149
    move-result-wide v0

    .line 150
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->updatedTime:D

    .line 151
    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 155
    .line 156
    .line 157
    move-result-wide v0

    .line 158
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->latestTime:D

    .line 159
    .line 160
    goto/16 :goto_0

    .line 161
    .line 162
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 163
    .line 164
    .line 165
    move-result-wide v0

    .line 166
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->createdTime:D

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_8
    sget-object v0, Lcom/p1/mobile/putong/data/IdBoxed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 171
    .line 172
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    check-cast v0, Lcom/p1/mobile/putong/data/IdBoxed;

    .line 177
    .line 178
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->kankan:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 179
    .line 180
    goto/16 :goto_0

    .line 181
    .line 182
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    iput v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->userMessageCount:I

    .line 187
    .line 188
    goto/16 :goto_0

    .line 189
    .line 190
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    iput v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->mm:I

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 203
    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->status:Ljava/lang/String;

    .line 211
    .line 212
    goto/16 :goto_0

    .line 213
    .line 214
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->readUntil:Ljava/lang/String;

    .line 219
    .line 220
    goto/16 :goto_0

    .line 221
    .line 222
    :sswitch_e
    sget-object v0, Lcom/p1/mobile/putong/core/data/GreetingMessages;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 223
    .line 224
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    check-cast v0, Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 229
    .line 230
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 231
    .line 232
    goto/16 :goto_0

    .line 233
    .line 234
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 239
    .line 240
    goto/16 :goto_0

    .line 241
    .line 242
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->owner:Ljava/lang/String;

    .line 247
    .line 248
    goto/16 :goto_0

    .line 249
    .line 250
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 255
    .line 256
    goto/16 :goto_0

    .line 257
    .line 258
    :sswitch_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 259
    .line 260
    if-nez p1, :cond_a

    .line 261
    .line 262
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 263
    .line 264
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->owner:Ljava/lang/String;

    .line 265
    .line 266
    if-nez p1, :cond_b

    .line 267
    .line 268
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->owner:Ljava/lang/String;

    .line 269
    .line 270
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 271
    .line 272
    if-nez p1, :cond_c

    .line 273
    .line 274
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 275
    .line 276
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 277
    .line 278
    if-nez p1, :cond_d

    .line 279
    .line 280
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GreetingMessages;->new_()Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 285
    .line 286
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->readUntil:Ljava/lang/String;

    .line 287
    .line 288
    if-nez p1, :cond_e

    .line 289
    .line 290
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->readUntil:Ljava/lang/String;

    .line 291
    .line 292
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->status:Ljava/lang/String;

    .line 293
    .line 294
    if-nez p1, :cond_f

    .line 295
    .line 296
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->status:Ljava/lang/String;

    .line 297
    .line 298
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 299
    .line 300
    if-nez p1, :cond_10

    .line 301
    .line 302
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 303
    .line 304
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->kankan:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 305
    .line 306
    if-nez p1, :cond_11

    .line 307
    .line 308
    invoke-static {}, Lcom/p1/mobile/putong/data/IdBoxed;->new_()Lcom/p1/mobile/putong/data/IdBoxed;

    .line 309
    .line 310
    .line 311
    move-result-object p1

    .line 312
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->kankan:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 313
    .line 314
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 315
    .line 316
    if-nez p1, :cond_12

    .line 317
    .line 318
    invoke-static {}, Lcom/p1/mobile/putong/data/IdBoxed;->new_()Lcom/p1/mobile/putong/data/IdBoxed;

    .line 319
    .line 320
    .line 321
    move-result-object p1

    .line 322
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 323
    .line 324
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 325
    .line 326
    if-nez p1, :cond_13

    .line 327
    .line 328
    sget-object p1, Lcom/p1/mobile/putong/data/Channel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 329
    .line 330
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 331
    .line 332
    .line 333
    move-result-object p1

    .line 334
    check-cast p1, Lcom/p1/mobile/putong/data/Channel;

    .line 335
    .line 336
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 337
    .line 338
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->clearedUntil:Ljava/lang/String;

    .line 339
    .line 340
    if-nez p1, :cond_14

    .line 341
    .line 342
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->clearedUntil:Ljava/lang/String;

    .line 343
    .line 344
    :cond_14
    return-object p0

    .line 345
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_12
        0xa -> :sswitch_11
        0x12 -> :sswitch_10
        0x1a -> :sswitch_f
        0x22 -> :sswitch_e
        0x2a -> :sswitch_d
        0x32 -> :sswitch_c
        0x3a -> :sswitch_b
        0x40 -> :sswitch_a
        0x48 -> :sswitch_9
        0x52 -> :sswitch_8
        0x59 -> :sswitch_7
        0x61 -> :sswitch_6
        0x69 -> :sswitch_5
        0x72 -> :sswitch_4
        0x7a -> :sswitch_3
        0x82 -> :sswitch_2
        0x89 -> :sswitch_1
        0x90 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 345
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Greeting$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Greeting;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/Greeting;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->owner:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    sget-object v1, Lcom/p1/mobile/putong/core/data/GreetingMessages;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 33
    .line 34
    .line 35
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->readUntil:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p0, :cond_4

    .line 38
    .line 39
    const/4 v0, 0x5

    .line 40
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->status:Ljava/lang/String;

    .line 44
    .line 45
    if-eqz p0, :cond_5

    .line 46
    .line 47
    const/4 v0, 0x6

    .line 48
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz p0, :cond_6

    .line 54
    .line 55
    const/4 v0, 0x7

    .line 56
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_6
    const/16 p0, 0x8

    .line 60
    .line 61
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->mm:I

    .line 62
    .line 63
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 64
    .line 65
    .line 66
    const/16 p0, 0x9

    .line 67
    .line 68
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->userMessageCount:I

    .line 69
    .line 70
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->kankan:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 74
    .line 75
    if-eqz p0, :cond_7

    .line 76
    .line 77
    const/16 v0, 0xa

    .line 78
    .line 79
    sget-object v1, Lcom/p1/mobile/putong/data/IdBoxed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 80
    .line 81
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 82
    .line 83
    .line 84
    :cond_7
    const/16 p0, 0xb

    .line 85
    .line 86
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->createdTime:D

    .line 87
    .line 88
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 89
    .line 90
    .line 91
    const/16 p0, 0xc

    .line 92
    .line 93
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->latestTime:D

    .line 94
    .line 95
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 96
    .line 97
    .line 98
    const/16 p0, 0xd

    .line 99
    .line 100
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->updatedTime:D

    .line 101
    .line 102
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 106
    .line 107
    if-eqz p0, :cond_8

    .line 108
    .line 109
    const/16 v0, 0xe

    .line 110
    .line 111
    sget-object v1, Lcom/p1/mobile/putong/data/IdBoxed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 112
    .line 113
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 114
    .line 115
    .line 116
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 117
    .line 118
    if-eqz p0, :cond_9

    .line 119
    .line 120
    const/16 v0, 0xf

    .line 121
    .line 122
    sget-object v1, Lcom/p1/mobile/putong/data/Channel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 123
    .line 124
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 125
    .line 126
    .line 127
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->clearedUntil:Ljava/lang/String;

    .line 128
    .line 129
    if-eqz p0, :cond_a

    .line 130
    .line 131
    const/16 v0, 0x10

    .line 132
    .line 133
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 134
    .line 135
    .line 136
    :cond_a
    const/16 p0, 0x11

    .line 137
    .line 138
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->clearedTime:D

    .line 139
    .line 140
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 141
    .line 142
    .line 143
    const/16 p0, 0x12

    .line 144
    .line 145
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/Greeting;->localIsUnread:Z

    .line 146
    .line 147
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 151
    check-cast p1, Lcom/p1/mobile/putong/core/data/Greeting;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Greeting$1;->serialize(Lcom/p1/mobile/putong/core/data/Greeting;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
