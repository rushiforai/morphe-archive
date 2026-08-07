.class Lcom/p1/mobile/putong/core/data/Bubbles$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Bubbles;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/Bubbles;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Bubbles;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Bubbles;->ref:Lcom/p1/mobile/putong/core/data/Ref;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/Ref;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Bubbles;->type:Ljava/lang/String;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Bubbles;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Bubbles;->tracker:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    const/4 v1, 0x4

    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Bubbles;->userID:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Bubbles;->content:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Bubbles;->photoURL:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Bubbles;->quickChat:Lcom/p1/mobile/putong/core/data/QuickChatBubble;

    .line 75
    .line 76
    if-eqz v0, :cond_7

    .line 77
    .line 78
    const/16 v1, 0x8

    .line 79
    .line 80
    sget-object v2, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 81
    .line 82
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    add-int/2addr p0, v0

    .line 87
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Bubbles;->chatRoom:Lcom/p1/mobile/putong/core/data/ChatRoomBubble;

    .line 88
    .line 89
    if-eqz v0, :cond_8

    .line 90
    .line 91
    const/16 v1, 0x9

    .line 92
    .line 93
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatRoomBubble;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 94
    .line 95
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr p0, v0

    .line 100
    :cond_8
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 101
    .line 102
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 103
    check-cast p1, Lcom/p1/mobile/putong/core/data/Bubbles;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Bubbles$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Bubbles;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Bubbles;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/Bubbles;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/Bubbles;-><init>()V

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
    if-eqz v0, :cond_11

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_10

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_f

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_e

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_d

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_c

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_b

    .line 37
    .line 38
    const/16 v2, 0x3a

    .line 39
    .line 40
    if-eq v0, v2, :cond_a

    .line 41
    .line 42
    const/16 v2, 0x42

    .line 43
    .line 44
    if-eq v0, v2, :cond_9

    .line 45
    .line 46
    const/16 v2, 0x4a

    .line 47
    .line 48
    if-eq v0, v2, :cond_8

    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->type:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->type:Ljava/lang/String;

    .line 55
    .line 56
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->ref:Lcom/p1/mobile/putong/core/data/Ref;

    .line 57
    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Ref;->new_()Lcom/p1/mobile/putong/core/data/Ref;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->ref:Lcom/p1/mobile/putong/core/data/Ref;

    .line 65
    .line 66
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->id:Ljava/lang/String;

    .line 67
    .line 68
    if-nez p1, :cond_2

    .line 69
    .line 70
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->id:Ljava/lang/String;

    .line 71
    .line 72
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->tracker:Ljava/lang/String;

    .line 73
    .line 74
    if-nez p1, :cond_3

    .line 75
    .line 76
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->tracker:Ljava/lang/String;

    .line 77
    .line 78
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->userID:Ljava/lang/String;

    .line 79
    .line 80
    if-nez p1, :cond_4

    .line 81
    .line 82
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->userID:Ljava/lang/String;

    .line 83
    .line 84
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->photoURL:Ljava/lang/String;

    .line 85
    .line 86
    if-nez p1, :cond_5

    .line 87
    .line 88
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->photoURL:Ljava/lang/String;

    .line 89
    .line 90
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->content:Ljava/lang/String;

    .line 91
    .line 92
    if-nez p1, :cond_6

    .line 93
    .line 94
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->content:Ljava/lang/String;

    .line 95
    .line 96
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->quickChat:Lcom/p1/mobile/putong/core/data/QuickChatBubble;

    .line 97
    .line 98
    if-nez p1, :cond_7

    .line 99
    .line 100
    invoke-static {}, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->new_()Lcom/p1/mobile/putong/core/data/QuickChatBubble;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->quickChat:Lcom/p1/mobile/putong/core/data/QuickChatBubble;

    .line 105
    .line 106
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->chatRoom:Lcom/p1/mobile/putong/core/data/ChatRoomBubble;

    .line 107
    .line 108
    if-nez p1, :cond_1a

    .line 109
    .line 110
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatRoomBubble;->new_()Lcom/p1/mobile/putong/core/data/ChatRoomBubble;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->chatRoom:Lcom/p1/mobile/putong/core/data/ChatRoomBubble;

    .line 115
    .line 116
    return-object p0

    .line 117
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatRoomBubble;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 118
    .line 119
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatRoomBubble;

    .line 124
    .line 125
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->chatRoom:Lcom/p1/mobile/putong/core/data/ChatRoomBubble;

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 129
    .line 130
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    check-cast v0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;

    .line 135
    .line 136
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->quickChat:Lcom/p1/mobile/putong/core/data/QuickChatBubble;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->photoURL:Ljava/lang/String;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->content:Ljava/lang/String;

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->userID:Ljava/lang/String;

    .line 161
    .line 162
    goto/16 :goto_0

    .line 163
    .line 164
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->tracker:Ljava/lang/String;

    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :cond_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->id:Ljava/lang/String;

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :cond_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->type:Ljava/lang/String;

    .line 185
    .line 186
    goto/16 :goto_0

    .line 187
    .line 188
    :cond_10
    sget-object v0, Lcom/p1/mobile/putong/core/data/Ref;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 189
    .line 190
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    check-cast v0, Lcom/p1/mobile/putong/core/data/Ref;

    .line 195
    .line 196
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->ref:Lcom/p1/mobile/putong/core/data/Ref;

    .line 197
    .line 198
    goto/16 :goto_0

    .line 199
    .line 200
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->type:Ljava/lang/String;

    .line 201
    .line 202
    if-nez p1, :cond_12

    .line 203
    .line 204
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->type:Ljava/lang/String;

    .line 205
    .line 206
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->ref:Lcom/p1/mobile/putong/core/data/Ref;

    .line 207
    .line 208
    if-nez p1, :cond_13

    .line 209
    .line 210
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Ref;->new_()Lcom/p1/mobile/putong/core/data/Ref;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->ref:Lcom/p1/mobile/putong/core/data/Ref;

    .line 215
    .line 216
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->id:Ljava/lang/String;

    .line 217
    .line 218
    if-nez p1, :cond_14

    .line 219
    .line 220
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->id:Ljava/lang/String;

    .line 221
    .line 222
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->tracker:Ljava/lang/String;

    .line 223
    .line 224
    if-nez p1, :cond_15

    .line 225
    .line 226
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->tracker:Ljava/lang/String;

    .line 227
    .line 228
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->userID:Ljava/lang/String;

    .line 229
    .line 230
    if-nez p1, :cond_16

    .line 231
    .line 232
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->userID:Ljava/lang/String;

    .line 233
    .line 234
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->photoURL:Ljava/lang/String;

    .line 235
    .line 236
    if-nez p1, :cond_17

    .line 237
    .line 238
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->photoURL:Ljava/lang/String;

    .line 239
    .line 240
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->content:Ljava/lang/String;

    .line 241
    .line 242
    if-nez p1, :cond_18

    .line 243
    .line 244
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->content:Ljava/lang/String;

    .line 245
    .line 246
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->quickChat:Lcom/p1/mobile/putong/core/data/QuickChatBubble;

    .line 247
    .line 248
    if-nez p1, :cond_19

    .line 249
    .line 250
    invoke-static {}, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->new_()Lcom/p1/mobile/putong/core/data/QuickChatBubble;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->quickChat:Lcom/p1/mobile/putong/core/data/QuickChatBubble;

    .line 255
    .line 256
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->chatRoom:Lcom/p1/mobile/putong/core/data/ChatRoomBubble;

    .line 257
    .line 258
    if-nez p1, :cond_1a

    .line 259
    .line 260
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatRoomBubble;->new_()Lcom/p1/mobile/putong/core/data/ChatRoomBubble;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Bubbles;->chatRoom:Lcom/p1/mobile/putong/core/data/ChatRoomBubble;

    .line 265
    .line 266
    :cond_1a
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 267
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Bubbles$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Bubbles;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/Bubbles;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Bubbles;->ref:Lcom/p1/mobile/putong/core/data/Ref;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/Ref;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Bubbles;->type:Ljava/lang/String;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Bubbles;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Bubbles;->tracker:Ljava/lang/String;

    .line 28
    .line 29
    if-eqz p0, :cond_3

    .line 30
    .line 31
    const/4 v0, 0x4

    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Bubbles;->userID:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Bubbles;->content:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Bubbles;->photoURL:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Bubbles;->quickChat:Lcom/p1/mobile/putong/core/data/QuickChatBubble;

    .line 60
    .line 61
    if-eqz p0, :cond_7

    .line 62
    .line 63
    const/16 v0, 0x8

    .line 64
    .line 65
    sget-object v1, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 66
    .line 67
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 68
    .line 69
    .line 70
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Bubbles;->chatRoom:Lcom/p1/mobile/putong/core/data/ChatRoomBubble;

    .line 71
    .line 72
    if-eqz p0, :cond_8

    .line 73
    .line 74
    const/16 p1, 0x9

    .line 75
    .line 76
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatRoomBubble;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 77
    .line 78
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 79
    .line 80
    .line 81
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

    .line 82
    check-cast p1, Lcom/p1/mobile/putong/core/data/Bubbles;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Bubbles$1;->serialize(Lcom/p1/mobile/putong/core/data/Bubbles;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
