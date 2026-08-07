.class public Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo$a;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;",
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
.method public a(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->enable:Z

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->pkId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUserAvatar:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/4 v1, 0x3

    .line 23
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUserId:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const/4 v1, 0x4

    .line 33
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUserAvatar:Ljava/lang/String;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x5

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
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUserId:Ljava/lang/String;

    .line 49
    .line 50
    if-eqz v0, :cond_4

    .line 51
    .line 52
    const/4 v1, 0x6

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
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUrl:Ljava/lang/String;

    .line 59
    .line 60
    if-eqz v0, :cond_5

    .line 61
    .line 62
    const/4 v1, 0x7

    .line 63
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUrl:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz v0, :cond_6

    .line 71
    .line 72
    const/16 v1, 0x8

    .line 73
    .line 74
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    add-int/2addr p0, v0

    .line 79
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->schema:Ljava/lang/String;

    .line 80
    .line 81
    if-eqz v0, :cond_7

    .line 82
    .line 83
    const/16 v1, 0x9

    .line 84
    .line 85
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    add-int/2addr p0, v0

    .line 90
    :cond_7
    const/16 v0, 0xa

    .line 91
    .line 92
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->endMill:J

    .line 93
    .line 94
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    add-int/2addr p0, v0

    .line 99
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->mvpBg:Ljava/lang/String;

    .line 100
    .line 101
    if-eqz v0, :cond_8

    .line 102
    .line 103
    const/16 v1, 0xb

    .line 104
    .line 105
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    add-int/2addr p0, v0

    .line 110
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->onCallPoints:Ljava/util/List;

    .line 111
    .line 112
    if-eqz v0, :cond_9

    .line 113
    .line 114
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    const/16 v2, 0xc

    .line 121
    .line 122
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    add-int/2addr p0, v0

    .line 127
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftBigUrl:Ljava/lang/String;

    .line 128
    .line 129
    if-eqz v0, :cond_a

    .line 130
    .line 131
    const/16 v1, 0xd

    .line 132
    .line 133
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    add-int/2addr p0, v0

    .line 138
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightBigUrl:Ljava/lang/String;

    .line 139
    .line 140
    if-eqz v0, :cond_b

    .line 141
    .line 142
    const/16 v1, 0xe

    .line 143
    .line 144
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    add-int/2addr p0, v0

    .line 149
    :cond_b
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 150
    .line 151
    return p0
.end method

.method public b(Ll/nc5;)Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->pkId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->pkId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUserAvatar:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUserAvatar:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUserId:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUserId:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUserAvatar:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUserAvatar:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUserId:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUserId:Ljava/lang/String;

    .line 44
    .line 45
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUrl:Ljava/lang/String;

    .line 46
    .line 47
    if-nez p1, :cond_5

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUrl:Ljava/lang/String;

    .line 50
    .line 51
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftBigUrl:Ljava/lang/String;

    .line 52
    .line 53
    if-nez p1, :cond_6

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftBigUrl:Ljava/lang/String;

    .line 56
    .line 57
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUrl:Ljava/lang/String;

    .line 58
    .line 59
    if-nez p1, :cond_7

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUrl:Ljava/lang/String;

    .line 62
    .line 63
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightBigUrl:Ljava/lang/String;

    .line 64
    .line 65
    if-nez p1, :cond_8

    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightBigUrl:Ljava/lang/String;

    .line 68
    .line 69
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->schema:Ljava/lang/String;

    .line 70
    .line 71
    if-nez p1, :cond_9

    .line 72
    .line 73
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->schema:Ljava/lang/String;

    .line 74
    .line 75
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->mvpBg:Ljava/lang/String;

    .line 76
    .line 77
    if-nez p1, :cond_a

    .line 78
    .line 79
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->mvpBg:Ljava/lang/String;

    .line 80
    .line 81
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->onCallPoints:Ljava/util/List;

    .line 82
    .line 83
    if-nez p1, :cond_16

    .line 84
    .line 85
    new-instance p1, Ljava/util/ArrayList;

    .line 86
    .line 87
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 88
    .line 89
    .line 90
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->onCallPoints:Ljava/util/List;

    .line 91
    .line 92
    return-object p0

    .line 93
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightBigUrl:Ljava/lang/String;

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftBigUrl:Ljava/lang/String;

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 108
    .line 109
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Ljava/util/List;

    .line 118
    .line 119
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->onCallPoints:Ljava/util/List;

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->mvpBg:Ljava/lang/String;

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 130
    .line 131
    .line 132
    move-result-wide v0

    .line 133
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->endMill:J

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->schema:Ljava/lang/String;

    .line 142
    .line 143
    goto/16 :goto_0

    .line 144
    .line 145
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUrl:Ljava/lang/String;

    .line 150
    .line 151
    goto/16 :goto_0

    .line 152
    .line 153
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUrl:Ljava/lang/String;

    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUserId:Ljava/lang/String;

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUserAvatar:Ljava/lang/String;

    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUserId:Ljava/lang/String;

    .line 182
    .line 183
    goto/16 :goto_0

    .line 184
    .line 185
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUserAvatar:Ljava/lang/String;

    .line 190
    .line 191
    goto/16 :goto_0

    .line 192
    .line 193
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->pkId:Ljava/lang/String;

    .line 198
    .line 199
    goto/16 :goto_0

    .line 200
    .line 201
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->enable:Z

    .line 206
    .line 207
    goto/16 :goto_0

    .line 208
    .line 209
    :sswitch_e
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->pkId:Ljava/lang/String;

    .line 210
    .line 211
    if-nez p1, :cond_b

    .line 212
    .line 213
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->pkId:Ljava/lang/String;

    .line 214
    .line 215
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUserAvatar:Ljava/lang/String;

    .line 216
    .line 217
    if-nez p1, :cond_c

    .line 218
    .line 219
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUserAvatar:Ljava/lang/String;

    .line 220
    .line 221
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUserId:Ljava/lang/String;

    .line 222
    .line 223
    if-nez p1, :cond_d

    .line 224
    .line 225
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUserId:Ljava/lang/String;

    .line 226
    .line 227
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUserAvatar:Ljava/lang/String;

    .line 228
    .line 229
    if-nez p1, :cond_e

    .line 230
    .line 231
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUserAvatar:Ljava/lang/String;

    .line 232
    .line 233
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUserId:Ljava/lang/String;

    .line 234
    .line 235
    if-nez p1, :cond_f

    .line 236
    .line 237
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUserId:Ljava/lang/String;

    .line 238
    .line 239
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUrl:Ljava/lang/String;

    .line 240
    .line 241
    if-nez p1, :cond_10

    .line 242
    .line 243
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUrl:Ljava/lang/String;

    .line 244
    .line 245
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftBigUrl:Ljava/lang/String;

    .line 246
    .line 247
    if-nez p1, :cond_11

    .line 248
    .line 249
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftBigUrl:Ljava/lang/String;

    .line 250
    .line 251
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUrl:Ljava/lang/String;

    .line 252
    .line 253
    if-nez p1, :cond_12

    .line 254
    .line 255
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUrl:Ljava/lang/String;

    .line 256
    .line 257
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightBigUrl:Ljava/lang/String;

    .line 258
    .line 259
    if-nez p1, :cond_13

    .line 260
    .line 261
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightBigUrl:Ljava/lang/String;

    .line 262
    .line 263
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->schema:Ljava/lang/String;

    .line 264
    .line 265
    if-nez p1, :cond_14

    .line 266
    .line 267
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->schema:Ljava/lang/String;

    .line 268
    .line 269
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->mvpBg:Ljava/lang/String;

    .line 270
    .line 271
    if-nez p1, :cond_15

    .line 272
    .line 273
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->mvpBg:Ljava/lang/String;

    .line 274
    .line 275
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->onCallPoints:Ljava/util/List;

    .line 276
    .line 277
    if-nez p1, :cond_16

    .line 278
    .line 279
    new-instance p1, Ljava/util/ArrayList;

    .line 280
    .line 281
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 282
    .line 283
    .line 284
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->onCallPoints:Ljava/util/List;

    .line 285
    .line 286
    :cond_16
    return-object p0

    .line 287
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_e
        0x8 -> :sswitch_d
        0x12 -> :sswitch_c
        0x1a -> :sswitch_b
        0x22 -> :sswitch_a
        0x2a -> :sswitch_9
        0x32 -> :sswitch_8
        0x3a -> :sswitch_7
        0x42 -> :sswitch_6
        0x4a -> :sswitch_5
        0x50 -> :sswitch_4
        0x5a -> :sswitch_3
        0x62 -> :sswitch_2
        0x6a -> :sswitch_1
        0x72 -> :sswitch_0
    .end sparse-switch
.end method

.method public c(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->enable:Z

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->pkId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUserAvatar:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUserId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUserAvatar:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x5

    .line 36
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUserId:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz p0, :cond_4

    .line 42
    .line 43
    const/4 v0, 0x6

    .line 44
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUrl:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz p0, :cond_5

    .line 50
    .line 51
    const/4 v0, 0x7

    .line 52
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUrl:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz p0, :cond_6

    .line 58
    .line 59
    const/16 v0, 0x8

    .line 60
    .line 61
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->schema:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz p0, :cond_7

    .line 67
    .line 68
    const/16 v0, 0x9

    .line 69
    .line 70
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_7
    const/16 p0, 0xa

    .line 74
    .line 75
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->endMill:J

    .line 76
    .line 77
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->mvpBg:Ljava/lang/String;

    .line 81
    .line 82
    if-eqz p0, :cond_8

    .line 83
    .line 84
    const/16 v0, 0xb

    .line 85
    .line 86
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->onCallPoints:Ljava/util/List;

    .line 90
    .line 91
    if-eqz p0, :cond_9

    .line 92
    .line 93
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 94
    .line 95
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    const/16 v1, 0xc

    .line 100
    .line 101
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 102
    .line 103
    .line 104
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftBigUrl:Ljava/lang/String;

    .line 105
    .line 106
    if-eqz p0, :cond_a

    .line 107
    .line 108
    const/16 v0, 0xd

    .line 109
    .line 110
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 111
    .line 112
    .line 113
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightBigUrl:Ljava/lang/String;

    .line 114
    .line 115
    if-eqz p0, :cond_b

    .line 116
    .line 117
    const/16 p1, 0xe

    .line 118
    .line 119
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 120
    .line 121
    .line 122
    :cond_b
    return-void
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo$a;->a(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo$a;->b(Ll/nc5;)Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo$a;->c(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
