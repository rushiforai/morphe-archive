.class Lcom/p1/mobile/putong/core/data/MyMeetFeedItem$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->sortId:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/4 v1, 0x2

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentId:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const/4 v1, 0x3

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x4

    .line 43
    sget-object v2, Lcom/p1/mobile/putong/core/data/FeedType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x5

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/core/data/MeetRelation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->overheating:Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 63
    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    const/4 v1, 0x6

    .line 67
    sget-object v2, Lcom/p1/mobile/putong/core/data/OverHeatingStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    const/4 v0, 0x7

    .line 75
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->seeCount:I

    .line 76
    .line 77
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    add-int/2addr p0, v0

    .line 82
    const/16 v0, 0x8

    .line 83
    .line 84
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->lowPopSeeCount:I

    .line 85
    .line 86
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    add-int/2addr p0, v0

    .line 91
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->pick:Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 92
    .line 93
    if-eqz v0, :cond_6

    .line 94
    .line 95
    const/16 v1, 0x9

    .line 96
    .line 97
    sget-object v2, Lcom/p1/mobile/putong/core/data/PickInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 98
    .line 99
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    add-int/2addr p0, v0

    .line 104
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->id:Ljava/lang/String;

    .line 105
    .line 106
    if-eqz v0, :cond_7

    .line 107
    .line 108
    const/16 v1, 0xa

    .line 109
    .line 110
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    add-int/2addr p0, v0

    .line 115
    :cond_7
    const/16 v0, 0xb

    .line 116
    .line 117
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->readStatus:I

    .line 118
    .line 119
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    add-int/2addr p0, v0

    .line 124
    const/16 v0, 0xc

    .line 125
    .line 126
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->online:Z

    .line 127
    .line 128
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    add-int/2addr p0, v0

    .line 133
    const/16 v0, 0xd

    .line 134
    .line 135
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->passBy:Z

    .line 136
    .line 137
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    add-int/2addr p0, v0

    .line 142
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentMediaType:Ljava/lang/String;

    .line 143
    .line 144
    if-eqz v0, :cond_8

    .line 145
    .line 146
    const/16 v1, 0xe

    .line 147
    .line 148
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    add-int/2addr p0, v0

    .line 153
    :cond_8
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 154
    .line 155
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 156
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->id:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->id:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    new-instance p1, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 31
    .line 32
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->sortId:Ljava/lang/String;

    .line 33
    .line 34
    if-nez p1, :cond_2

    .line 35
    .line 36
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->sortId:Ljava/lang/String;

    .line 37
    .line 38
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentId:Ljava/lang/String;

    .line 39
    .line 40
    if-nez p1, :cond_3

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentId:Ljava/lang/String;

    .line 43
    .line 44
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 45
    .line 46
    if-nez p1, :cond_4

    .line 47
    .line 48
    sget-object p1, Lcom/p1/mobile/putong/core/data/FeedType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Lcom/p1/mobile/putong/core/data/FeedType;

    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 57
    .line 58
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 59
    .line 60
    if-nez p1, :cond_5

    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MeetRelation;->new_()Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 67
    .line 68
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->overheating:Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 69
    .line 70
    if-nez p1, :cond_6

    .line 71
    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/core/data/OverHeatingStatus;->new_()Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->overheating:Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 77
    .line 78
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->pick:Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 79
    .line 80
    if-nez p1, :cond_7

    .line 81
    .line 82
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PickInfo;->new_()Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->pick:Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 87
    .line 88
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentMediaType:Ljava/lang/String;

    .line 89
    .line 90
    if-nez p1, :cond_10

    .line 91
    .line 92
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentMediaType:Ljava/lang/String;

    .line 93
    .line 94
    return-object p0

    .line 95
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentMediaType:Ljava/lang/String;

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->passBy:Z

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->online:Z

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    iput v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->readStatus:I

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->id:Ljava/lang/String;

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :sswitch_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/PickInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 131
    .line 132
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    check-cast v0, Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 137
    .line 138
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->pick:Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    iput v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->lowPopSeeCount:I

    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    iput v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->seeCount:I

    .line 155
    .line 156
    goto/16 :goto_0

    .line 157
    .line 158
    :sswitch_8
    sget-object v0, Lcom/p1/mobile/putong/core/data/OverHeatingStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 159
    .line 160
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    check-cast v0, Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 165
    .line 166
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->overheating:Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/MeetRelation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 171
    .line 172
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    check-cast v0, Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 177
    .line 178
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 179
    .line 180
    goto/16 :goto_0

    .line 181
    .line 182
    :sswitch_a
    sget-object v0, Lcom/p1/mobile/putong/core/data/FeedType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 183
    .line 184
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    check-cast v0, Lcom/p1/mobile/putong/core/data/FeedType;

    .line 189
    .line 190
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentId:Ljava/lang/String;

    .line 199
    .line 200
    goto/16 :goto_0

    .line 201
    .line 202
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->sortId:Ljava/lang/String;

    .line 207
    .line 208
    goto/16 :goto_0

    .line 209
    .line 210
    :sswitch_d
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 211
    .line 212
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    check-cast v0, Ljava/util/List;

    .line 221
    .line 222
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->id:Ljava/lang/String;

    .line 227
    .line 228
    if-nez p1, :cond_8

    .line 229
    .line 230
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->id:Ljava/lang/String;

    .line 231
    .line 232
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 233
    .line 234
    if-nez p1, :cond_9

    .line 235
    .line 236
    new-instance p1, Ljava/util/ArrayList;

    .line 237
    .line 238
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 239
    .line 240
    .line 241
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 242
    .line 243
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->sortId:Ljava/lang/String;

    .line 244
    .line 245
    if-nez p1, :cond_a

    .line 246
    .line 247
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->sortId:Ljava/lang/String;

    .line 248
    .line 249
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentId:Ljava/lang/String;

    .line 250
    .line 251
    if-nez p1, :cond_b

    .line 252
    .line 253
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentId:Ljava/lang/String;

    .line 254
    .line 255
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 256
    .line 257
    if-nez p1, :cond_c

    .line 258
    .line 259
    sget-object p1, Lcom/p1/mobile/putong/core/data/FeedType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 260
    .line 261
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    check-cast p1, Lcom/p1/mobile/putong/core/data/FeedType;

    .line 266
    .line 267
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 268
    .line 269
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 270
    .line 271
    if-nez p1, :cond_d

    .line 272
    .line 273
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MeetRelation;->new_()Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 274
    .line 275
    .line 276
    move-result-object p1

    .line 277
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 278
    .line 279
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->overheating:Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 280
    .line 281
    if-nez p1, :cond_e

    .line 282
    .line 283
    invoke-static {}, Lcom/p1/mobile/putong/core/data/OverHeatingStatus;->new_()Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 284
    .line 285
    .line 286
    move-result-object p1

    .line 287
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->overheating:Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 288
    .line 289
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->pick:Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 290
    .line 291
    if-nez p1, :cond_f

    .line 292
    .line 293
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PickInfo;->new_()Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 294
    .line 295
    .line 296
    move-result-object p1

    .line 297
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->pick:Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 298
    .line 299
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentMediaType:Ljava/lang/String;

    .line 300
    .line 301
    if-nez p1, :cond_10

    .line 302
    .line 303
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentMediaType:Ljava/lang/String;

    .line 304
    .line 305
    :cond_10
    return-object p0

    .line 306
    nop

    .line 307
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_e
        0xa -> :sswitch_d
        0x12 -> :sswitch_c
        0x1a -> :sswitch_b
        0x22 -> :sswitch_a
        0x2a -> :sswitch_9
        0x32 -> :sswitch_8
        0x38 -> :sswitch_7
        0x40 -> :sswitch_6
        0x4a -> :sswitch_5
        0x52 -> :sswitch_4
        0x58 -> :sswitch_3
        0x60 -> :sswitch_2
        0x68 -> :sswitch_1
        0x72 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 307
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->sortId:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x2

    .line 20
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentId:Ljava/lang/String;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x3

    .line 28
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/core/data/FeedType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 37
    .line 38
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 42
    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    const/4 v0, 0x5

    .line 46
    sget-object v1, Lcom/p1/mobile/putong/core/data/MeetRelation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 49
    .line 50
    .line 51
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->overheating:Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 52
    .line 53
    if-eqz p0, :cond_5

    .line 54
    .line 55
    const/4 v0, 0x6

    .line 56
    sget-object v1, Lcom/p1/mobile/putong/core/data/OverHeatingStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 57
    .line 58
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 59
    .line 60
    .line 61
    :cond_5
    const/4 p0, 0x7

    .line 62
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->seeCount:I

    .line 63
    .line 64
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 65
    .line 66
    .line 67
    const/16 p0, 0x8

    .line 68
    .line 69
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->lowPopSeeCount:I

    .line 70
    .line 71
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->pick:Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 75
    .line 76
    if-eqz p0, :cond_6

    .line 77
    .line 78
    const/16 v0, 0x9

    .line 79
    .line 80
    sget-object v1, Lcom/p1/mobile/putong/core/data/PickInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 81
    .line 82
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 83
    .line 84
    .line 85
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->id:Ljava/lang/String;

    .line 86
    .line 87
    if-eqz p0, :cond_7

    .line 88
    .line 89
    const/16 v0, 0xa

    .line 90
    .line 91
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 92
    .line 93
    .line 94
    :cond_7
    const/16 p0, 0xb

    .line 95
    .line 96
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->readStatus:I

    .line 97
    .line 98
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 99
    .line 100
    .line 101
    const/16 p0, 0xc

    .line 102
    .line 103
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->online:Z

    .line 104
    .line 105
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 106
    .line 107
    .line 108
    const/16 p0, 0xd

    .line 109
    .line 110
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->passBy:Z

    .line 111
    .line 112
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 113
    .line 114
    .line 115
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentMediaType:Ljava/lang/String;

    .line 116
    .line 117
    if-eqz p0, :cond_8

    .line 118
    .line 119
    const/16 p1, 0xe

    .line 120
    .line 121
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 122
    .line 123
    .line 124
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

    .line 125
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem$1;->serialize(Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
