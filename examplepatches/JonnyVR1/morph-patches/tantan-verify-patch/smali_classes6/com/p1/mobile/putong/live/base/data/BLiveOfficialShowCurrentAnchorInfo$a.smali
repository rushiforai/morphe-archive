.class public Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo$a;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;",
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
.method public a(Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorLiveId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorRoomId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorAvatar:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->programId:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    const/4 v1, 0x5

    .line 47
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorName:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v0, :cond_5

    .line 55
    .line 56
    const/4 v1, 0x6

    .line 57
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->showId:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz v0, :cond_6

    .line 65
    .line 66
    const/4 v1, 0x7

    .line 67
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 73
    .line 74
    if-eqz v0, :cond_7

    .line 75
    .line 76
    const/16 v1, 0x8

    .line 77
    .line 78
    sget-object v2, Lcom/p1/mobile/putong/live/base/data/BLiveState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 79
    .line 80
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    add-int/2addr p0, v0

    .line 85
    :cond_7
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 86
    .line 87
    return p0
.end method

.method public b(Ll/nc5;)Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;-><init>()V

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
    const/16 v2, 0x2a

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
    const/16 v2, 0x42

    .line 43
    .line 44
    if-eq v0, v2, :cond_7

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->showId:Ljava/lang/String;

    .line 47
    .line 48
    if-nez p1, :cond_0

    .line 49
    .line 50
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->showId:Ljava/lang/String;

    .line 51
    .line 52
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorId:Ljava/lang/String;

    .line 53
    .line 54
    if-nez p1, :cond_1

    .line 55
    .line 56
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorId:Ljava/lang/String;

    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorLiveId:Ljava/lang/String;

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorLiveId:Ljava/lang/String;

    .line 63
    .line 64
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorRoomId:Ljava/lang/String;

    .line 65
    .line 66
    if-nez p1, :cond_3

    .line 67
    .line 68
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorRoomId:Ljava/lang/String;

    .line 69
    .line 70
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorAvatar:Ljava/lang/String;

    .line 71
    .line 72
    if-nez p1, :cond_4

    .line 73
    .line 74
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorAvatar:Ljava/lang/String;

    .line 75
    .line 76
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorName:Ljava/lang/String;

    .line 77
    .line 78
    if-nez p1, :cond_5

    .line 79
    .line 80
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorName:Ljava/lang/String;

    .line 81
    .line 82
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->programId:Ljava/lang/String;

    .line 83
    .line 84
    if-nez p1, :cond_6

    .line 85
    .line 86
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->programId:Ljava/lang/String;

    .line 87
    .line 88
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 89
    .line 90
    if-nez p1, :cond_17

    .line 91
    .line 92
    sget-object p1, Lcom/p1/mobile/putong/live/base/data/BLiveState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 99
    .line 100
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 101
    .line 102
    return-object p0

    .line 103
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 104
    .line 105
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 110
    .line 111
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->showId:Ljava/lang/String;

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorName:Ljava/lang/String;

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->programId:Ljava/lang/String;

    .line 133
    .line 134
    goto/16 :goto_0

    .line 135
    .line 136
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorAvatar:Ljava/lang/String;

    .line 141
    .line 142
    goto/16 :goto_0

    .line 143
    .line 144
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorRoomId:Ljava/lang/String;

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorLiveId:Ljava/lang/String;

    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :cond_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorId:Ljava/lang/String;

    .line 165
    .line 166
    goto/16 :goto_0

    .line 167
    .line 168
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->showId:Ljava/lang/String;

    .line 169
    .line 170
    if-nez p1, :cond_10

    .line 171
    .line 172
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->showId:Ljava/lang/String;

    .line 173
    .line 174
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorId:Ljava/lang/String;

    .line 175
    .line 176
    if-nez p1, :cond_11

    .line 177
    .line 178
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorId:Ljava/lang/String;

    .line 179
    .line 180
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorLiveId:Ljava/lang/String;

    .line 181
    .line 182
    if-nez p1, :cond_12

    .line 183
    .line 184
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorLiveId:Ljava/lang/String;

    .line 185
    .line 186
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorRoomId:Ljava/lang/String;

    .line 187
    .line 188
    if-nez p1, :cond_13

    .line 189
    .line 190
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorRoomId:Ljava/lang/String;

    .line 191
    .line 192
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorAvatar:Ljava/lang/String;

    .line 193
    .line 194
    if-nez p1, :cond_14

    .line 195
    .line 196
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorAvatar:Ljava/lang/String;

    .line 197
    .line 198
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorName:Ljava/lang/String;

    .line 199
    .line 200
    if-nez p1, :cond_15

    .line 201
    .line 202
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorName:Ljava/lang/String;

    .line 203
    .line 204
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->programId:Ljava/lang/String;

    .line 205
    .line 206
    if-nez p1, :cond_16

    .line 207
    .line 208
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->programId:Ljava/lang/String;

    .line 209
    .line 210
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 211
    .line 212
    if-nez p1, :cond_17

    .line 213
    .line 214
    sget-object p1, Lcom/p1/mobile/putong/live/base/data/BLiveState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 215
    .line 216
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 221
    .line 222
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 223
    .line 224
    :cond_17
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorLiveId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorRoomId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorAvatar:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->programId:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p0, :cond_4

    .line 36
    .line 37
    const/4 v0, 0x5

    .line 38
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorName:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz p0, :cond_5

    .line 44
    .line 45
    const/4 v0, 0x6

    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->showId:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz p0, :cond_6

    .line 52
    .line 53
    const/4 v0, 0x7

    .line 54
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 58
    .line 59
    if-eqz p0, :cond_7

    .line 60
    .line 61
    const/16 p1, 0x8

    .line 62
    .line 63
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 64
    .line 65
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 66
    .line 67
    .line 68
    :cond_7
    return-void
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo$a;->a(Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;)I

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo$a;->b(Ll/nc5;)Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo$a;->c(Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
