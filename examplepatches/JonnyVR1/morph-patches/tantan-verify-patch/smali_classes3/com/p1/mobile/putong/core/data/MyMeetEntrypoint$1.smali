.class Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->boost:Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->picks:Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x4

    .line 43
    sget-object v2, Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->see:Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x5

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->summarizedPrivileges:Ljava/util/List;

    .line 63
    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    sget-object v1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    const/4 v2, 0x6

    .line 73
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    add-int/2addr p0, v0

    .line 78
    :cond_5
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 79
    .line 80
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 81
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;-><init>()V

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
    if-eqz v0, :cond_b

    .line 11
    .line 12
    const/16 v1, 0xa

    .line 13
    .line 14
    if-eq v0, v1, :cond_a

    .line 15
    .line 16
    const/16 v1, 0x12

    .line 17
    .line 18
    if-eq v0, v1, :cond_9

    .line 19
    .line 20
    const/16 v1, 0x1a

    .line 21
    .line 22
    if-eq v0, v1, :cond_8

    .line 23
    .line 24
    const/16 v1, 0x22

    .line 25
    .line 26
    if-eq v0, v1, :cond_7

    .line 27
    .line 28
    const/16 v1, 0x2a

    .line 29
    .line 30
    if-eq v0, v1, :cond_6

    .line 31
    .line 32
    const/16 v1, 0x32

    .line 33
    .line 34
    if-eq v0, v1, :cond_5

    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->boost:Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

    .line 37
    .line 38
    if-nez p1, :cond_0

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;->new_()Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->boost:Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

    .line 45
    .line 46
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 47
    .line 48
    if-nez p1, :cond_1

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;->new_()Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 55
    .line 56
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 57
    .line 58
    if-nez p1, :cond_2

    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->new_()Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 65
    .line 66
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->picks:Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;

    .line 67
    .line 68
    if-nez p1, :cond_3

    .line 69
    .line 70
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;->new_()Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->picks:Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;

    .line 75
    .line 76
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->see:Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;

    .line 77
    .line 78
    if-nez p1, :cond_4

    .line 79
    .line 80
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;->new_()Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->see:Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;

    .line 85
    .line 86
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->summarizedPrivileges:Ljava/util/List;

    .line 87
    .line 88
    if-nez p1, :cond_11

    .line 89
    .line 90
    new-instance p1, Ljava/util/ArrayList;

    .line 91
    .line 92
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 93
    .line 94
    .line 95
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->summarizedPrivileges:Ljava/util/List;

    .line 96
    .line 97
    return-object p0

    .line 98
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    check-cast v0, Ljava/util/List;

    .line 109
    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->summarizedPrivileges:Ljava/util/List;

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 114
    .line 115
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    check-cast v0, Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;

    .line 120
    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->see:Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 125
    .line 126
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    check-cast v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;

    .line 131
    .line 132
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->picks:Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;

    .line 133
    .line 134
    goto/16 :goto_0

    .line 135
    .line 136
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 137
    .line 138
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    check-cast v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 143
    .line 144
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 145
    .line 146
    goto/16 :goto_0

    .line 147
    .line 148
    :cond_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 149
    .line 150
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    check-cast v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 155
    .line 156
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :cond_a
    sget-object v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 161
    .line 162
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    check-cast v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

    .line 167
    .line 168
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->boost:Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->boost:Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

    .line 173
    .line 174
    if-nez p1, :cond_c

    .line 175
    .line 176
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;->new_()Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->boost:Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

    .line 181
    .line 182
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 183
    .line 184
    if-nez p1, :cond_d

    .line 185
    .line 186
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;->new_()Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 191
    .line 192
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 193
    .line 194
    if-nez p1, :cond_e

    .line 195
    .line 196
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->new_()Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 201
    .line 202
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->picks:Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;

    .line 203
    .line 204
    if-nez p1, :cond_f

    .line 205
    .line 206
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;->new_()Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->picks:Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;

    .line 211
    .line 212
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->see:Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;

    .line 213
    .line 214
    if-nez p1, :cond_10

    .line 215
    .line 216
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;->new_()Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->see:Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;

    .line 221
    .line 222
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->summarizedPrivileges:Ljava/util/List;

    .line 223
    .line 224
    if-nez p1, :cond_11

    .line 225
    .line 226
    new-instance p1, Ljava/util/ArrayList;

    .line 227
    .line 228
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 229
    .line 230
    .line 231
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->summarizedPrivileges:Ljava/util/List;

    .line 232
    .line 233
    :cond_11
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 234
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->boost:Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->picks:Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 37
    .line 38
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->see:Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;

    .line 42
    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    const/4 v0, 0x5

    .line 46
    sget-object v1, Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 49
    .line 50
    .line 51
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->summarizedPrivileges:Ljava/util/List;

    .line 52
    .line 53
    if-eqz p0, :cond_5

    .line 54
    .line 55
    sget-object p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const/4 v0, 0x6

    .line 62
    invoke-virtual {p2, v0, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 63
    .line 64
    .line 65
    :cond_5
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 66
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint$1;->serialize(Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
