.class Lcom/p1/mobile/putong/feed/data/MomentActivity$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/MomentActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/MomentActivity;)I
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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->value:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->owner:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 52
    .line 53
    if-eqz v0, :cond_4

    .line 54
    .line 55
    const/16 v1, 0x36

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    :cond_4
    const/16 v0, 0x37

    .line 67
    .line 68
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->read:Z

    .line 69
    .line 70
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    add-int/2addr p0, v0

    .line 75
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 76
    .line 77
    if-eqz v0, :cond_5

    .line 78
    .line 79
    const/16 v1, 0x38

    .line 80
    .line 81
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 82
    .line 83
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    add-int/2addr p0, v0

    .line 88
    :cond_5
    const/16 v0, 0x39

    .line 89
    .line 90
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->createdTime:D

    .line 91
    .line 92
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    add-int/2addr p0, v0

    .line 97
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->messageid:Ljava/lang/String;

    .line 98
    .line 99
    if-eqz v0, :cond_6

    .line 100
    .line 101
    const/16 v1, 0x3a

    .line 102
    .line 103
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    add-int/2addr p0, v0

    .line 108
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->settings:Lcom/p1/mobile/putong/feed/data/ActivitySetting;

    .line 109
    .line 110
    if-eqz v0, :cond_7

    .line 111
    .line 112
    const/16 v1, 0x3b

    .line 113
    .line 114
    sget-object v2, Lcom/p1/mobile/putong/feed/data/ActivitySetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 115
    .line 116
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    add-int/2addr p0, v0

    .line 121
    :cond_7
    const/16 v0, 0x3c

    .line 122
    .line 123
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->acceptGift:Z

    .line 124
    .line 125
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    add-int/2addr p0, v0

    .line 130
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 131
    .line 132
    if-eqz v0, :cond_8

    .line 133
    .line 134
    const/16 v1, 0x3d

    .line 135
    .line 136
    sget-object v2, Lcom/p1/mobile/putong/feed/data/ActivityActionApi;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 137
    .line 138
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    add-int/2addr p0, v0

    .line 143
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->parentMessageid:Ljava/lang/String;

    .line 144
    .line 145
    if-eqz v0, :cond_9

    .line 146
    .line 147
    const/16 v1, 0x3e

    .line 148
    .line 149
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    add-int/2addr p0, v0

    .line 154
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->replyMessageId:Ljava/lang/String;

    .line 155
    .line 156
    if-eqz v0, :cond_a

    .line 157
    .line 158
    const/16 v1, 0x3f

    .line 159
    .line 160
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    add-int/2addr p0, v0

    .line 165
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->userIds:Ljava/util/List;

    .line 166
    .line 167
    if-eqz v0, :cond_b

    .line 168
    .line 169
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 170
    .line 171
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    const/16 v2, 0x40

    .line 176
    .line 177
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    add-int/2addr p0, v0

    .line 182
    :cond_b
    const/16 v0, 0x41

    .line 183
    .line 184
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->count:I

    .line 185
    .line 186
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    add-int/2addr p0, v0

    .line 191
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 192
    .line 193
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 194
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/MomentActivity$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/MomentActivity;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/MomentActivity;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/MomentActivity;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const-string v3, ""

    .line 13
    .line 14
    sparse-switch v2, :sswitch_data_0

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/feed/data/ActivityActionApi;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->value:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->value:Ljava/lang/String;

    .line 42
    .line 43
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->owner:Ljava/lang/String;

    .line 44
    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->owner:Ljava/lang/String;

    .line 48
    .line 49
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 50
    .line 51
    if-nez p1, :cond_3

    .line 52
    .line 53
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 54
    .line 55
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 56
    .line 57
    if-nez p1, :cond_4

    .line 58
    .line 59
    sget-object p1, Lcom/p1/mobile/putong/feed/data/ActivityActionApi;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 66
    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 68
    .line 69
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 70
    .line 71
    if-nez p1, :cond_5

    .line 72
    .line 73
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->new_()Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 78
    .line 79
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->messageid:Ljava/lang/String;

    .line 80
    .line 81
    if-nez p1, :cond_6

    .line 82
    .line 83
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->messageid:Ljava/lang/String;

    .line 84
    .line 85
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->settings:Lcom/p1/mobile/putong/feed/data/ActivitySetting;

    .line 86
    .line 87
    if-nez p1, :cond_7

    .line 88
    .line 89
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/ActivitySetting;->new_()Lcom/p1/mobile/putong/feed/data/ActivitySetting;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->settings:Lcom/p1/mobile/putong/feed/data/ActivitySetting;

    .line 94
    .line 95
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->parentMessageid:Ljava/lang/String;

    .line 96
    .line 97
    if-nez p1, :cond_8

    .line 98
    .line 99
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->parentMessageid:Ljava/lang/String;

    .line 100
    .line 101
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->replyMessageId:Ljava/lang/String;

    .line 102
    .line 103
    if-nez p1, :cond_9

    .line 104
    .line 105
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->replyMessageId:Ljava/lang/String;

    .line 106
    .line 107
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->userIds:Ljava/util/List;

    .line 108
    .line 109
    if-nez p1, :cond_14

    .line 110
    .line 111
    new-instance p1, Ljava/util/ArrayList;

    .line 112
    .line 113
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 114
    .line 115
    .line 116
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->userIds:Ljava/util/List;

    .line 117
    .line 118
    return-object p0

    .line 119
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    iput v2, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->count:I

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :sswitch_1
    sget-object v2, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 127
    .line 128
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    check-cast v2, Ljava/util/List;

    .line 137
    .line 138
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->userIds:Ljava/util/List;

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->replyMessageId:Ljava/lang/String;

    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->parentMessageid:Ljava/lang/String;

    .line 155
    .line 156
    goto/16 :goto_0

    .line 157
    .line 158
    :sswitch_4
    sget-object v2, Lcom/p1/mobile/putong/feed/data/ActivityActionApi;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 159
    .line 160
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    check-cast v2, Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 165
    .line 166
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 171
    .line 172
    .line 173
    move-result v2

    .line 174
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->acceptGift:Z

    .line 175
    .line 176
    goto/16 :goto_0

    .line 177
    .line 178
    :sswitch_6
    sget-object v2, Lcom/p1/mobile/putong/feed/data/ActivitySetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 179
    .line 180
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    check-cast v2, Lcom/p1/mobile/putong/feed/data/ActivitySetting;

    .line 185
    .line 186
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->settings:Lcom/p1/mobile/putong/feed/data/ActivitySetting;

    .line 187
    .line 188
    goto/16 :goto_0

    .line 189
    .line 190
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->messageid:Ljava/lang/String;

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 199
    .line 200
    .line 201
    move-result-wide v2

    .line 202
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->createdTime:D

    .line 203
    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :sswitch_9
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 207
    .line 208
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v2

    .line 212
    check-cast v2, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 213
    .line 214
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 215
    .line 216
    goto/16 :goto_0

    .line 217
    .line 218
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 219
    .line 220
    .line 221
    move-result v2

    .line 222
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->read:Z

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 227
    .line 228
    .line 229
    move-result v1

    .line 230
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    goto/16 :goto_0

    .line 235
    .line 236
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v2

    .line 240
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 241
    .line 242
    goto/16 :goto_0

    .line 243
    .line 244
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object v2

    .line 248
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->owner:Ljava/lang/String;

    .line 249
    .line 250
    goto/16 :goto_0

    .line 251
    .line 252
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->value:Ljava/lang/String;

    .line 257
    .line 258
    goto/16 :goto_0

    .line 259
    .line 260
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v2

    .line 264
    iput-object v2, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 269
    .line 270
    .line 271
    move-result-wide v2

    .line 272
    iput-wide v2, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 273
    .line 274
    goto/16 :goto_0

    .line 275
    .line 276
    :sswitch_11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 277
    .line 278
    if-nez p1, :cond_a

    .line 279
    .line 280
    if-eqz v1, :cond_a

    .line 281
    .line 282
    sget-object p1, Lcom/p1/mobile/putong/feed/data/ActivityActionApi;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 283
    .line 284
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 285
    .line 286
    .line 287
    move-result v1

    .line 288
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 289
    .line 290
    .line 291
    move-result-object p1

    .line 292
    check-cast p1, Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 293
    .line 294
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 295
    .line 296
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->value:Ljava/lang/String;

    .line 297
    .line 298
    if-nez p1, :cond_b

    .line 299
    .line 300
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->value:Ljava/lang/String;

    .line 301
    .line 302
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->owner:Ljava/lang/String;

    .line 303
    .line 304
    if-nez p1, :cond_c

    .line 305
    .line 306
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->owner:Ljava/lang/String;

    .line 307
    .line 308
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 309
    .line 310
    if-nez p1, :cond_d

    .line 311
    .line 312
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 313
    .line 314
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 315
    .line 316
    if-nez p1, :cond_e

    .line 317
    .line 318
    sget-object p1, Lcom/p1/mobile/putong/feed/data/ActivityActionApi;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 319
    .line 320
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 321
    .line 322
    .line 323
    move-result-object p1

    .line 324
    check-cast p1, Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 325
    .line 326
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 327
    .line 328
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 329
    .line 330
    if-nez p1, :cond_f

    .line 331
    .line 332
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->new_()Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 333
    .line 334
    .line 335
    move-result-object p1

    .line 336
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 337
    .line 338
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->messageid:Ljava/lang/String;

    .line 339
    .line 340
    if-nez p1, :cond_10

    .line 341
    .line 342
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->messageid:Ljava/lang/String;

    .line 343
    .line 344
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->settings:Lcom/p1/mobile/putong/feed/data/ActivitySetting;

    .line 345
    .line 346
    if-nez p1, :cond_11

    .line 347
    .line 348
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/ActivitySetting;->new_()Lcom/p1/mobile/putong/feed/data/ActivitySetting;

    .line 349
    .line 350
    .line 351
    move-result-object p1

    .line 352
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->settings:Lcom/p1/mobile/putong/feed/data/ActivitySetting;

    .line 353
    .line 354
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->parentMessageid:Ljava/lang/String;

    .line 355
    .line 356
    if-nez p1, :cond_12

    .line 357
    .line 358
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->parentMessageid:Ljava/lang/String;

    .line 359
    .line 360
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->replyMessageId:Ljava/lang/String;

    .line 361
    .line 362
    if-nez p1, :cond_13

    .line 363
    .line 364
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->replyMessageId:Ljava/lang/String;

    .line 365
    .line 366
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->userIds:Ljava/util/List;

    .line 367
    .line 368
    if-nez p1, :cond_14

    .line 369
    .line 370
    new-instance p1, Ljava/util/ArrayList;

    .line 371
    .line 372
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 373
    .line 374
    .line 375
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->userIds:Ljava/util/List;

    .line 376
    .line 377
    :cond_14
    return-object p0

    .line 378
    nop

    .line 379
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_11
        0x8 -> :sswitch_10
        0x12 -> :sswitch_f
        0x19a -> :sswitch_e
        0x1a2 -> :sswitch_d
        0x1aa -> :sswitch_c
        0x1b0 -> :sswitch_b
        0x1b8 -> :sswitch_a
        0x1c2 -> :sswitch_9
        0x1c9 -> :sswitch_8
        0x1d2 -> :sswitch_7
        0x1da -> :sswitch_6
        0x1e0 -> :sswitch_5
        0x1ea -> :sswitch_4
        0x1f2 -> :sswitch_3
        0x1fa -> :sswitch_2
        0x202 -> :sswitch_1
        0x208 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 379
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/MomentActivity$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/MomentActivity;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/MomentActivity;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->value:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->owner:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 43
    .line 44
    if-eqz p0, :cond_4

    .line 45
    .line 46
    const/16 v0, 0x36

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 53
    .line 54
    .line 55
    :cond_4
    const/16 p0, 0x37

    .line 56
    .line 57
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->read:Z

    .line 58
    .line 59
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 63
    .line 64
    if-eqz p0, :cond_5

    .line 65
    .line 66
    const/16 v0, 0x38

    .line 67
    .line 68
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 69
    .line 70
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 71
    .line 72
    .line 73
    :cond_5
    const/16 p0, 0x39

    .line 74
    .line 75
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->createdTime:D

    .line 76
    .line 77
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->messageid:Ljava/lang/String;

    .line 81
    .line 82
    if-eqz p0, :cond_6

    .line 83
    .line 84
    const/16 v0, 0x3a

    .line 85
    .line 86
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->settings:Lcom/p1/mobile/putong/feed/data/ActivitySetting;

    .line 90
    .line 91
    if-eqz p0, :cond_7

    .line 92
    .line 93
    const/16 v0, 0x3b

    .line 94
    .line 95
    sget-object v1, Lcom/p1/mobile/putong/feed/data/ActivitySetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 96
    .line 97
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 98
    .line 99
    .line 100
    :cond_7
    const/16 p0, 0x3c

    .line 101
    .line 102
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->acceptGift:Z

    .line 103
    .line 104
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 105
    .line 106
    .line 107
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 108
    .line 109
    if-eqz p0, :cond_8

    .line 110
    .line 111
    const/16 v0, 0x3d

    .line 112
    .line 113
    sget-object v1, Lcom/p1/mobile/putong/feed/data/ActivityActionApi;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 114
    .line 115
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 116
    .line 117
    .line 118
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->parentMessageid:Ljava/lang/String;

    .line 119
    .line 120
    if-eqz p0, :cond_9

    .line 121
    .line 122
    const/16 v0, 0x3e

    .line 123
    .line 124
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 125
    .line 126
    .line 127
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->replyMessageId:Ljava/lang/String;

    .line 128
    .line 129
    if-eqz p0, :cond_a

    .line 130
    .line 131
    const/16 v0, 0x3f

    .line 132
    .line 133
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 134
    .line 135
    .line 136
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->userIds:Ljava/util/List;

    .line 137
    .line 138
    if-eqz p0, :cond_b

    .line 139
    .line 140
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 141
    .line 142
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    const/16 v1, 0x40

    .line 147
    .line 148
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 149
    .line 150
    .line 151
    :cond_b
    const/16 p0, 0x41

    .line 152
    .line 153
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->count:I

    .line 154
    .line 155
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 159
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/MomentActivity$1;->serialize(Lcom/p1/mobile/putong/feed/data/MomentActivity;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
