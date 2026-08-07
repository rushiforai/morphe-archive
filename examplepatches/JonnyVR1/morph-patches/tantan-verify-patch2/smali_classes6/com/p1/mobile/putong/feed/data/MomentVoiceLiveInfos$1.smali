.class Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/2addr p0, v0

    .line 18
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->anchorUserID:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/16 v1, 0x33

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    add-int/2addr p0, v0

    .line 29
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->liveID:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    const/16 v1, 0x34

    .line 34
    .line 35
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->roomID:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    const/16 v1, 0x35

    .line 45
    .line 46
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    add-int/2addr p0, v0

    .line 51
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->schemaSearch:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz v0, :cond_4

    .line 54
    .line 55
    const/16 v1, 0x36

    .line 56
    .line 57
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_4
    const/16 v0, 0x37

    .line 63
    .line 64
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberCount:I

    .line 65
    .line 66
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    add-int/2addr p0, v0

    .line 71
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->state:Lcom/p1/mobile/putong/feed/data/LiveType;

    .line 72
    .line 73
    if-eqz v0, :cond_5

    .line 74
    .line 75
    const/16 v1, 0x38

    .line 76
    .line 77
    sget-object v2, Lcom/p1/mobile/putong/feed/data/LiveType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 78
    .line 79
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    add-int/2addr p0, v0

    .line 84
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->title:Ljava/lang/String;

    .line 85
    .line 86
    if-eqz v0, :cond_6

    .line 87
    .line 88
    const/16 v1, 0x39

    .line 89
    .line 90
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    add-int/2addr p0, v0

    .line 95
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicID:Ljava/lang/String;

    .line 96
    .line 97
    if-eqz v0, :cond_7

    .line 98
    .line 99
    const/16 v1, 0x3a

    .line 100
    .line 101
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    add-int/2addr p0, v0

    .line 106
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberUsers:Ljava/util/List;

    .line 107
    .line 108
    if-eqz v0, :cond_8

    .line 109
    .line 110
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MemberUsers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 111
    .line 112
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    const/16 v2, 0x3b

    .line 117
    .line 118
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    add-int/2addr p0, v0

    .line 123
    :cond_8
    const/16 v0, 0x3c

    .line 124
    .line 125
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->audienceCount:I

    .line 126
    .line 127
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    add-int/2addr p0, v0

    .line 132
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicName:Ljava/lang/String;

    .line 133
    .line 134
    if-eqz v0, :cond_9

    .line 135
    .line 136
    const/16 v1, 0x3d

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
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 144
    .line 145
    if-eqz v0, :cond_a

    .line 146
    .line 147
    const/16 v1, 0x3e

    .line 148
    .line 149
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 150
    .line 151
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    add-int/2addr p0, v0

    .line 156
    :cond_a
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 157
    .line 158
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 159
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->anchorUserID:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->anchorUserID:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->liveID:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->liveID:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->roomID:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->roomID:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->schemaSearch:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->schemaSearch:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->state:Lcom/p1/mobile/putong/feed/data/LiveType;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    sget-object p1, Lcom/p1/mobile/putong/feed/data/LiveType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Lcom/p1/mobile/putong/feed/data/LiveType;

    .line 50
    .line 51
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->state:Lcom/p1/mobile/putong/feed/data/LiveType;

    .line 52
    .line 53
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->title:Ljava/lang/String;

    .line 54
    .line 55
    if-nez p1, :cond_5

    .line 56
    .line 57
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->title:Ljava/lang/String;

    .line 58
    .line 59
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicID:Ljava/lang/String;

    .line 60
    .line 61
    if-nez p1, :cond_6

    .line 62
    .line 63
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicID:Ljava/lang/String;

    .line 64
    .line 65
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberUsers:Ljava/util/List;

    .line 66
    .line 67
    if-nez p1, :cond_7

    .line 68
    .line 69
    new-instance p1, Ljava/util/ArrayList;

    .line 70
    .line 71
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberUsers:Ljava/util/List;

    .line 75
    .line 76
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicName:Ljava/lang/String;

    .line 77
    .line 78
    if-nez p1, :cond_8

    .line 79
    .line 80
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicName:Ljava/lang/String;

    .line 81
    .line 82
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 83
    .line 84
    if-nez p1, :cond_12

    .line 85
    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;->new_()Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 91
    .line 92
    return-object p0

    .line 93
    :sswitch_0
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 100
    .line 101
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicName:Ljava/lang/String;

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->audienceCount:I

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MemberUsers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 119
    .line 120
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    check-cast v0, Ljava/util/List;

    .line 129
    .line 130
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberUsers:Ljava/util/List;

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicID:Ljava/lang/String;

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->title:Ljava/lang/String;

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :sswitch_6
    sget-object v0, Lcom/p1/mobile/putong/feed/data/LiveType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 150
    .line 151
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    check-cast v0, Lcom/p1/mobile/putong/feed/data/LiveType;

    .line 156
    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->state:Lcom/p1/mobile/putong/feed/data/LiveType;

    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberCount:I

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->schemaSearch:Ljava/lang/String;

    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->roomID:Ljava/lang/String;

    .line 182
    .line 183
    goto/16 :goto_0

    .line 184
    .line 185
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->liveID:Ljava/lang/String;

    .line 190
    .line 191
    goto/16 :goto_0

    .line 192
    .line 193
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->anchorUserID:Ljava/lang/String;

    .line 198
    .line 199
    goto/16 :goto_0

    .line 200
    .line 201
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    iput-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 206
    .line 207
    goto/16 :goto_0

    .line 208
    .line 209
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 210
    .line 211
    .line 212
    move-result-wide v0

    .line 213
    iput-wide v0, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 214
    .line 215
    goto/16 :goto_0

    .line 216
    .line 217
    :sswitch_e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->anchorUserID:Ljava/lang/String;

    .line 218
    .line 219
    if-nez p1, :cond_9

    .line 220
    .line 221
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->anchorUserID:Ljava/lang/String;

    .line 222
    .line 223
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->liveID:Ljava/lang/String;

    .line 224
    .line 225
    if-nez p1, :cond_a

    .line 226
    .line 227
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->liveID:Ljava/lang/String;

    .line 228
    .line 229
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->roomID:Ljava/lang/String;

    .line 230
    .line 231
    if-nez p1, :cond_b

    .line 232
    .line 233
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->roomID:Ljava/lang/String;

    .line 234
    .line 235
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->schemaSearch:Ljava/lang/String;

    .line 236
    .line 237
    if-nez p1, :cond_c

    .line 238
    .line 239
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->schemaSearch:Ljava/lang/String;

    .line 240
    .line 241
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->state:Lcom/p1/mobile/putong/feed/data/LiveType;

    .line 242
    .line 243
    if-nez p1, :cond_d

    .line 244
    .line 245
    sget-object p1, Lcom/p1/mobile/putong/feed/data/LiveType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 246
    .line 247
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    check-cast p1, Lcom/p1/mobile/putong/feed/data/LiveType;

    .line 252
    .line 253
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->state:Lcom/p1/mobile/putong/feed/data/LiveType;

    .line 254
    .line 255
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->title:Ljava/lang/String;

    .line 256
    .line 257
    if-nez p1, :cond_e

    .line 258
    .line 259
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->title:Ljava/lang/String;

    .line 260
    .line 261
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicID:Ljava/lang/String;

    .line 262
    .line 263
    if-nez p1, :cond_f

    .line 264
    .line 265
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicID:Ljava/lang/String;

    .line 266
    .line 267
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberUsers:Ljava/util/List;

    .line 268
    .line 269
    if-nez p1, :cond_10

    .line 270
    .line 271
    new-instance p1, Ljava/util/ArrayList;

    .line 272
    .line 273
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 274
    .line 275
    .line 276
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberUsers:Ljava/util/List;

    .line 277
    .line 278
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicName:Ljava/lang/String;

    .line 279
    .line 280
    if-nez p1, :cond_11

    .line 281
    .line 282
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicName:Ljava/lang/String;

    .line 283
    .line 284
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 285
    .line 286
    if-nez p1, :cond_12

    .line 287
    .line 288
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;->new_()Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 289
    .line 290
    .line 291
    move-result-object p1

    .line 292
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 293
    .line 294
    :cond_12
    return-object p0

    .line 295
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_e
        0x8 -> :sswitch_d
        0x12 -> :sswitch_c
        0x19a -> :sswitch_b
        0x1a2 -> :sswitch_a
        0x1aa -> :sswitch_9
        0x1b2 -> :sswitch_8
        0x1b8 -> :sswitch_7
        0x1c2 -> :sswitch_6
        0x1ca -> :sswitch_5
        0x1d2 -> :sswitch_4
        0x1da -> :sswitch_3
        0x1e0 -> :sswitch_2
        0x1ea -> :sswitch_1
        0x1f2 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 295
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->anchorUserID:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/16 v0, 0x33

    .line 20
    .line 21
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->liveID:Ljava/lang/String;

    .line 25
    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    const/16 v0, 0x34

    .line 29
    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->roomID:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    const/16 v0, 0x35

    .line 38
    .line 39
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->schemaSearch:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz p0, :cond_4

    .line 45
    .line 46
    const/16 v0, 0x36

    .line 47
    .line 48
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_4
    const/16 p0, 0x37

    .line 52
    .line 53
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberCount:I

    .line 54
    .line 55
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->state:Lcom/p1/mobile/putong/feed/data/LiveType;

    .line 59
    .line 60
    if-eqz p0, :cond_5

    .line 61
    .line 62
    const/16 v0, 0x38

    .line 63
    .line 64
    sget-object v1, Lcom/p1/mobile/putong/feed/data/LiveType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 65
    .line 66
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 67
    .line 68
    .line 69
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->title:Ljava/lang/String;

    .line 70
    .line 71
    if-eqz p0, :cond_6

    .line 72
    .line 73
    const/16 v0, 0x39

    .line 74
    .line 75
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicID:Ljava/lang/String;

    .line 79
    .line 80
    if-eqz p0, :cond_7

    .line 81
    .line 82
    const/16 v0, 0x3a

    .line 83
    .line 84
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->memberUsers:Ljava/util/List;

    .line 88
    .line 89
    if-eqz p0, :cond_8

    .line 90
    .line 91
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MemberUsers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    const/16 v1, 0x3b

    .line 98
    .line 99
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 100
    .line 101
    .line 102
    :cond_8
    const/16 p0, 0x3c

    .line 103
    .line 104
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->audienceCount:I

    .line 105
    .line 106
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicName:Ljava/lang/String;

    .line 110
    .line 111
    if-eqz p0, :cond_9

    .line 112
    .line 113
    const/16 v0, 0x3d

    .line 114
    .line 115
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 116
    .line 117
    .line 118
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 119
    .line 120
    if-eqz p0, :cond_a

    .line 121
    .line 122
    const/16 p1, 0x3e

    .line 123
    .line 124
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 125
    .line 126
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 127
    .line 128
    .line 129
    :cond_a
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 130
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos$1;->serialize(Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
