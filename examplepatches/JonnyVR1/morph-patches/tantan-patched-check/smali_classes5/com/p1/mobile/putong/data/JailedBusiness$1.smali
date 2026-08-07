.class Lcom/p1/mobile/putong/data/JailedBusiness$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/JailedBusiness;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/JailedBusiness;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/JailedBusiness;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/JailedBusiness;->groupChat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/JailedBusiness;->moment:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/JailedBusiness;->momentComment:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/JailedBusiness;->changeProfile:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x4

    .line 43
    sget-object v2, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/JailedBusiness;->swipe:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x5

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/JailedBusiness;->greeting:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 63
    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    const/4 v1, 0x6

    .line 67
    sget-object v2, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/JailedBusiness;->live:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 75
    .line 76
    if-eqz v0, :cond_6

    .line 77
    .line 78
    const/4 v1, 0x7

    .line 79
    sget-object v2, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/JailedBusiness;->chat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 87
    .line 88
    if-eqz v0, :cond_7

    .line 89
    .line 90
    const/16 v1, 0x8

    .line 91
    .line 92
    sget-object v2, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 100
    .line 101
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 102
    check-cast p1, Lcom/p1/mobile/putong/data/JailedBusiness;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/JailedBusiness$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/JailedBusiness;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/JailedBusiness;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/JailedBusiness;-><init>()V

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
    if-eqz v0, :cond_f

    .line 11
    .line 12
    const/16 v1, 0xa

    .line 13
    .line 14
    if-eq v0, v1, :cond_e

    .line 15
    .line 16
    const/16 v1, 0x12

    .line 17
    .line 18
    if-eq v0, v1, :cond_d

    .line 19
    .line 20
    const/16 v1, 0x1a

    .line 21
    .line 22
    if-eq v0, v1, :cond_c

    .line 23
    .line 24
    const/16 v1, 0x22

    .line 25
    .line 26
    if-eq v0, v1, :cond_b

    .line 27
    .line 28
    const/16 v1, 0x2a

    .line 29
    .line 30
    if-eq v0, v1, :cond_a

    .line 31
    .line 32
    const/16 v1, 0x32

    .line 33
    .line 34
    if-eq v0, v1, :cond_9

    .line 35
    .line 36
    const/16 v1, 0x3a

    .line 37
    .line 38
    if-eq v0, v1, :cond_8

    .line 39
    .line 40
    const/16 v1, 0x42

    .line 41
    .line 42
    if-eq v0, v1, :cond_7

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->groupChat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 45
    .line 46
    if-nez p1, :cond_0

    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/data/JailedGroupChat;->new_()Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->groupChat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 53
    .line 54
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->moment:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 55
    .line 56
    if-nez p1, :cond_1

    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/data/JailedGroupChat;->new_()Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iput-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->moment:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 63
    .line 64
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->momentComment:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 65
    .line 66
    if-nez p1, :cond_2

    .line 67
    .line 68
    invoke-static {}, Lcom/p1/mobile/putong/data/JailedGroupChat;->new_()Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iput-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->momentComment:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 73
    .line 74
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->changeProfile:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 75
    .line 76
    if-nez p1, :cond_3

    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/data/JailedGroupChat;->new_()Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->changeProfile:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 83
    .line 84
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->swipe:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 85
    .line 86
    if-nez p1, :cond_4

    .line 87
    .line 88
    invoke-static {}, Lcom/p1/mobile/putong/data/JailedGroupChat;->new_()Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iput-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->swipe:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 93
    .line 94
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->greeting:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 95
    .line 96
    if-nez p1, :cond_5

    .line 97
    .line 98
    invoke-static {}, Lcom/p1/mobile/putong/data/JailedGroupChat;->new_()Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iput-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->greeting:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 103
    .line 104
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->live:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 105
    .line 106
    if-nez p1, :cond_6

    .line 107
    .line 108
    invoke-static {}, Lcom/p1/mobile/putong/data/JailedGroupChat;->new_()Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    iput-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->live:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 113
    .line 114
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->chat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 115
    .line 116
    if-nez p1, :cond_17

    .line 117
    .line 118
    invoke-static {}, Lcom/p1/mobile/putong/data/JailedGroupChat;->new_()Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    iput-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->chat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 123
    .line 124
    return-object p0

    .line 125
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 126
    .line 127
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    check-cast v0, Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 132
    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->chat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 138
    .line 139
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    check-cast v0, Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 144
    .line 145
    iput-object v0, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->live:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :cond_9
    sget-object v0, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 150
    .line 151
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    check-cast v0, Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 156
    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->greeting:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :cond_a
    sget-object v0, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 162
    .line 163
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    check-cast v0, Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 168
    .line 169
    iput-object v0, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->swipe:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 170
    .line 171
    goto/16 :goto_0

    .line 172
    .line 173
    :cond_b
    sget-object v0, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 174
    .line 175
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    check-cast v0, Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 180
    .line 181
    iput-object v0, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->changeProfile:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 182
    .line 183
    goto/16 :goto_0

    .line 184
    .line 185
    :cond_c
    sget-object v0, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 186
    .line 187
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    check-cast v0, Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 192
    .line 193
    iput-object v0, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->momentComment:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :cond_d
    sget-object v0, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 198
    .line 199
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    check-cast v0, Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 204
    .line 205
    iput-object v0, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->moment:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 206
    .line 207
    goto/16 :goto_0

    .line 208
    .line 209
    :cond_e
    sget-object v0, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 210
    .line 211
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    check-cast v0, Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 216
    .line 217
    iput-object v0, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->groupChat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 218
    .line 219
    goto/16 :goto_0

    .line 220
    .line 221
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->groupChat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 222
    .line 223
    if-nez p1, :cond_10

    .line 224
    .line 225
    invoke-static {}, Lcom/p1/mobile/putong/data/JailedGroupChat;->new_()Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    iput-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->groupChat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 230
    .line 231
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->moment:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 232
    .line 233
    if-nez p1, :cond_11

    .line 234
    .line 235
    invoke-static {}, Lcom/p1/mobile/putong/data/JailedGroupChat;->new_()Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    iput-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->moment:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 240
    .line 241
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->momentComment:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 242
    .line 243
    if-nez p1, :cond_12

    .line 244
    .line 245
    invoke-static {}, Lcom/p1/mobile/putong/data/JailedGroupChat;->new_()Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    iput-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->momentComment:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 250
    .line 251
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->changeProfile:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 252
    .line 253
    if-nez p1, :cond_13

    .line 254
    .line 255
    invoke-static {}, Lcom/p1/mobile/putong/data/JailedGroupChat;->new_()Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    iput-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->changeProfile:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 260
    .line 261
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->swipe:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 262
    .line 263
    if-nez p1, :cond_14

    .line 264
    .line 265
    invoke-static {}, Lcom/p1/mobile/putong/data/JailedGroupChat;->new_()Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    iput-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->swipe:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 270
    .line 271
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->greeting:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 272
    .line 273
    if-nez p1, :cond_15

    .line 274
    .line 275
    invoke-static {}, Lcom/p1/mobile/putong/data/JailedGroupChat;->new_()Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    iput-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->greeting:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 280
    .line 281
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->live:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 282
    .line 283
    if-nez p1, :cond_16

    .line 284
    .line 285
    invoke-static {}, Lcom/p1/mobile/putong/data/JailedGroupChat;->new_()Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 286
    .line 287
    .line 288
    move-result-object p1

    .line 289
    iput-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->live:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 290
    .line 291
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->chat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 292
    .line 293
    if-nez p1, :cond_17

    .line 294
    .line 295
    invoke-static {}, Lcom/p1/mobile/putong/data/JailedGroupChat;->new_()Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 296
    .line 297
    .line 298
    move-result-object p1

    .line 299
    iput-object p1, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->chat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 300
    .line 301
    :cond_17
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 302
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/JailedBusiness$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/JailedBusiness;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/JailedBusiness;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/JailedBusiness;->groupChat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/JailedBusiness;->moment:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/JailedBusiness;->momentComment:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/JailedBusiness;->changeProfile:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 37
    .line 38
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/JailedBusiness;->swipe:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 42
    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    const/4 v0, 0x5

    .line 46
    sget-object v1, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 49
    .line 50
    .line 51
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/JailedBusiness;->greeting:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 52
    .line 53
    if-eqz p0, :cond_5

    .line 54
    .line 55
    const/4 v0, 0x6

    .line 56
    sget-object v1, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 57
    .line 58
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 59
    .line 60
    .line 61
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/JailedBusiness;->live:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 62
    .line 63
    if-eqz p0, :cond_6

    .line 64
    .line 65
    const/4 v0, 0x7

    .line 66
    sget-object v1, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 67
    .line 68
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 69
    .line 70
    .line 71
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/JailedBusiness;->chat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 72
    .line 73
    if-eqz p0, :cond_7

    .line 74
    .line 75
    const/16 p1, 0x8

    .line 76
    .line 77
    sget-object v0, Lcom/p1/mobile/putong/data/JailedGroupChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 80
    .line 81
    .line 82
    :cond_7
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 83
    check-cast p1, Lcom/p1/mobile/putong/data/JailedBusiness;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/JailedBusiness$1;->serialize(Lcom/p1/mobile/putong/data/JailedBusiness;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
