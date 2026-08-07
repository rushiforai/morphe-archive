.class Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userId:Ljava/lang/String;

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
    const/4 v0, 0x2

    .line 13
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->mcc:I

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/2addr p0, v0

    .line 20
    const/4 v0, 0x3

    .line 21
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->textBuzzToggle:Z

    .line 22
    .line 23
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->buzzToken:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz v0, :cond_1

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
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->otherUserId:Ljava/lang/String;

    .line 39
    .line 40
    if-eqz v0, :cond_2

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
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->channelToken:Ljava/lang/String;

    .line 49
    .line 50
    if-eqz v0, :cond_3

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
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->scene:Ljava/lang/String;

    .line 59
    .line 60
    if-eqz v0, :cond_4

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
    :cond_4
    const/16 v0, 0x8

    .line 69
    .line 70
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->duration:I

    .line 71
    .line 72
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    add-int/2addr p0, v0

    .line 77
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->mode:Ljava/lang/String;

    .line 78
    .line 79
    if-eqz v0, :cond_5

    .line 80
    .line 81
    const/16 v1, 0x9

    .line 82
    .line 83
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    add-int/2addr p0, v0

    .line 88
    :cond_5
    const/16 v0, 0xa

    .line 89
    .line 90
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->voiceBuzzToggle:Z

    .line 91
    .line 92
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    add-int/2addr p0, v0

    .line 97
    const/16 v0, 0xb

    .line 98
    .line 99
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->videoBuzzToggle:Z

    .line 100
    .line 101
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    add-int/2addr p0, v0

    .line 106
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userInfo:Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    .line 107
    .line 108
    if-eqz v0, :cond_6

    .line 109
    .line 110
    const/16 v1, 0xc

    .line 111
    .line 112
    sget-object v2, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 113
    .line 114
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    add-int/2addr p0, v0

    .line 119
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->deviceInfo:Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;

    .line 120
    .line 121
    if-eqz v0, :cond_7

    .line 122
    .line 123
    const/16 v1, 0xd

    .line 124
    .line 125
    sget-object v2, Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 126
    .line 127
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    add-int/2addr p0, v0

    .line 132
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->conversationId:Ljava/lang/String;

    .line 133
    .line 134
    if-eqz v0, :cond_8

    .line 135
    .line 136
    const/16 v1, 0xe

    .line 137
    .line 138
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    add-int/2addr p0, v0

    .line 143
    :cond_8
    const/16 v0, 0xf

    .line 144
    .line 145
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->expire:J

    .line 146
    .line 147
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    add-int/2addr p0, v0

    .line 152
    const/16 v0, 0x10

    .line 153
    .line 154
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->prolonged:Z

    .line 155
    .line 156
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    add-int/2addr p0, v0

    .line 161
    const/16 v0, 0x11

    .line 162
    .line 163
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->notBlur:Z

    .line 164
    .line 165
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    add-int/2addr p0, v0

    .line 170
    const/16 v0, 0x12

    .line 171
    .line 172
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->memojiBuzzToggle:Z

    .line 173
    .line 174
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    add-int/2addr p0, v0

    .line 179
    const/16 v0, 0x13

    .line 180
    .line 181
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->preferredMcc:I

    .line 182
    .line 183
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    add-int/2addr p0, v0

    .line 188
    const/16 v0, 0x14

    .line 189
    .line 190
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->noFace:Z

    .line 191
    .line 192
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    add-int/2addr p0, v0

    .line 197
    const/16 v0, 0x15

    .line 198
    .line 199
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->noVocal:Z

    .line 200
    .line 201
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    add-int/2addr p0, v0

    .line 206
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->consumeType:Ljava/lang/String;

    .line 207
    .line 208
    if-eqz v0, :cond_9

    .line 209
    .line 210
    const/16 v1, 0x16

    .line 211
    .line 212
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    add-int/2addr p0, v0

    .line 217
    :cond_9
    const/16 v0, 0x17

    .line 218
    .line 219
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->errorCode:I

    .line 220
    .line 221
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    add-int/2addr p0, v0

    .line 226
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 227
    .line 228
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 229
    check-cast p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->buzzToken:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->buzzToken:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->otherUserId:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->otherUserId:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->channelToken:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->channelToken:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->scene:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->scene:Ljava/lang/String;

    .line 44
    .line 45
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->mode:Ljava/lang/String;

    .line 46
    .line 47
    if-nez p1, :cond_5

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->mode:Ljava/lang/String;

    .line 50
    .line 51
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userInfo:Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    .line 52
    .line 53
    if-nez p1, :cond_6

    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->new_()Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userInfo:Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    .line 60
    .line 61
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->deviceInfo:Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;

    .line 62
    .line 63
    if-nez p1, :cond_7

    .line 64
    .line 65
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;->new_()Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->deviceInfo:Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;

    .line 70
    .line 71
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->conversationId:Ljava/lang/String;

    .line 72
    .line 73
    if-nez p1, :cond_8

    .line 74
    .line 75
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->conversationId:Ljava/lang/String;

    .line 76
    .line 77
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->consumeType:Ljava/lang/String;

    .line 78
    .line 79
    if-nez p1, :cond_12

    .line 80
    .line 81
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->consumeType:Ljava/lang/String;

    .line 82
    .line 83
    return-object p0

    .line 84
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->errorCode:I

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->consumeType:Ljava/lang/String;

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->noVocal:Z

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->noFace:Z

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->preferredMcc:I

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->memojiBuzzToggle:Z

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->notBlur:Z

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->prolonged:Z

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 142
    .line 143
    .line 144
    move-result-wide v0

    .line 145
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->expire:J

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->conversationId:Ljava/lang/String;

    .line 154
    .line 155
    goto/16 :goto_0

    .line 156
    .line 157
    :sswitch_a
    sget-object v0, Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 158
    .line 159
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    check-cast v0, Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;

    .line 164
    .line 165
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->deviceInfo:Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :sswitch_b
    sget-object v0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 170
    .line 171
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    check-cast v0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    .line 176
    .line 177
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userInfo:Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    .line 178
    .line 179
    goto/16 :goto_0

    .line 180
    .line 181
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->videoBuzzToggle:Z

    .line 186
    .line 187
    goto/16 :goto_0

    .line 188
    .line 189
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->voiceBuzzToggle:Z

    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->mode:Ljava/lang/String;

    .line 202
    .line 203
    goto/16 :goto_0

    .line 204
    .line 205
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->duration:I

    .line 210
    .line 211
    goto/16 :goto_0

    .line 212
    .line 213
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->scene:Ljava/lang/String;

    .line 218
    .line 219
    goto/16 :goto_0

    .line 220
    .line 221
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->channelToken:Ljava/lang/String;

    .line 226
    .line 227
    goto/16 :goto_0

    .line 228
    .line 229
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->otherUserId:Ljava/lang/String;

    .line 234
    .line 235
    goto/16 :goto_0

    .line 236
    .line 237
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->buzzToken:Ljava/lang/String;

    .line 242
    .line 243
    goto/16 :goto_0

    .line 244
    .line 245
    :sswitch_14
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->textBuzzToggle:Z

    .line 250
    .line 251
    goto/16 :goto_0

    .line 252
    .line 253
    :sswitch_15
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 254
    .line 255
    .line 256
    move-result v0

    .line 257
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->mcc:I

    .line 258
    .line 259
    goto/16 :goto_0

    .line 260
    .line 261
    :sswitch_16
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userId:Ljava/lang/String;

    .line 266
    .line 267
    goto/16 :goto_0

    .line 268
    .line 269
    :sswitch_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userId:Ljava/lang/String;

    .line 270
    .line 271
    if-nez p1, :cond_9

    .line 272
    .line 273
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userId:Ljava/lang/String;

    .line 274
    .line 275
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->buzzToken:Ljava/lang/String;

    .line 276
    .line 277
    if-nez p1, :cond_a

    .line 278
    .line 279
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->buzzToken:Ljava/lang/String;

    .line 280
    .line 281
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->otherUserId:Ljava/lang/String;

    .line 282
    .line 283
    if-nez p1, :cond_b

    .line 284
    .line 285
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->otherUserId:Ljava/lang/String;

    .line 286
    .line 287
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->channelToken:Ljava/lang/String;

    .line 288
    .line 289
    if-nez p1, :cond_c

    .line 290
    .line 291
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->channelToken:Ljava/lang/String;

    .line 292
    .line 293
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->scene:Ljava/lang/String;

    .line 294
    .line 295
    if-nez p1, :cond_d

    .line 296
    .line 297
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->scene:Ljava/lang/String;

    .line 298
    .line 299
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->mode:Ljava/lang/String;

    .line 300
    .line 301
    if-nez p1, :cond_e

    .line 302
    .line 303
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->mode:Ljava/lang/String;

    .line 304
    .line 305
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userInfo:Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    .line 306
    .line 307
    if-nez p1, :cond_f

    .line 308
    .line 309
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->new_()Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    .line 310
    .line 311
    .line 312
    move-result-object p1

    .line 313
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userInfo:Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    .line 314
    .line 315
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->deviceInfo:Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;

    .line 316
    .line 317
    if-nez p1, :cond_10

    .line 318
    .line 319
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;->new_()Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;

    .line 320
    .line 321
    .line 322
    move-result-object p1

    .line 323
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->deviceInfo:Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;

    .line 324
    .line 325
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->conversationId:Ljava/lang/String;

    .line 326
    .line 327
    if-nez p1, :cond_11

    .line 328
    .line 329
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->conversationId:Ljava/lang/String;

    .line 330
    .line 331
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->consumeType:Ljava/lang/String;

    .line 332
    .line 333
    if-nez p1, :cond_12

    .line 334
    .line 335
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->consumeType:Ljava/lang/String;

    .line 336
    .line 337
    :cond_12
    return-object p0

    .line 338
    nop

    .line 339
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_17
        0xa -> :sswitch_16
        0x10 -> :sswitch_15
        0x18 -> :sswitch_14
        0x22 -> :sswitch_13
        0x2a -> :sswitch_12
        0x32 -> :sswitch_11
        0x3a -> :sswitch_10
        0x40 -> :sswitch_f
        0x4a -> :sswitch_e
        0x50 -> :sswitch_d
        0x58 -> :sswitch_c
        0x62 -> :sswitch_b
        0x6a -> :sswitch_a
        0x72 -> :sswitch_9
        0x78 -> :sswitch_8
        0x80 -> :sswitch_7
        0x88 -> :sswitch_6
        0x90 -> :sswitch_5
        0x98 -> :sswitch_4
        0xa0 -> :sswitch_3
        0xa8 -> :sswitch_2
        0xb2 -> :sswitch_1
        0xb8 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 339
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userId:Ljava/lang/String;

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
    const/4 p0, 0x2

    .line 10
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->mcc:I

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x3

    .line 16
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->textBuzzToggle:Z

    .line 17
    .line 18
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->buzzToken:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x4

    .line 26
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->otherUserId:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    const/4 v0, 0x5

    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->channelToken:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    const/4 v0, 0x6

    .line 42
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->scene:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const/4 v0, 0x7

    .line 50
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_4
    const/16 p0, 0x8

    .line 54
    .line 55
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->duration:I

    .line 56
    .line 57
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->mode:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz p0, :cond_5

    .line 63
    .line 64
    const/16 v0, 0x9

    .line 65
    .line 66
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_5
    const/16 p0, 0xa

    .line 70
    .line 71
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->voiceBuzzToggle:Z

    .line 72
    .line 73
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 74
    .line 75
    .line 76
    const/16 p0, 0xb

    .line 77
    .line 78
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->videoBuzzToggle:Z

    .line 79
    .line 80
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userInfo:Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    .line 84
    .line 85
    if-eqz p0, :cond_6

    .line 86
    .line 87
    const/16 v0, 0xc

    .line 88
    .line 89
    sget-object v1, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 90
    .line 91
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 92
    .line 93
    .line 94
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->deviceInfo:Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;

    .line 95
    .line 96
    if-eqz p0, :cond_7

    .line 97
    .line 98
    const/16 v0, 0xd

    .line 99
    .line 100
    sget-object v1, Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 101
    .line 102
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 103
    .line 104
    .line 105
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->conversationId:Ljava/lang/String;

    .line 106
    .line 107
    if-eqz p0, :cond_8

    .line 108
    .line 109
    const/16 v0, 0xe

    .line 110
    .line 111
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 112
    .line 113
    .line 114
    :cond_8
    const/16 p0, 0xf

    .line 115
    .line 116
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->expire:J

    .line 117
    .line 118
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 119
    .line 120
    .line 121
    const/16 p0, 0x10

    .line 122
    .line 123
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->prolonged:Z

    .line 124
    .line 125
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 126
    .line 127
    .line 128
    const/16 p0, 0x11

    .line 129
    .line 130
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->notBlur:Z

    .line 131
    .line 132
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 133
    .line 134
    .line 135
    const/16 p0, 0x12

    .line 136
    .line 137
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->memojiBuzzToggle:Z

    .line 138
    .line 139
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 140
    .line 141
    .line 142
    const/16 p0, 0x13

    .line 143
    .line 144
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->preferredMcc:I

    .line 145
    .line 146
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 147
    .line 148
    .line 149
    const/16 p0, 0x14

    .line 150
    .line 151
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->noFace:Z

    .line 152
    .line 153
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 154
    .line 155
    .line 156
    const/16 p0, 0x15

    .line 157
    .line 158
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->noVocal:Z

    .line 159
    .line 160
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 161
    .line 162
    .line 163
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->consumeType:Ljava/lang/String;

    .line 164
    .line 165
    if-eqz p0, :cond_9

    .line 166
    .line 167
    const/16 v0, 0x16

    .line 168
    .line 169
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 170
    .line 171
    .line 172
    :cond_9
    const/16 p0, 0x17

    .line 173
    .line 174
    iget p1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->errorCode:I

    .line 175
    .line 176
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 180
    check-cast p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams$1;->serialize(Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
