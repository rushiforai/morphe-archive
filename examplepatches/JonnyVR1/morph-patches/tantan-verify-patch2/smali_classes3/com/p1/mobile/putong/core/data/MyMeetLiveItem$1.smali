.class Lcom/p1/mobile/putong/core/data/MyMeetLiveItem$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->userId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->roomId:Ljava/lang/String;

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
    const/4 v0, 0x3

    .line 23
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksUser:Z

    .line 24
    .line 25
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x4

    .line 35
    sget-object v2, Lcom/p1/mobile/putong/core/data/LiveType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 36
    .line 37
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 43
    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    const/4 v1, 0x5

    .line 47
    sget-object v2, Lcom/p1/mobile/putong/core/data/MeetRelation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 48
    .line 49
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->follow:Lcom/p1/mobile/putong/core/data/MeetFollow;

    .line 55
    .line 56
    if-eqz v0, :cond_4

    .line 57
    .line 58
    const/4 v1, 0x6

    .line 59
    sget-object v2, Lcom/p1/mobile/putong/core/data/MeetFollow;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 60
    .line 61
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    :cond_4
    const/4 v0, 0x7

    .line 67
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->anonymous:Z

    .line 68
    .line 69
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksTracker:Ljava/lang/String;

    .line 75
    .line 76
    if-eqz v0, :cond_5

    .line 77
    .line 78
    const/16 v1, 0x8

    .line 79
    .line 80
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    add-int/2addr p0, v0

    .line 85
    :cond_5
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 86
    .line 87
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 88
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;-><init>()V

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
    if-eqz v0, :cond_d

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_c

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_b

    .line 21
    .line 22
    const/16 v2, 0x18

    .line 23
    .line 24
    if-eq v0, v2, :cond_a

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_9

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_8

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_7

    .line 37
    .line 38
    const/16 v2, 0x38

    .line 39
    .line 40
    if-eq v0, v2, :cond_6

    .line 41
    .line 42
    const/16 v2, 0x42

    .line 43
    .line 44
    if-eq v0, v2, :cond_5

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->userId:Ljava/lang/String;

    .line 47
    .line 48
    if-nez p1, :cond_0

    .line 49
    .line 50
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->userId:Ljava/lang/String;

    .line 51
    .line 52
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->roomId:Ljava/lang/String;

    .line 53
    .line 54
    if-nez p1, :cond_1

    .line 55
    .line 56
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->roomId:Ljava/lang/String;

    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    sget-object p1, Lcom/p1/mobile/putong/core/data/LiveType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Lcom/p1/mobile/putong/core/data/LiveType;

    .line 69
    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 71
    .line 72
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 73
    .line 74
    if-nez p1, :cond_3

    .line 75
    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MeetRelation;->new_()Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 81
    .line 82
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->follow:Lcom/p1/mobile/putong/core/data/MeetFollow;

    .line 83
    .line 84
    if-nez p1, :cond_4

    .line 85
    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MeetFollow;->new_()Lcom/p1/mobile/putong/core/data/MeetFollow;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->follow:Lcom/p1/mobile/putong/core/data/MeetFollow;

    .line 91
    .line 92
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksTracker:Ljava/lang/String;

    .line 93
    .line 94
    if-nez p1, :cond_13

    .line 95
    .line 96
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksTracker:Ljava/lang/String;

    .line 97
    .line 98
    return-object p0

    .line 99
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksTracker:Ljava/lang/String;

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->anonymous:Z

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/core/data/MeetFollow;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 114
    .line 115
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    check-cast v0, Lcom/p1/mobile/putong/core/data/MeetFollow;

    .line 120
    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->follow:Lcom/p1/mobile/putong/core/data/MeetFollow;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/core/data/MeetRelation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 125
    .line 126
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    check-cast v0, Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 131
    .line 132
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 133
    .line 134
    goto/16 :goto_0

    .line 135
    .line 136
    :cond_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/LiveType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 137
    .line 138
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    check-cast v0, Lcom/p1/mobile/putong/core/data/LiveType;

    .line 143
    .line 144
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 145
    .line 146
    goto/16 :goto_0

    .line 147
    .line 148
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksUser:Z

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->roomId:Ljava/lang/String;

    .line 161
    .line 162
    goto/16 :goto_0

    .line 163
    .line 164
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->userId:Ljava/lang/String;

    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->userId:Ljava/lang/String;

    .line 173
    .line 174
    if-nez p1, :cond_e

    .line 175
    .line 176
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->userId:Ljava/lang/String;

    .line 177
    .line 178
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->roomId:Ljava/lang/String;

    .line 179
    .line 180
    if-nez p1, :cond_f

    .line 181
    .line 182
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->roomId:Ljava/lang/String;

    .line 183
    .line 184
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 185
    .line 186
    if-nez p1, :cond_10

    .line 187
    .line 188
    sget-object p1, Lcom/p1/mobile/putong/core/data/LiveType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 189
    .line 190
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    check-cast p1, Lcom/p1/mobile/putong/core/data/LiveType;

    .line 195
    .line 196
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 197
    .line 198
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 199
    .line 200
    if-nez p1, :cond_11

    .line 201
    .line 202
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MeetRelation;->new_()Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 207
    .line 208
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->follow:Lcom/p1/mobile/putong/core/data/MeetFollow;

    .line 209
    .line 210
    if-nez p1, :cond_12

    .line 211
    .line 212
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MeetFollow;->new_()Lcom/p1/mobile/putong/core/data/MeetFollow;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->follow:Lcom/p1/mobile/putong/core/data/MeetFollow;

    .line 217
    .line 218
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksTracker:Ljava/lang/String;

    .line 219
    .line 220
    if-nez p1, :cond_13

    .line 221
    .line 222
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksTracker:Ljava/lang/String;

    .line 223
    .line 224
    :cond_13
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 225
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->userId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->roomId:Ljava/lang/String;

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
    const/4 p0, 0x3

    .line 18
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksUser:Z

    .line 19
    .line 20
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x4

    .line 28
    sget-object v1, Lcom/p1/mobile/putong/core/data/LiveType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 29
    .line 30
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 34
    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    const/4 v0, 0x5

    .line 38
    sget-object v1, Lcom/p1/mobile/putong/core/data/MeetRelation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 39
    .line 40
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 41
    .line 42
    .line 43
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->follow:Lcom/p1/mobile/putong/core/data/MeetFollow;

    .line 44
    .line 45
    if-eqz p0, :cond_4

    .line 46
    .line 47
    const/4 v0, 0x6

    .line 48
    sget-object v1, Lcom/p1/mobile/putong/core/data/MeetFollow;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 49
    .line 50
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 51
    .line 52
    .line 53
    :cond_4
    const/4 p0, 0x7

    .line 54
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->anonymous:Z

    .line 55
    .line 56
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksTracker:Ljava/lang/String;

    .line 60
    .line 61
    if-eqz p0, :cond_5

    .line 62
    .line 63
    const/16 p1, 0x8

    .line 64
    .line 65
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 66
    .line 67
    .line 68
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

    .line 69
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem$1;->serialize(Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
