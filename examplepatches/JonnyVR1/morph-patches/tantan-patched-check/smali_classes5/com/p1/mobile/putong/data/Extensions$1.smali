.class Lcom/p1/mobile/putong/data/Extensions$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Extensions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/Extensions;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/Extensions;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/Physical;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-static {v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/data/Business;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 20
    .line 21
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/data/Interest;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 32
    .line 33
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x4

    .line 43
    sget-object v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 44
    .line 45
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x5

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/data/Anonymity;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 56
    .line 57
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 63
    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    const/4 v1, 0x6

    .line 67
    sget-object v2, Lcom/p1/mobile/putong/data/HeadFrame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 68
    .line 69
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 75
    .line 76
    if-eqz v0, :cond_6

    .line 77
    .line 78
    const/4 v1, 0x7

    .line 79
    sget-object v2, Lcom/p1/mobile/putong/data/FriendStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 80
    .line 81
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    add-int/2addr p0, v0

    .line 86
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 87
    .line 88
    if-eqz v0, :cond_7

    .line 89
    .line 90
    const/16 v1, 0x8

    .line 91
    .line 92
    sget-object v2, Lcom/p1/mobile/putong/data/MomentSwitch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 93
    .line 94
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    add-int/2addr p0, v0

    .line 99
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 100
    .line 101
    if-eqz v0, :cond_8

    .line 102
    .line 103
    const/16 v1, 0x9

    .line 104
    .line 105
    sget-object v2, Lcom/p1/mobile/putong/data/UserWealth;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 106
    .line 107
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    add-int/2addr p0, v0

    .line 112
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 113
    .line 114
    if-eqz v0, :cond_9

    .line 115
    .line 116
    const/16 v1, 0xa

    .line 117
    .line 118
    sget-object v2, Lcom/p1/mobile/putong/data/ProfileCompletion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 119
    .line 120
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    add-int/2addr p0, v0

    .line 125
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 126
    .line 127
    if-eqz v0, :cond_a

    .line 128
    .line 129
    const/16 v1, 0xb

    .line 130
    .line 131
    sget-object v2, Lcom/p1/mobile/putong/data/VoiceSignature;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 132
    .line 133
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    add-int/2addr p0, v0

    .line 138
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 139
    .line 140
    if-eqz v0, :cond_b

    .line 141
    .line 142
    const/16 v1, 0xc

    .line 143
    .line 144
    sget-object v2, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 145
    .line 146
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    add-int/2addr p0, v0

    .line 151
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 152
    .line 153
    if-eqz v0, :cond_c

    .line 154
    .line 155
    const/16 v1, 0xd

    .line 156
    .line 157
    sget-object v2, Lcom/p1/mobile/putong/data/ProfileMate;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 158
    .line 159
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    add-int/2addr p0, v0

    .line 164
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

    .line 165
    .line 166
    if-eqz v0, :cond_d

    .line 167
    .line 168
    const/16 v1, 0xe

    .line 169
    .line 170
    sget-object v2, Lcom/p1/mobile/putong/data/PetInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 171
    .line 172
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    add-int/2addr p0, v0

    .line 177
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 178
    .line 179
    if-eqz v0, :cond_e

    .line 180
    .line 181
    const/16 v1, 0xf

    .line 182
    .line 183
    sget-object v2, Lcom/p1/mobile/putong/data/TailFrame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 184
    .line 185
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    add-int/2addr p0, v0

    .line 190
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 191
    .line 192
    if-eqz v0, :cond_f

    .line 193
    .line 194
    const/16 v1, 0x10

    .line 195
    .line 196
    sget-object v2, Lcom/p1/mobile/putong/data/VoiceAvatarFrame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 197
    .line 198
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    add-int/2addr p0, v0

    .line 203
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 204
    .line 205
    if-eqz v0, :cond_10

    .line 206
    .line 207
    const/16 v1, 0x11

    .line 208
    .line 209
    sget-object v2, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 210
    .line 211
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    add-int/2addr p0, v0

    .line 216
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 217
    .line 218
    if-eqz v0, :cond_11

    .line 219
    .line 220
    const/16 v1, 0x12

    .line 221
    .line 222
    sget-object v2, Lcom/p1/mobile/putong/data/ExtensionGame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 223
    .line 224
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    add-int/2addr p0, v0

    .line 229
    :cond_11
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 230
    .line 231
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 232
    check-cast p1, Lcom/p1/mobile/putong/data/Extensions;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Extensions$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/Extensions;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Extensions;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Extensions;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Extensions;-><init>()V

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
    sparse-switch v0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/data/Physical;->new_()Lcom/p1/mobile/putong/data/Physical;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 24
    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/data/Business;->new_()Lcom/p1/mobile/putong/data/Business;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 32
    .line 33
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 34
    .line 35
    if-nez p1, :cond_2

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/data/Interest;->new_()Lcom/p1/mobile/putong/data/Interest;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 42
    .line 43
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 44
    .line 45
    if-nez p1, :cond_3

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->new_()Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 52
    .line 53
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 54
    .line 55
    if-nez p1, :cond_4

    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/data/Anonymity;->new_()Lcom/p1/mobile/putong/data/Anonymity;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 62
    .line 63
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 64
    .line 65
    if-nez p1, :cond_5

    .line 66
    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/data/HeadFrame;->new_()Lcom/p1/mobile/putong/data/HeadFrame;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 72
    .line 73
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 74
    .line 75
    if-nez p1, :cond_6

    .line 76
    .line 77
    invoke-static {}, Lcom/p1/mobile/putong/data/FriendStatus;->new_()Lcom/p1/mobile/putong/data/FriendStatus;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 82
    .line 83
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 84
    .line 85
    if-nez p1, :cond_7

    .line 86
    .line 87
    invoke-static {}, Lcom/p1/mobile/putong/data/MomentSwitch;->new_()Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 92
    .line 93
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 94
    .line 95
    if-nez p1, :cond_8

    .line 96
    .line 97
    invoke-static {}, Lcom/p1/mobile/putong/data/UserWealth;->new_()Lcom/p1/mobile/putong/data/UserWealth;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 102
    .line 103
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 104
    .line 105
    if-nez p1, :cond_9

    .line 106
    .line 107
    invoke-static {}, Lcom/p1/mobile/putong/data/ProfileCompletion;->new_()Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 112
    .line 113
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 114
    .line 115
    if-nez p1, :cond_a

    .line 116
    .line 117
    invoke-static {}, Lcom/p1/mobile/putong/data/VoiceSignature;->new_()Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 122
    .line 123
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 124
    .line 125
    if-nez p1, :cond_b

    .line 126
    .line 127
    invoke-static {}, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->new_()Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 132
    .line 133
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 134
    .line 135
    if-nez p1, :cond_c

    .line 136
    .line 137
    invoke-static {}, Lcom/p1/mobile/putong/data/ProfileMate;->new_()Lcom/p1/mobile/putong/data/ProfileMate;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 142
    .line 143
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

    .line 144
    .line 145
    if-nez p1, :cond_d

    .line 146
    .line 147
    invoke-static {}, Lcom/p1/mobile/putong/data/PetInfo;->new_()Lcom/p1/mobile/putong/data/PetInfo;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

    .line 152
    .line 153
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 154
    .line 155
    if-nez p1, :cond_e

    .line 156
    .line 157
    invoke-static {}, Lcom/p1/mobile/putong/data/TailFrame;->new_()Lcom/p1/mobile/putong/data/TailFrame;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 162
    .line 163
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 164
    .line 165
    if-nez p1, :cond_f

    .line 166
    .line 167
    invoke-static {}, Lcom/p1/mobile/putong/data/VoiceAvatarFrame;->new_()Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 172
    .line 173
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 174
    .line 175
    if-nez p1, :cond_10

    .line 176
    .line 177
    invoke-static {}, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->new_()Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 182
    .line 183
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 184
    .line 185
    if-nez p1, :cond_22

    .line 186
    .line 187
    invoke-static {}, Lcom/p1/mobile/putong/data/ExtensionGame;->new_()Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 192
    .line 193
    return-object p0

    .line 194
    :sswitch_0
    sget-object v0, Lcom/p1/mobile/putong/data/ExtensionGame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 195
    .line 196
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    check-cast v0, Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 201
    .line 202
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 203
    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 207
    .line 208
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    check-cast v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 213
    .line 214
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 215
    .line 216
    goto/16 :goto_0

    .line 217
    .line 218
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/data/VoiceAvatarFrame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 219
    .line 220
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    check-cast v0, Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 225
    .line 226
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 227
    .line 228
    goto/16 :goto_0

    .line 229
    .line 230
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/data/TailFrame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 231
    .line 232
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    check-cast v0, Lcom/p1/mobile/putong/data/TailFrame;

    .line 237
    .line 238
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 239
    .line 240
    goto/16 :goto_0

    .line 241
    .line 242
    :sswitch_4
    sget-object v0, Lcom/p1/mobile/putong/data/PetInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 243
    .line 244
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    check-cast v0, Lcom/p1/mobile/putong/data/PetInfo;

    .line 249
    .line 250
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_5
    sget-object v0, Lcom/p1/mobile/putong/data/ProfileMate;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 255
    .line 256
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    check-cast v0, Lcom/p1/mobile/putong/data/ProfileMate;

    .line 261
    .line 262
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 263
    .line 264
    goto/16 :goto_0

    .line 265
    .line 266
    :sswitch_6
    sget-object v0, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 267
    .line 268
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    check-cast v0, Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 273
    .line 274
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 275
    .line 276
    goto/16 :goto_0

    .line 277
    .line 278
    :sswitch_7
    sget-object v0, Lcom/p1/mobile/putong/data/VoiceSignature;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 279
    .line 280
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    check-cast v0, Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 285
    .line 286
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 287
    .line 288
    goto/16 :goto_0

    .line 289
    .line 290
    :sswitch_8
    sget-object v0, Lcom/p1/mobile/putong/data/ProfileCompletion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 291
    .line 292
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    check-cast v0, Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 297
    .line 298
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 299
    .line 300
    goto/16 :goto_0

    .line 301
    .line 302
    :sswitch_9
    sget-object v0, Lcom/p1/mobile/putong/data/UserWealth;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 303
    .line 304
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 305
    .line 306
    .line 307
    move-result-object v0

    .line 308
    check-cast v0, Lcom/p1/mobile/putong/data/UserWealth;

    .line 309
    .line 310
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 311
    .line 312
    goto/16 :goto_0

    .line 313
    .line 314
    :sswitch_a
    sget-object v0, Lcom/p1/mobile/putong/data/MomentSwitch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 315
    .line 316
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    check-cast v0, Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 321
    .line 322
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 323
    .line 324
    goto/16 :goto_0

    .line 325
    .line 326
    :sswitch_b
    sget-object v0, Lcom/p1/mobile/putong/data/FriendStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 327
    .line 328
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 329
    .line 330
    .line 331
    move-result-object v0

    .line 332
    check-cast v0, Lcom/p1/mobile/putong/data/FriendStatus;

    .line 333
    .line 334
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 335
    .line 336
    goto/16 :goto_0

    .line 337
    .line 338
    :sswitch_c
    sget-object v0, Lcom/p1/mobile/putong/data/HeadFrame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 339
    .line 340
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 341
    .line 342
    .line 343
    move-result-object v0

    .line 344
    check-cast v0, Lcom/p1/mobile/putong/data/HeadFrame;

    .line 345
    .line 346
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 347
    .line 348
    goto/16 :goto_0

    .line 349
    .line 350
    :sswitch_d
    sget-object v0, Lcom/p1/mobile/putong/data/Anonymity;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 351
    .line 352
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 353
    .line 354
    .line 355
    move-result-object v0

    .line 356
    check-cast v0, Lcom/p1/mobile/putong/data/Anonymity;

    .line 357
    .line 358
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 359
    .line 360
    goto/16 :goto_0

    .line 361
    .line 362
    :sswitch_e
    sget-object v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 363
    .line 364
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 365
    .line 366
    .line 367
    move-result-object v0

    .line 368
    check-cast v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 369
    .line 370
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 371
    .line 372
    goto/16 :goto_0

    .line 373
    .line 374
    :sswitch_f
    sget-object v0, Lcom/p1/mobile/putong/data/Interest;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 375
    .line 376
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    check-cast v0, Lcom/p1/mobile/putong/data/Interest;

    .line 381
    .line 382
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 383
    .line 384
    goto/16 :goto_0

    .line 385
    .line 386
    :sswitch_10
    sget-object v0, Lcom/p1/mobile/putong/data/Business;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 387
    .line 388
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 389
    .line 390
    .line 391
    move-result-object v0

    .line 392
    check-cast v0, Lcom/p1/mobile/putong/data/Business;

    .line 393
    .line 394
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 395
    .line 396
    goto/16 :goto_0

    .line 397
    .line 398
    :sswitch_11
    sget-object v0, Lcom/p1/mobile/putong/data/Physical;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 399
    .line 400
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 401
    .line 402
    .line 403
    move-result-object v0

    .line 404
    check-cast v0, Lcom/p1/mobile/putong/data/Physical;

    .line 405
    .line 406
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 407
    .line 408
    goto/16 :goto_0

    .line 409
    .line 410
    :sswitch_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 411
    .line 412
    if-nez p1, :cond_11

    .line 413
    .line 414
    invoke-static {}, Lcom/p1/mobile/putong/data/Physical;->new_()Lcom/p1/mobile/putong/data/Physical;

    .line 415
    .line 416
    .line 417
    move-result-object p1

    .line 418
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 419
    .line 420
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 421
    .line 422
    if-nez p1, :cond_12

    .line 423
    .line 424
    invoke-static {}, Lcom/p1/mobile/putong/data/Business;->new_()Lcom/p1/mobile/putong/data/Business;

    .line 425
    .line 426
    .line 427
    move-result-object p1

    .line 428
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 429
    .line 430
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 431
    .line 432
    if-nez p1, :cond_13

    .line 433
    .line 434
    invoke-static {}, Lcom/p1/mobile/putong/data/Interest;->new_()Lcom/p1/mobile/putong/data/Interest;

    .line 435
    .line 436
    .line 437
    move-result-object p1

    .line 438
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 439
    .line 440
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 441
    .line 442
    if-nez p1, :cond_14

    .line 443
    .line 444
    invoke-static {}, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->new_()Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 445
    .line 446
    .line 447
    move-result-object p1

    .line 448
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 449
    .line 450
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 451
    .line 452
    if-nez p1, :cond_15

    .line 453
    .line 454
    invoke-static {}, Lcom/p1/mobile/putong/data/Anonymity;->new_()Lcom/p1/mobile/putong/data/Anonymity;

    .line 455
    .line 456
    .line 457
    move-result-object p1

    .line 458
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 459
    .line 460
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 461
    .line 462
    if-nez p1, :cond_16

    .line 463
    .line 464
    invoke-static {}, Lcom/p1/mobile/putong/data/HeadFrame;->new_()Lcom/p1/mobile/putong/data/HeadFrame;

    .line 465
    .line 466
    .line 467
    move-result-object p1

    .line 468
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 469
    .line 470
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 471
    .line 472
    if-nez p1, :cond_17

    .line 473
    .line 474
    invoke-static {}, Lcom/p1/mobile/putong/data/FriendStatus;->new_()Lcom/p1/mobile/putong/data/FriendStatus;

    .line 475
    .line 476
    .line 477
    move-result-object p1

    .line 478
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 479
    .line 480
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 481
    .line 482
    if-nez p1, :cond_18

    .line 483
    .line 484
    invoke-static {}, Lcom/p1/mobile/putong/data/MomentSwitch;->new_()Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 485
    .line 486
    .line 487
    move-result-object p1

    .line 488
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 489
    .line 490
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 491
    .line 492
    if-nez p1, :cond_19

    .line 493
    .line 494
    invoke-static {}, Lcom/p1/mobile/putong/data/UserWealth;->new_()Lcom/p1/mobile/putong/data/UserWealth;

    .line 495
    .line 496
    .line 497
    move-result-object p1

    .line 498
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 499
    .line 500
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 501
    .line 502
    if-nez p1, :cond_1a

    .line 503
    .line 504
    invoke-static {}, Lcom/p1/mobile/putong/data/ProfileCompletion;->new_()Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 505
    .line 506
    .line 507
    move-result-object p1

    .line 508
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 509
    .line 510
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 511
    .line 512
    if-nez p1, :cond_1b

    .line 513
    .line 514
    invoke-static {}, Lcom/p1/mobile/putong/data/VoiceSignature;->new_()Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 515
    .line 516
    .line 517
    move-result-object p1

    .line 518
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 519
    .line 520
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 521
    .line 522
    if-nez p1, :cond_1c

    .line 523
    .line 524
    invoke-static {}, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->new_()Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 525
    .line 526
    .line 527
    move-result-object p1

    .line 528
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 529
    .line 530
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 531
    .line 532
    if-nez p1, :cond_1d

    .line 533
    .line 534
    invoke-static {}, Lcom/p1/mobile/putong/data/ProfileMate;->new_()Lcom/p1/mobile/putong/data/ProfileMate;

    .line 535
    .line 536
    .line 537
    move-result-object p1

    .line 538
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 539
    .line 540
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

    .line 541
    .line 542
    if-nez p1, :cond_1e

    .line 543
    .line 544
    invoke-static {}, Lcom/p1/mobile/putong/data/PetInfo;->new_()Lcom/p1/mobile/putong/data/PetInfo;

    .line 545
    .line 546
    .line 547
    move-result-object p1

    .line 548
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

    .line 549
    .line 550
    :cond_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 551
    .line 552
    if-nez p1, :cond_1f

    .line 553
    .line 554
    invoke-static {}, Lcom/p1/mobile/putong/data/TailFrame;->new_()Lcom/p1/mobile/putong/data/TailFrame;

    .line 555
    .line 556
    .line 557
    move-result-object p1

    .line 558
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 559
    .line 560
    :cond_1f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 561
    .line 562
    if-nez p1, :cond_20

    .line 563
    .line 564
    invoke-static {}, Lcom/p1/mobile/putong/data/VoiceAvatarFrame;->new_()Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 565
    .line 566
    .line 567
    move-result-object p1

    .line 568
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 569
    .line 570
    :cond_20
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 571
    .line 572
    if-nez p1, :cond_21

    .line 573
    .line 574
    invoke-static {}, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->new_()Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 575
    .line 576
    .line 577
    move-result-object p1

    .line 578
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 579
    .line 580
    :cond_21
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 581
    .line 582
    if-nez p1, :cond_22

    .line 583
    .line 584
    invoke-static {}, Lcom/p1/mobile/putong/data/ExtensionGame;->new_()Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 585
    .line 586
    .line 587
    move-result-object p1

    .line 588
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 589
    .line 590
    :cond_22
    return-object p0

    .line 591
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
        0x42 -> :sswitch_a
        0x4a -> :sswitch_9
        0x52 -> :sswitch_8
        0x5a -> :sswitch_7
        0x62 -> :sswitch_6
        0x6a -> :sswitch_5
        0x72 -> :sswitch_4
        0x7a -> :sswitch_3
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

    .line 591
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Extensions$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Extensions;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/Extensions;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/Physical;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/data/Business;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/data/Interest;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 37
    .line 38
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 42
    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    const/4 v0, 0x5

    .line 46
    sget-object v1, Lcom/p1/mobile/putong/data/Anonymity;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 49
    .line 50
    .line 51
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 52
    .line 53
    if-eqz p0, :cond_5

    .line 54
    .line 55
    const/4 v0, 0x6

    .line 56
    sget-object v1, Lcom/p1/mobile/putong/data/HeadFrame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 57
    .line 58
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 59
    .line 60
    .line 61
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 62
    .line 63
    if-eqz p0, :cond_6

    .line 64
    .line 65
    const/4 v0, 0x7

    .line 66
    sget-object v1, Lcom/p1/mobile/putong/data/FriendStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 67
    .line 68
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 69
    .line 70
    .line 71
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 72
    .line 73
    if-eqz p0, :cond_7

    .line 74
    .line 75
    const/16 v0, 0x8

    .line 76
    .line 77
    sget-object v1, Lcom/p1/mobile/putong/data/MomentSwitch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 80
    .line 81
    .line 82
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 83
    .line 84
    if-eqz p0, :cond_8

    .line 85
    .line 86
    const/16 v0, 0x9

    .line 87
    .line 88
    sget-object v1, Lcom/p1/mobile/putong/data/UserWealth;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    .line 90
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 91
    .line 92
    .line 93
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 94
    .line 95
    if-eqz p0, :cond_9

    .line 96
    .line 97
    const/16 v0, 0xa

    .line 98
    .line 99
    sget-object v1, Lcom/p1/mobile/putong/data/ProfileCompletion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 100
    .line 101
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 102
    .line 103
    .line 104
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 105
    .line 106
    if-eqz p0, :cond_a

    .line 107
    .line 108
    const/16 v0, 0xb

    .line 109
    .line 110
    sget-object v1, Lcom/p1/mobile/putong/data/VoiceSignature;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 111
    .line 112
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 113
    .line 114
    .line 115
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 116
    .line 117
    if-eqz p0, :cond_b

    .line 118
    .line 119
    const/16 v0, 0xc

    .line 120
    .line 121
    sget-object v1, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 122
    .line 123
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 124
    .line 125
    .line 126
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 127
    .line 128
    if-eqz p0, :cond_c

    .line 129
    .line 130
    const/16 v0, 0xd

    .line 131
    .line 132
    sget-object v1, Lcom/p1/mobile/putong/data/ProfileMate;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 133
    .line 134
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 135
    .line 136
    .line 137
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

    .line 138
    .line 139
    if-eqz p0, :cond_d

    .line 140
    .line 141
    const/16 v0, 0xe

    .line 142
    .line 143
    sget-object v1, Lcom/p1/mobile/putong/data/PetInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 144
    .line 145
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 146
    .line 147
    .line 148
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 149
    .line 150
    if-eqz p0, :cond_e

    .line 151
    .line 152
    const/16 v0, 0xf

    .line 153
    .line 154
    sget-object v1, Lcom/p1/mobile/putong/data/TailFrame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 155
    .line 156
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 157
    .line 158
    .line 159
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 160
    .line 161
    if-eqz p0, :cond_f

    .line 162
    .line 163
    const/16 v0, 0x10

    .line 164
    .line 165
    sget-object v1, Lcom/p1/mobile/putong/data/VoiceAvatarFrame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 166
    .line 167
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 168
    .line 169
    .line 170
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 171
    .line 172
    if-eqz p0, :cond_10

    .line 173
    .line 174
    const/16 v0, 0x11

    .line 175
    .line 176
    sget-object v1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 177
    .line 178
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 179
    .line 180
    .line 181
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 182
    .line 183
    if-eqz p0, :cond_11

    .line 184
    .line 185
    const/16 p1, 0x12

    .line 186
    .line 187
    sget-object v0, Lcom/p1/mobile/putong/data/ExtensionGame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 188
    .line 189
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 190
    .line 191
    .line 192
    :cond_11
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 193
    check-cast p1, Lcom/p1/mobile/putong/data/Extensions;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Extensions$1;->serialize(Lcom/p1/mobile/putong/data/Extensions;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
