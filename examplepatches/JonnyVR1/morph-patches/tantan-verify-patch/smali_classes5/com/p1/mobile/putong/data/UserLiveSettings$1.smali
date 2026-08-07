.class Lcom/p1/mobile/putong/data/UserLiveSettings$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/UserLiveSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/UserLiveSettings;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/UserLiveSettings;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeEnterRoomMsg:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeSmallWindow:Ljava/lang/Boolean;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->teenModeEnable:Ljava/lang/Boolean;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x3

    .line 35
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->intlAdUser:Ljava/lang/Boolean;

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x4

    .line 49
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->regionTag:Ljava/lang/String;

    .line 59
    .line 60
    if-eqz v0, :cond_4

    .line 61
    .line 62
    const/4 v1, 0x5

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceWindowEnable:Ljava/lang/Boolean;

    .line 69
    .line 70
    if-eqz v0, :cond_5

    .line 71
    .line 72
    const/4 v1, 0x6

    .line 73
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    add-int/2addr p0, v0

    .line 82
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->fakeId:Ljava/lang/String;

    .line 83
    .line 84
    if-eqz v0, :cond_6

    .line 85
    .line 86
    const/4 v1, 0x7

    .line 87
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    add-int/2addr p0, v0

    .line 92
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideStoppedRoom:Ljava/lang/Boolean;

    .line 93
    .line 94
    if-eqz v0, :cond_7

    .line 95
    .line 96
    const/16 v1, 0x8

    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    add-int/2addr p0, v0

    .line 107
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideVoiceOnCall:Ljava/lang/Boolean;

    .line 108
    .line 109
    if-eqz v0, :cond_8

    .line 110
    .line 111
    const/16 v1, 0x9

    .line 112
    .line 113
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    add-int/2addr p0, v0

    .line 122
    :cond_8
    const/16 v0, 0xa

    .line 123
    .line 124
    iget v1, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->wealthGrade:I

    .line 125
    .line 126
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    add-int/2addr p0, v0

    .line 131
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideMomentsWealthTag:Ljava/lang/Boolean;

    .line 132
    .line 133
    if-eqz v0, :cond_9

    .line 134
    .line 135
    const/16 v1, 0xb

    .line 136
    .line 137
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    add-int/2addr p0, v0

    .line 146
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideProfileWealthTag:Ljava/lang/Boolean;

    .line 147
    .line 148
    if-eqz v0, :cond_a

    .line 149
    .line 150
    const/16 v1, 0xc

    .line 151
    .line 152
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    add-int/2addr p0, v0

    .line 161
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideSwipeWealthTag:Ljava/lang/Boolean;

    .line 162
    .line 163
    if-eqz v0, :cond_b

    .line 164
    .line 165
    const/16 v1, 0xd

    .line 166
    .line 167
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    add-int/2addr p0, v0

    .line 176
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->isDiamondVIP:Ljava/lang/Boolean;

    .line 177
    .line 178
    if-eqz v0, :cond_c

    .line 179
    .line 180
    const/16 v1, 0xe

    .line 181
    .line 182
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    add-int/2addr p0, v0

    .line 191
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideDiamondTag:Ljava/lang/Boolean;

    .line 192
    .line 193
    if-eqz v0, :cond_d

    .line 194
    .line 195
    const/16 v1, 0xf

    .line 196
    .line 197
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    add-int/2addr p0, v0

    .line 206
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->pureModeGroup:Ljava/lang/String;

    .line 207
    .line 208
    if-eqz v0, :cond_e

    .line 209
    .line 210
    const/16 v1, 0x10

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
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->showVoiceStatus:Ljava/lang/String;

    .line 218
    .line 219
    if-eqz v0, :cond_f

    .line 220
    .line 221
    const/16 v1, 0x11

    .line 222
    .line 223
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    add-int/2addr p0, v0

    .line 228
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceNotification:Ljava/lang/String;

    .line 229
    .line 230
    if-eqz v0, :cond_10

    .line 231
    .line 232
    const/16 v1, 0x12

    .line 233
    .line 234
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 235
    .line 236
    .line 237
    move-result v0

    .line 238
    add-int/2addr p0, v0

    .line 239
    :cond_10
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 240
    .line 241
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 242
    check-cast p1, Lcom/p1/mobile/putong/data/UserLiveSettings;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/UserLiveSettings$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/UserLiveSettings;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/UserLiveSettings;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/UserLiveSettings;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeEnterRoomMsg:Ljava/lang/Boolean;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 20
    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeEnterRoomMsg:Ljava/lang/Boolean;

    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeSmallWindow:Ljava/lang/Boolean;

    .line 24
    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeSmallWindow:Ljava/lang/Boolean;

    .line 30
    .line 31
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->teenModeEnable:Ljava/lang/Boolean;

    .line 32
    .line 33
    if-nez p1, :cond_2

    .line 34
    .line 35
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 36
    .line 37
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->teenModeEnable:Ljava/lang/Boolean;

    .line 38
    .line 39
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->intlAdUser:Ljava/lang/Boolean;

    .line 40
    .line 41
    if-nez p1, :cond_3

    .line 42
    .line 43
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 44
    .line 45
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->intlAdUser:Ljava/lang/Boolean;

    .line 46
    .line 47
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->regionTag:Ljava/lang/String;

    .line 48
    .line 49
    if-nez p1, :cond_4

    .line 50
    .line 51
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->regionTag:Ljava/lang/String;

    .line 52
    .line 53
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceWindowEnable:Ljava/lang/Boolean;

    .line 54
    .line 55
    if-nez p1, :cond_5

    .line 56
    .line 57
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 58
    .line 59
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceWindowEnable:Ljava/lang/Boolean;

    .line 60
    .line 61
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->fakeId:Ljava/lang/String;

    .line 62
    .line 63
    if-nez p1, :cond_6

    .line 64
    .line 65
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->fakeId:Ljava/lang/String;

    .line 66
    .line 67
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideStoppedRoom:Ljava/lang/Boolean;

    .line 68
    .line 69
    if-nez p1, :cond_7

    .line 70
    .line 71
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 72
    .line 73
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideStoppedRoom:Ljava/lang/Boolean;

    .line 74
    .line 75
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideVoiceOnCall:Ljava/lang/Boolean;

    .line 76
    .line 77
    if-nez p1, :cond_8

    .line 78
    .line 79
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 80
    .line 81
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideVoiceOnCall:Ljava/lang/Boolean;

    .line 82
    .line 83
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideMomentsWealthTag:Ljava/lang/Boolean;

    .line 84
    .line 85
    if-nez p1, :cond_9

    .line 86
    .line 87
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 88
    .line 89
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideMomentsWealthTag:Ljava/lang/Boolean;

    .line 90
    .line 91
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideProfileWealthTag:Ljava/lang/Boolean;

    .line 92
    .line 93
    if-nez p1, :cond_a

    .line 94
    .line 95
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 96
    .line 97
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideProfileWealthTag:Ljava/lang/Boolean;

    .line 98
    .line 99
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideSwipeWealthTag:Ljava/lang/Boolean;

    .line 100
    .line 101
    if-nez p1, :cond_b

    .line 102
    .line 103
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 104
    .line 105
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideSwipeWealthTag:Ljava/lang/Boolean;

    .line 106
    .line 107
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->isDiamondVIP:Ljava/lang/Boolean;

    .line 108
    .line 109
    if-nez p1, :cond_c

    .line 110
    .line 111
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 112
    .line 113
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->isDiamondVIP:Ljava/lang/Boolean;

    .line 114
    .line 115
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideDiamondTag:Ljava/lang/Boolean;

    .line 116
    .line 117
    if-nez p1, :cond_d

    .line 118
    .line 119
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 120
    .line 121
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideDiamondTag:Ljava/lang/Boolean;

    .line 122
    .line 123
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->pureModeGroup:Ljava/lang/String;

    .line 124
    .line 125
    if-nez p1, :cond_e

    .line 126
    .line 127
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->pureModeGroup:Ljava/lang/String;

    .line 128
    .line 129
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->showVoiceStatus:Ljava/lang/String;

    .line 130
    .line 131
    if-nez p1, :cond_f

    .line 132
    .line 133
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->showVoiceStatus:Ljava/lang/String;

    .line 134
    .line 135
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceNotification:Ljava/lang/String;

    .line 136
    .line 137
    if-nez p1, :cond_20

    .line 138
    .line 139
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceNotification:Ljava/lang/String;

    .line 140
    .line 141
    return-object p0

    .line 142
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceNotification:Ljava/lang/String;

    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->showVoiceStatus:Ljava/lang/String;

    .line 155
    .line 156
    goto/16 :goto_0

    .line 157
    .line 158
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->pureModeGroup:Ljava/lang/String;

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideDiamondTag:Ljava/lang/Boolean;

    .line 175
    .line 176
    goto/16 :goto_0

    .line 177
    .line 178
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->isDiamondVIP:Ljava/lang/Boolean;

    .line 187
    .line 188
    goto/16 :goto_0

    .line 189
    .line 190
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideSwipeWealthTag:Ljava/lang/Boolean;

    .line 199
    .line 200
    goto/16 :goto_0

    .line 201
    .line 202
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideProfileWealthTag:Ljava/lang/Boolean;

    .line 211
    .line 212
    goto/16 :goto_0

    .line 213
    .line 214
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideMomentsWealthTag:Ljava/lang/Boolean;

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 227
    .line 228
    .line 229
    move-result v0

    .line 230
    iput v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->wealthGrade:I

    .line 231
    .line 232
    goto/16 :goto_0

    .line 233
    .line 234
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 235
    .line 236
    .line 237
    move-result v0

    .line 238
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideVoiceOnCall:Ljava/lang/Boolean;

    .line 243
    .line 244
    goto/16 :goto_0

    .line 245
    .line 246
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 247
    .line 248
    .line 249
    move-result v0

    .line 250
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideStoppedRoom:Ljava/lang/Boolean;

    .line 255
    .line 256
    goto/16 :goto_0

    .line 257
    .line 258
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->fakeId:Ljava/lang/String;

    .line 263
    .line 264
    goto/16 :goto_0

    .line 265
    .line 266
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 267
    .line 268
    .line 269
    move-result v0

    .line 270
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 271
    .line 272
    .line 273
    move-result-object v0

    .line 274
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceWindowEnable:Ljava/lang/Boolean;

    .line 275
    .line 276
    goto/16 :goto_0

    .line 277
    .line 278
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->regionTag:Ljava/lang/String;

    .line 283
    .line 284
    goto/16 :goto_0

    .line 285
    .line 286
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 287
    .line 288
    .line 289
    move-result v0

    .line 290
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->intlAdUser:Ljava/lang/Boolean;

    .line 295
    .line 296
    goto/16 :goto_0

    .line 297
    .line 298
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 299
    .line 300
    .line 301
    move-result v0

    .line 302
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->teenModeEnable:Ljava/lang/Boolean;

    .line 307
    .line 308
    goto/16 :goto_0

    .line 309
    .line 310
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 311
    .line 312
    .line 313
    move-result v0

    .line 314
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeSmallWindow:Ljava/lang/Boolean;

    .line 319
    .line 320
    goto/16 :goto_0

    .line 321
    .line 322
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 323
    .line 324
    .line 325
    move-result v0

    .line 326
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 327
    .line 328
    .line 329
    move-result-object v0

    .line 330
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeEnterRoomMsg:Ljava/lang/Boolean;

    .line 331
    .line 332
    goto/16 :goto_0

    .line 333
    .line 334
    :sswitch_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeEnterRoomMsg:Ljava/lang/Boolean;

    .line 335
    .line 336
    if-nez p1, :cond_10

    .line 337
    .line 338
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 339
    .line 340
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeEnterRoomMsg:Ljava/lang/Boolean;

    .line 341
    .line 342
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeSmallWindow:Ljava/lang/Boolean;

    .line 343
    .line 344
    if-nez p1, :cond_11

    .line 345
    .line 346
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 347
    .line 348
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeSmallWindow:Ljava/lang/Boolean;

    .line 349
    .line 350
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->teenModeEnable:Ljava/lang/Boolean;

    .line 351
    .line 352
    if-nez p1, :cond_12

    .line 353
    .line 354
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 355
    .line 356
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->teenModeEnable:Ljava/lang/Boolean;

    .line 357
    .line 358
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->intlAdUser:Ljava/lang/Boolean;

    .line 359
    .line 360
    if-nez p1, :cond_13

    .line 361
    .line 362
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 363
    .line 364
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->intlAdUser:Ljava/lang/Boolean;

    .line 365
    .line 366
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->regionTag:Ljava/lang/String;

    .line 367
    .line 368
    if-nez p1, :cond_14

    .line 369
    .line 370
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->regionTag:Ljava/lang/String;

    .line 371
    .line 372
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceWindowEnable:Ljava/lang/Boolean;

    .line 373
    .line 374
    if-nez p1, :cond_15

    .line 375
    .line 376
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 377
    .line 378
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceWindowEnable:Ljava/lang/Boolean;

    .line 379
    .line 380
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->fakeId:Ljava/lang/String;

    .line 381
    .line 382
    if-nez p1, :cond_16

    .line 383
    .line 384
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->fakeId:Ljava/lang/String;

    .line 385
    .line 386
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideStoppedRoom:Ljava/lang/Boolean;

    .line 387
    .line 388
    if-nez p1, :cond_17

    .line 389
    .line 390
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 391
    .line 392
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideStoppedRoom:Ljava/lang/Boolean;

    .line 393
    .line 394
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideVoiceOnCall:Ljava/lang/Boolean;

    .line 395
    .line 396
    if-nez p1, :cond_18

    .line 397
    .line 398
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 399
    .line 400
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideVoiceOnCall:Ljava/lang/Boolean;

    .line 401
    .line 402
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideMomentsWealthTag:Ljava/lang/Boolean;

    .line 403
    .line 404
    if-nez p1, :cond_19

    .line 405
    .line 406
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 407
    .line 408
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideMomentsWealthTag:Ljava/lang/Boolean;

    .line 409
    .line 410
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideProfileWealthTag:Ljava/lang/Boolean;

    .line 411
    .line 412
    if-nez p1, :cond_1a

    .line 413
    .line 414
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 415
    .line 416
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideProfileWealthTag:Ljava/lang/Boolean;

    .line 417
    .line 418
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideSwipeWealthTag:Ljava/lang/Boolean;

    .line 419
    .line 420
    if-nez p1, :cond_1b

    .line 421
    .line 422
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 423
    .line 424
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideSwipeWealthTag:Ljava/lang/Boolean;

    .line 425
    .line 426
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->isDiamondVIP:Ljava/lang/Boolean;

    .line 427
    .line 428
    if-nez p1, :cond_1c

    .line 429
    .line 430
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 431
    .line 432
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->isDiamondVIP:Ljava/lang/Boolean;

    .line 433
    .line 434
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideDiamondTag:Ljava/lang/Boolean;

    .line 435
    .line 436
    if-nez p1, :cond_1d

    .line 437
    .line 438
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 439
    .line 440
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideDiamondTag:Ljava/lang/Boolean;

    .line 441
    .line 442
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->pureModeGroup:Ljava/lang/String;

    .line 443
    .line 444
    if-nez p1, :cond_1e

    .line 445
    .line 446
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->pureModeGroup:Ljava/lang/String;

    .line 447
    .line 448
    :cond_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->showVoiceStatus:Ljava/lang/String;

    .line 449
    .line 450
    if-nez p1, :cond_1f

    .line 451
    .line 452
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->showVoiceStatus:Ljava/lang/String;

    .line 453
    .line 454
    :cond_1f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceNotification:Ljava/lang/String;

    .line 455
    .line 456
    if-nez p1, :cond_20

    .line 457
    .line 458
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceNotification:Ljava/lang/String;

    .line 459
    .line 460
    :cond_20
    return-object p0

    .line 461
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_12
        0x8 -> :sswitch_11
        0x10 -> :sswitch_10
        0x18 -> :sswitch_f
        0x20 -> :sswitch_e
        0x2a -> :sswitch_d
        0x30 -> :sswitch_c
        0x3a -> :sswitch_b
        0x40 -> :sswitch_a
        0x48 -> :sswitch_9
        0x50 -> :sswitch_8
        0x58 -> :sswitch_7
        0x60 -> :sswitch_6
        0x68 -> :sswitch_5
        0x70 -> :sswitch_4
        0x78 -> :sswitch_3
        0x82 -> :sswitch_2
        0x8a -> :sswitch_1
        0x92 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 461
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/UserLiveSettings$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/UserLiveSettings;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/UserLiveSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeEnterRoomMsg:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeSmallWindow:Ljava/lang/Boolean;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->teenModeEnable:Ljava/lang/Boolean;

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    const/4 v0, 0x3

    .line 30
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->intlAdUser:Ljava/lang/Boolean;

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    const/4 v0, 0x4

    .line 42
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 47
    .line 48
    .line 49
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->regionTag:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz p0, :cond_4

    .line 52
    .line 53
    const/4 v0, 0x5

    .line 54
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceWindowEnable:Ljava/lang/Boolean;

    .line 58
    .line 59
    if-eqz p0, :cond_5

    .line 60
    .line 61
    const/4 v0, 0x6

    .line 62
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 67
    .line 68
    .line 69
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->fakeId:Ljava/lang/String;

    .line 70
    .line 71
    if-eqz p0, :cond_6

    .line 72
    .line 73
    const/4 v0, 0x7

    .line 74
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideStoppedRoom:Ljava/lang/Boolean;

    .line 78
    .line 79
    if-eqz p0, :cond_7

    .line 80
    .line 81
    const/16 v0, 0x8

    .line 82
    .line 83
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 88
    .line 89
    .line 90
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideVoiceOnCall:Ljava/lang/Boolean;

    .line 91
    .line 92
    if-eqz p0, :cond_8

    .line 93
    .line 94
    const/16 v0, 0x9

    .line 95
    .line 96
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 101
    .line 102
    .line 103
    :cond_8
    const/16 p0, 0xa

    .line 104
    .line 105
    iget v0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->wealthGrade:I

    .line 106
    .line 107
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 108
    .line 109
    .line 110
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideMomentsWealthTag:Ljava/lang/Boolean;

    .line 111
    .line 112
    if-eqz p0, :cond_9

    .line 113
    .line 114
    const/16 v0, 0xb

    .line 115
    .line 116
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 121
    .line 122
    .line 123
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideProfileWealthTag:Ljava/lang/Boolean;

    .line 124
    .line 125
    if-eqz p0, :cond_a

    .line 126
    .line 127
    const/16 v0, 0xc

    .line 128
    .line 129
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 134
    .line 135
    .line 136
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideSwipeWealthTag:Ljava/lang/Boolean;

    .line 137
    .line 138
    if-eqz p0, :cond_b

    .line 139
    .line 140
    const/16 v0, 0xd

    .line 141
    .line 142
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 147
    .line 148
    .line 149
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->isDiamondVIP:Ljava/lang/Boolean;

    .line 150
    .line 151
    if-eqz p0, :cond_c

    .line 152
    .line 153
    const/16 v0, 0xe

    .line 154
    .line 155
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 160
    .line 161
    .line 162
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideDiamondTag:Ljava/lang/Boolean;

    .line 163
    .line 164
    if-eqz p0, :cond_d

    .line 165
    .line 166
    const/16 v0, 0xf

    .line 167
    .line 168
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 169
    .line 170
    .line 171
    move-result p0

    .line 172
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 173
    .line 174
    .line 175
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->pureModeGroup:Ljava/lang/String;

    .line 176
    .line 177
    if-eqz p0, :cond_e

    .line 178
    .line 179
    const/16 v0, 0x10

    .line 180
    .line 181
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 182
    .line 183
    .line 184
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->showVoiceStatus:Ljava/lang/String;

    .line 185
    .line 186
    if-eqz p0, :cond_f

    .line 187
    .line 188
    const/16 v0, 0x11

    .line 189
    .line 190
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 191
    .line 192
    .line 193
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceNotification:Ljava/lang/String;

    .line 194
    .line 195
    if-eqz p0, :cond_10

    .line 196
    .line 197
    const/16 p1, 0x12

    .line 198
    .line 199
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 200
    .line 201
    .line 202
    :cond_10
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 203
    check-cast p1, Lcom/p1/mobile/putong/data/UserLiveSettings;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/UserLiveSettings$1;->serialize(Lcom/p1/mobile/putong/data/UserLiveSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
