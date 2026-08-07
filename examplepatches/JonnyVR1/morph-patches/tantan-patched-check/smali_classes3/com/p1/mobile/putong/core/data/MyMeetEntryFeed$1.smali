.class Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->newCount:I

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->userIds:Ljava/util/List;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const/4 v2, 0x2

    .line 19
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->feedType:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    const/4 v1, 0x3

    .line 29
    sget-object v2, Lcom/p1/mobile/putong/core/data/FeedType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 30
    .line 31
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->momentText:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_2
    const/4 v0, 0x5

    .line 47
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->highPopSeeCount:I

    .line 48
    .line 49
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->subText:Ljava/lang/String;

    .line 55
    .line 56
    if-eqz v0, :cond_3

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
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->publishTime:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz v0, :cond_4

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
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->sortId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->id:Ljava/lang/String;

    .line 86
    .line 87
    if-eqz v0, :cond_6

    .line 88
    .line 89
    const/16 v1, 0x9

    .line 90
    .line 91
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    add-int/2addr p0, v0

    .line 96
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 97
    .line 98
    if-eqz v0, :cond_7

    .line 99
    .line 100
    const/16 v1, 0xa

    .line 101
    .line 102
    sget-object v2, Lcom/p1/mobile/putong/core/data/LiveType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 103
    .line 104
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    add-int/2addr p0, v0

    .line 109
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 110
    .line 111
    if-eqz v0, :cond_8

    .line 112
    .line 113
    const/16 v1, 0xb

    .line 114
    .line 115
    sget-object v2, Lcom/p1/mobile/putong/core/data/MeetRelation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 116
    .line 117
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    add-int/2addr p0, v0

    .line 122
    :cond_8
    const/16 v0, 0xc

    .line 123
    .line 124
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->publishTimestamp:J

    .line 125
    .line 126
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    add-int/2addr p0, v0

    .line 131
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 132
    .line 133
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 134
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->userIds:Ljava/util/List;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    new-instance p1, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->userIds:Ljava/util/List;

    .line 25
    .line 26
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->feedType:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 27
    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    sget-object p1, Lcom/p1/mobile/putong/core/data/FeedType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Lcom/p1/mobile/putong/core/data/FeedType;

    .line 37
    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->feedType:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 39
    .line 40
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 41
    .line 42
    if-nez p1, :cond_2

    .line 43
    .line 44
    sget-object p1, Lcom/p1/mobile/putong/core/data/LiveType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Lcom/p1/mobile/putong/core/data/LiveType;

    .line 51
    .line 52
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 53
    .line 54
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->momentText:Ljava/lang/String;

    .line 55
    .line 56
    if-nez p1, :cond_3

    .line 57
    .line 58
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->momentText:Ljava/lang/String;

    .line 59
    .line 60
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->subText:Ljava/lang/String;

    .line 61
    .line 62
    if-nez p1, :cond_4

    .line 63
    .line 64
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->subText:Ljava/lang/String;

    .line 65
    .line 66
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->publishTime:Ljava/lang/String;

    .line 67
    .line 68
    if-nez p1, :cond_5

    .line 69
    .line 70
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->publishTime:Ljava/lang/String;

    .line 71
    .line 72
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->sortId:Ljava/lang/String;

    .line 73
    .line 74
    if-nez p1, :cond_6

    .line 75
    .line 76
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->sortId:Ljava/lang/String;

    .line 77
    .line 78
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->id:Ljava/lang/String;

    .line 79
    .line 80
    if-nez p1, :cond_7

    .line 81
    .line 82
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->id:Ljava/lang/String;

    .line 83
    .line 84
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 85
    .line 86
    if-nez p1, :cond_10

    .line 87
    .line 88
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MeetRelation;->new_()Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 93
    .line 94
    return-object p0

    .line 95
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 96
    .line 97
    .line 98
    move-result-wide v0

    .line 99
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->publishTimestamp:J

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/MeetRelation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 103
    .line 104
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    check-cast v0, Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 109
    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/LiveType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 114
    .line 115
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    check-cast v0, Lcom/p1/mobile/putong/core/data/LiveType;

    .line 120
    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->id:Ljava/lang/String;

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->sortId:Ljava/lang/String;

    .line 136
    .line 137
    goto/16 :goto_0

    .line 138
    .line 139
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->publishTime:Ljava/lang/String;

    .line 144
    .line 145
    goto/16 :goto_0

    .line 146
    .line 147
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->subText:Ljava/lang/String;

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    iput v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->highPopSeeCount:I

    .line 160
    .line 161
    goto/16 :goto_0

    .line 162
    .line 163
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->momentText:Ljava/lang/String;

    .line 168
    .line 169
    goto/16 :goto_0

    .line 170
    .line 171
    :sswitch_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/FeedType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 172
    .line 173
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    check-cast v0, Lcom/p1/mobile/putong/core/data/FeedType;

    .line 178
    .line 179
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->feedType:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 180
    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :sswitch_a
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 184
    .line 185
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    check-cast v0, Ljava/util/List;

    .line 194
    .line 195
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->userIds:Ljava/util/List;

    .line 196
    .line 197
    goto/16 :goto_0

    .line 198
    .line 199
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    iput v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->newCount:I

    .line 204
    .line 205
    goto/16 :goto_0

    .line 206
    .line 207
    :sswitch_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->userIds:Ljava/util/List;

    .line 208
    .line 209
    if-nez p1, :cond_8

    .line 210
    .line 211
    new-instance p1, Ljava/util/ArrayList;

    .line 212
    .line 213
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 214
    .line 215
    .line 216
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->userIds:Ljava/util/List;

    .line 217
    .line 218
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->feedType:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 219
    .line 220
    if-nez p1, :cond_9

    .line 221
    .line 222
    sget-object p1, Lcom/p1/mobile/putong/core/data/FeedType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 223
    .line 224
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    check-cast p1, Lcom/p1/mobile/putong/core/data/FeedType;

    .line 229
    .line 230
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->feedType:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 231
    .line 232
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 233
    .line 234
    if-nez p1, :cond_a

    .line 235
    .line 236
    sget-object p1, Lcom/p1/mobile/putong/core/data/LiveType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 237
    .line 238
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    check-cast p1, Lcom/p1/mobile/putong/core/data/LiveType;

    .line 243
    .line 244
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 245
    .line 246
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->momentText:Ljava/lang/String;

    .line 247
    .line 248
    if-nez p1, :cond_b

    .line 249
    .line 250
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->momentText:Ljava/lang/String;

    .line 251
    .line 252
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->subText:Ljava/lang/String;

    .line 253
    .line 254
    if-nez p1, :cond_c

    .line 255
    .line 256
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->subText:Ljava/lang/String;

    .line 257
    .line 258
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->publishTime:Ljava/lang/String;

    .line 259
    .line 260
    if-nez p1, :cond_d

    .line 261
    .line 262
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->publishTime:Ljava/lang/String;

    .line 263
    .line 264
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->sortId:Ljava/lang/String;

    .line 265
    .line 266
    if-nez p1, :cond_e

    .line 267
    .line 268
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->sortId:Ljava/lang/String;

    .line 269
    .line 270
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->id:Ljava/lang/String;

    .line 271
    .line 272
    if-nez p1, :cond_f

    .line 273
    .line 274
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->id:Ljava/lang/String;

    .line 275
    .line 276
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 277
    .line 278
    if-nez p1, :cond_10

    .line 279
    .line 280
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MeetRelation;->new_()Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 285
    .line 286
    :cond_10
    return-object p0

    .line 287
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_c
        0x8 -> :sswitch_b
        0x12 -> :sswitch_a
        0x1a -> :sswitch_9
        0x22 -> :sswitch_8
        0x28 -> :sswitch_7
        0x32 -> :sswitch_6
        0x3a -> :sswitch_5
        0x42 -> :sswitch_4
        0x4a -> :sswitch_3
        0x52 -> :sswitch_2
        0x5a -> :sswitch_1
        0x60 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 287
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->newCount:I

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->userIds:Ljava/util/List;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x2

    .line 18
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->feedType:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/data/FeedType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->momentText:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    const/4 p0, 0x5

    .line 40
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->highPopSeeCount:I

    .line 41
    .line 42
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->subText:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz p0, :cond_3

    .line 48
    .line 49
    const/4 v0, 0x6

    .line 50
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->publishTime:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz p0, :cond_4

    .line 56
    .line 57
    const/4 v0, 0x7

    .line 58
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->sortId:Ljava/lang/String;

    .line 62
    .line 63
    if-eqz p0, :cond_5

    .line 64
    .line 65
    const/16 v0, 0x8

    .line 66
    .line 67
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->id:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz p0, :cond_6

    .line 73
    .line 74
    const/16 v0, 0x9

    .line 75
    .line 76
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 80
    .line 81
    if-eqz p0, :cond_7

    .line 82
    .line 83
    const/16 v0, 0xa

    .line 84
    .line 85
    sget-object v1, Lcom/p1/mobile/putong/core/data/LiveType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 86
    .line 87
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 88
    .line 89
    .line 90
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 91
    .line 92
    if-eqz p0, :cond_8

    .line 93
    .line 94
    const/16 v0, 0xb

    .line 95
    .line 96
    sget-object v1, Lcom/p1/mobile/putong/core/data/MeetRelation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 97
    .line 98
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 99
    .line 100
    .line 101
    :cond_8
    const/16 p0, 0xc

    .line 102
    .line 103
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->publishTimestamp:J

    .line 104
    .line 105
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 109
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed$1;->serialize(Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
