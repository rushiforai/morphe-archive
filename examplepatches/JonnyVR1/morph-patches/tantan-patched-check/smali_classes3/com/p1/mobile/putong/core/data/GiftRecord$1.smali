.class Lcom/p1/mobile/putong/core/data/GiftRecord$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/GiftRecord;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/GiftRecord;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/GiftRecord;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->owner:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/core/data/GiftUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 18
    .line 19
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->otherUser:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const/4 v1, 0x3

    .line 29
    sget-object v2, Lcom/p1/mobile/putong/core/data/GiftUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->action:Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftType:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x5

    .line 55
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    :cond_4
    const/4 v0, 0x6

    .line 61
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->unitPrice:D

    .line 62
    .line 63
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    const/4 v0, 0x7

    .line 69
    iget v1, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->total:I

    .line 70
    .line 71
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int/2addr p0, v0

    .line 76
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->status:Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 77
    .line 78
    if-eqz v0, :cond_5

    .line 79
    .line 80
    const/16 v1, 0x8

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    add-int/2addr p0, v0

    .line 91
    :cond_5
    const/16 v0, 0x9

    .line 92
    .line 93
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->share:D

    .line 94
    .line 95
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr p0, v0

    .line 100
    const/16 v0, 0xa

    .line 101
    .line 102
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->revenue:D

    .line 103
    .line 104
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    add-int/2addr p0, v0

    .line 109
    const/16 v0, 0xb

    .line 110
    .line 111
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftGivenTime:D

    .line 112
    .line 113
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    add-int/2addr p0, v0

    .line 118
    const/16 v0, 0xc

    .line 119
    .line 120
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftReceivedTime:D

    .line 121
    .line 122
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    add-int/2addr p0, v0

    .line 127
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->details:Ljava/util/List;

    .line 128
    .line 129
    if-eqz v0, :cond_6

    .line 130
    .line 131
    sget-object v1, Lcom/p1/mobile/putong/core/data/GiftDetail;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 132
    .line 133
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    const/16 v2, 0xd

    .line 138
    .line 139
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    add-int/2addr p0, v0

    .line 144
    :cond_6
    const/16 v0, 0xe

    .line 145
    .line 146
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftMatchNewTag:Z

    .line 147
    .line 148
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    add-int/2addr p0, v0

    .line 153
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->action:Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 154
    .line 155
    if-eqz v0, :cond_7

    .line 156
    .line 157
    const/16 v1, 0xf

    .line 158
    .line 159
    sget-object v2, Lcom/p1/mobile/putong/core/data/GiftAction;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 160
    .line 161
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    add-int/2addr p0, v0

    .line 166
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->status:Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 167
    .line 168
    if-eqz v0, :cond_8

    .line 169
    .line 170
    const/16 v1, 0x10

    .line 171
    .line 172
    sget-object v2, Lcom/p1/mobile/putong/core/data/GiftStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 173
    .line 174
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    add-int/2addr p0, v0

    .line 179
    :cond_8
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 180
    .line 181
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 182
    check-cast p1, Lcom/p1/mobile/putong/core/data/GiftRecord;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/GiftRecord$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/GiftRecord;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/GiftRecord;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/GiftRecord;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/GiftRecord;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    move-object v2, v1

    .line 9
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    const-string v4, ""

    .line 14
    .line 15
    sparse-switch v3, :sswitch_data_0

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->action:Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    sget-object p1, Lcom/p1/mobile/putong/core/data/GiftAction;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->action:Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 37
    .line 38
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->status:Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 39
    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    sget-object p1, Lcom/p1/mobile/putong/core/data/GiftStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->status:Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->id:Ljava/lang/String;

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->id:Ljava/lang/String;

    .line 63
    .line 64
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->owner:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 65
    .line 66
    if-nez p1, :cond_3

    .line 67
    .line 68
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GiftUser;->new_()Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->owner:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 73
    .line 74
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->otherUser:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 75
    .line 76
    if-nez p1, :cond_4

    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GiftUser;->new_()Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->otherUser:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 83
    .line 84
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->action:Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 85
    .line 86
    if-nez p1, :cond_5

    .line 87
    .line 88
    sget-object p1, Lcom/p1/mobile/putong/core/data/GiftAction;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 89
    .line 90
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    check-cast p1, Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 95
    .line 96
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->action:Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 97
    .line 98
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftType:Ljava/lang/String;

    .line 99
    .line 100
    if-nez p1, :cond_6

    .line 101
    .line 102
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftType:Ljava/lang/String;

    .line 103
    .line 104
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->status:Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 105
    .line 106
    if-nez p1, :cond_7

    .line 107
    .line 108
    sget-object p1, Lcom/p1/mobile/putong/core/data/GiftStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 109
    .line 110
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    check-cast p1, Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 115
    .line 116
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->status:Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 117
    .line 118
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->details:Ljava/util/List;

    .line 119
    .line 120
    if-nez p1, :cond_8

    .line 121
    .line 122
    new-instance p1, Ljava/util/ArrayList;

    .line 123
    .line 124
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 125
    .line 126
    .line 127
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->details:Ljava/util/List;

    .line 128
    .line 129
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->name:Ljava/lang/String;

    .line 130
    .line 131
    if-nez p1, :cond_9

    .line 132
    .line 133
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->name:Ljava/lang/String;

    .line 134
    .line 135
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->unit:Ljava/lang/String;

    .line 136
    .line 137
    if-nez p1, :cond_14

    .line 138
    .line 139
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->unit:Ljava/lang/String;

    .line 140
    .line 141
    return-object p0

    .line 142
    :sswitch_0
    sget-object v3, Lcom/p1/mobile/putong/core/data/GiftStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 143
    .line 144
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    check-cast v3, Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 149
    .line 150
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->status:Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 151
    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :sswitch_1
    sget-object v3, Lcom/p1/mobile/putong/core/data/GiftAction;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 155
    .line 156
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    check-cast v3, Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 161
    .line 162
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->action:Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 167
    .line 168
    .line 169
    move-result v3

    .line 170
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftMatchNewTag:Z

    .line 171
    .line 172
    goto/16 :goto_0

    .line 173
    .line 174
    :sswitch_3
    sget-object v3, Lcom/p1/mobile/putong/core/data/GiftDetail;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 175
    .line 176
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    check-cast v3, Ljava/util/List;

    .line 185
    .line 186
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->details:Ljava/util/List;

    .line 187
    .line 188
    goto/16 :goto_0

    .line 189
    .line 190
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 191
    .line 192
    .line 193
    move-result-wide v3

    .line 194
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftReceivedTime:D

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 199
    .line 200
    .line 201
    move-result-wide v3

    .line 202
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftGivenTime:D

    .line 203
    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 207
    .line 208
    .line 209
    move-result-wide v3

    .line 210
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->revenue:D

    .line 211
    .line 212
    goto/16 :goto_0

    .line 213
    .line 214
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 215
    .line 216
    .line 217
    move-result-wide v3

    .line 218
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->share:D

    .line 219
    .line 220
    goto/16 :goto_0

    .line 221
    .line 222
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 227
    .line 228
    .line 229
    move-result-object v2

    .line 230
    goto/16 :goto_0

    .line 231
    .line 232
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 233
    .line 234
    .line 235
    move-result v3

    .line 236
    iput v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->total:I

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 241
    .line 242
    .line 243
    move-result-wide v3

    .line 244
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->unitPrice:D

    .line 245
    .line 246
    goto/16 :goto_0

    .line 247
    .line 248
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v3

    .line 252
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftType:Ljava/lang/String;

    .line 253
    .line 254
    goto/16 :goto_0

    .line 255
    .line 256
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 257
    .line 258
    .line 259
    move-result v1

    .line 260
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    goto/16 :goto_0

    .line 265
    .line 266
    :sswitch_d
    sget-object v3, Lcom/p1/mobile/putong/core/data/GiftUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 267
    .line 268
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    move-result-object v3

    .line 272
    check-cast v3, Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 273
    .line 274
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->otherUser:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 275
    .line 276
    goto/16 :goto_0

    .line 277
    .line 278
    :sswitch_e
    sget-object v3, Lcom/p1/mobile/putong/core/data/GiftUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 279
    .line 280
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 281
    .line 282
    .line 283
    move-result-object v3

    .line 284
    check-cast v3, Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 285
    .line 286
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->owner:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 287
    .line 288
    goto/16 :goto_0

    .line 289
    .line 290
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object v3

    .line 294
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->id:Ljava/lang/String;

    .line 295
    .line 296
    goto/16 :goto_0

    .line 297
    .line 298
    :sswitch_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->action:Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 299
    .line 300
    if-nez p1, :cond_a

    .line 301
    .line 302
    if-eqz v1, :cond_a

    .line 303
    .line 304
    sget-object p1, Lcom/p1/mobile/putong/core/data/GiftAction;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 305
    .line 306
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 307
    .line 308
    .line 309
    move-result v1

    .line 310
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 311
    .line 312
    .line 313
    move-result-object p1

    .line 314
    check-cast p1, Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 315
    .line 316
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->action:Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 317
    .line 318
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->status:Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 319
    .line 320
    if-nez p1, :cond_b

    .line 321
    .line 322
    if-eqz v2, :cond_b

    .line 323
    .line 324
    sget-object p1, Lcom/p1/mobile/putong/core/data/GiftStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 325
    .line 326
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 327
    .line 328
    .line 329
    move-result v1

    .line 330
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 331
    .line 332
    .line 333
    move-result-object p1

    .line 334
    check-cast p1, Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 335
    .line 336
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->status:Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 337
    .line 338
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->id:Ljava/lang/String;

    .line 339
    .line 340
    if-nez p1, :cond_c

    .line 341
    .line 342
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->id:Ljava/lang/String;

    .line 343
    .line 344
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->owner:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 345
    .line 346
    if-nez p1, :cond_d

    .line 347
    .line 348
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GiftUser;->new_()Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 349
    .line 350
    .line 351
    move-result-object p1

    .line 352
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->owner:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 353
    .line 354
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->otherUser:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 355
    .line 356
    if-nez p1, :cond_e

    .line 357
    .line 358
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GiftUser;->new_()Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 359
    .line 360
    .line 361
    move-result-object p1

    .line 362
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->otherUser:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 363
    .line 364
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->action:Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 365
    .line 366
    if-nez p1, :cond_f

    .line 367
    .line 368
    sget-object p1, Lcom/p1/mobile/putong/core/data/GiftAction;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 369
    .line 370
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 371
    .line 372
    .line 373
    move-result-object p1

    .line 374
    check-cast p1, Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 375
    .line 376
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->action:Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 377
    .line 378
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftType:Ljava/lang/String;

    .line 379
    .line 380
    if-nez p1, :cond_10

    .line 381
    .line 382
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftType:Ljava/lang/String;

    .line 383
    .line 384
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->status:Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 385
    .line 386
    if-nez p1, :cond_11

    .line 387
    .line 388
    sget-object p1, Lcom/p1/mobile/putong/core/data/GiftStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 389
    .line 390
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 391
    .line 392
    .line 393
    move-result-object p1

    .line 394
    check-cast p1, Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 395
    .line 396
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->status:Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 397
    .line 398
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->details:Ljava/util/List;

    .line 399
    .line 400
    if-nez p1, :cond_12

    .line 401
    .line 402
    new-instance p1, Ljava/util/ArrayList;

    .line 403
    .line 404
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 405
    .line 406
    .line 407
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->details:Ljava/util/List;

    .line 408
    .line 409
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->name:Ljava/lang/String;

    .line 410
    .line 411
    if-nez p1, :cond_13

    .line 412
    .line 413
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->name:Ljava/lang/String;

    .line 414
    .line 415
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->unit:Ljava/lang/String;

    .line 416
    .line 417
    if-nez p1, :cond_14

    .line 418
    .line 419
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/GiftRecord;->unit:Ljava/lang/String;

    .line 420
    .line 421
    :cond_14
    return-object p0

    .line 422
    nop

    .line 423
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_10
        0xa -> :sswitch_f
        0x12 -> :sswitch_e
        0x1a -> :sswitch_d
        0x20 -> :sswitch_c
        0x2a -> :sswitch_b
        0x31 -> :sswitch_a
        0x38 -> :sswitch_9
        0x40 -> :sswitch_8
        0x49 -> :sswitch_7
        0x51 -> :sswitch_6
        0x59 -> :sswitch_5
        0x61 -> :sswitch_4
        0x6a -> :sswitch_3
        0x70 -> :sswitch_2
        0x7a -> :sswitch_1
        0x82 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 423
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/GiftRecord$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/GiftRecord;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/GiftRecord;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->owner:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/data/GiftUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->otherUser:Lcom/p1/mobile/putong/core/data/GiftUser;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    sget-object v1, Lcom/p1/mobile/putong/core/data/GiftUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 25
    .line 26
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->action:Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 30
    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    const/4 v0, 0x4

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 39
    .line 40
    .line 41
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftType:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    const/4 v0, 0x5

    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_4
    const/4 p0, 0x6

    .line 50
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->unitPrice:D

    .line 51
    .line 52
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 53
    .line 54
    .line 55
    const/4 p0, 0x7

    .line 56
    iget v0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->total:I

    .line 57
    .line 58
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->status:Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 62
    .line 63
    if-eqz p0, :cond_5

    .line 64
    .line 65
    const/16 v0, 0x8

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 72
    .line 73
    .line 74
    :cond_5
    const/16 p0, 0x9

    .line 75
    .line 76
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->share:D

    .line 77
    .line 78
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 79
    .line 80
    .line 81
    const/16 p0, 0xa

    .line 82
    .line 83
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->revenue:D

    .line 84
    .line 85
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 86
    .line 87
    .line 88
    const/16 p0, 0xb

    .line 89
    .line 90
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftGivenTime:D

    .line 91
    .line 92
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 93
    .line 94
    .line 95
    const/16 p0, 0xc

    .line 96
    .line 97
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftReceivedTime:D

    .line 98
    .line 99
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 100
    .line 101
    .line 102
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->details:Ljava/util/List;

    .line 103
    .line 104
    if-eqz p0, :cond_6

    .line 105
    .line 106
    sget-object v0, Lcom/p1/mobile/putong/core/data/GiftDetail;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 107
    .line 108
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    const/16 v1, 0xd

    .line 113
    .line 114
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 115
    .line 116
    .line 117
    :cond_6
    const/16 p0, 0xe

    .line 118
    .line 119
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->giftMatchNewTag:Z

    .line 120
    .line 121
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 122
    .line 123
    .line 124
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->action:Lcom/p1/mobile/putong/core/data/GiftAction;

    .line 125
    .line 126
    if-eqz p0, :cond_7

    .line 127
    .line 128
    const/16 v0, 0xf

    .line 129
    .line 130
    sget-object v1, Lcom/p1/mobile/putong/core/data/GiftAction;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 131
    .line 132
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 133
    .line 134
    .line 135
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GiftRecord;->status:Lcom/p1/mobile/putong/core/data/GiftStatus;

    .line 136
    .line 137
    if-eqz p0, :cond_8

    .line 138
    .line 139
    const/16 p1, 0x10

    .line 140
    .line 141
    sget-object v0, Lcom/p1/mobile/putong/core/data/GiftStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 142
    .line 143
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 144
    .line 145
    .line 146
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

    .line 147
    check-cast p1, Lcom/p1/mobile/putong/core/data/GiftRecord;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/GiftRecord$1;->serialize(Lcom/p1/mobile/putong/core/data/GiftRecord;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
