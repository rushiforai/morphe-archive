.class Lcom/p1/mobile/putong/core/data/CoreMomentInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/CoreMomentInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/CopyObject;->_id:J

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

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
    const/16 v0, 0x33

    .line 19
    .line 20
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localCreatedSession:I

    .line 21
    .line 22
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    add-int/2addr p0, v0

    .line 27
    const/16 v0, 0x34

    .line 28
    .line 29
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localInFeed:Z

    .line 30
    .line 31
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    const/16 v0, 0x35

    .line 37
    .line 38
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localInUserFeed:Z

    .line 39
    .line 40
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    add-int/2addr p0, v0

    .line 45
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    const/16 v1, 0x36

    .line 50
    .line 51
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_1
    const/16 v0, 0x37

    .line 57
    .line 58
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->createdTime:D

    .line 59
    .line 60
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    add-int/2addr p0, v0

    .line 65
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 66
    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    const/16 v1, 0x38

    .line 70
    .line 71
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int/2addr p0, v0

    .line 76
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 77
    .line 78
    if-eqz v0, :cond_3

    .line 79
    .line 80
    sget-object v1, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 81
    .line 82
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    const/16 v2, 0x39

    .line 87
    .line 88
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    add-int/2addr p0, v0

    .line 93
    :cond_3
    const/16 v0, 0x3a

    .line 94
    .line 95
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 96
    .line 97
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    add-int/2addr p0, v0

    .line 102
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 103
    .line 104
    if-eqz v0, :cond_4

    .line 105
    .line 106
    const/16 v1, 0x3b

    .line 107
    .line 108
    sget-object v2, Lcom/p1/mobile/putong/data/MessageLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 109
    .line 110
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    add-int/2addr p0, v0

    .line 115
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentType:Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 116
    .line 117
    if-eqz v0, :cond_5

    .line 118
    .line 119
    const/16 v1, 0x3c

    .line 120
    .line 121
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    add-int/2addr p0, v0

    .line 130
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentType:Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 131
    .line 132
    if-eqz v0, :cond_6

    .line 133
    .line 134
    const/16 v1, 0x3d

    .line 135
    .line 136
    sget-object v2, Lcom/p1/mobile/putong/core/data/CoreMomentType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->videoBullets:Ljava/util/List;

    .line 144
    .line 145
    if-eqz v0, :cond_7

    .line 146
    .line 147
    sget-object v1, Lcom/p1/mobile/putong/core/data/VideoBullet;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 148
    .line 149
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    const/16 v2, 0x3e

    .line 154
    .line 155
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    add-int/2addr p0, v0

    .line 160
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->musicId:Ljava/lang/String;

    .line 161
    .line 162
    if-eqz v0, :cond_8

    .line 163
    .line 164
    const/16 v1, 0x3f

    .line 165
    .line 166
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    add-int/2addr p0, v0

    .line 171
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentCard:Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 172
    .line 173
    if-eqz v0, :cond_9

    .line 174
    .line 175
    const/16 v1, 0x40

    .line 176
    .line 177
    sget-object v2, Lcom/p1/mobile/putong/core/data/MomentCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 178
    .line 179
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    add-int/2addr p0, v0

    .line 184
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->sourceType:Ljava/lang/String;

    .line 185
    .line 186
    if-eqz v0, :cond_a

    .line 187
    .line 188
    const/16 v1, 0x41

    .line 189
    .line 190
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    add-int/2addr p0, v0

    .line 195
    :cond_a
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 196
    .line 197
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 198
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CoreMomentInfo;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentType:Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/core/data/CoreMomentType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentType:Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 42
    .line 43
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 44
    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 48
    .line 49
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 50
    .line 51
    if-nez p1, :cond_3

    .line 52
    .line 53
    new-instance p1, Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 59
    .line 60
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 61
    .line 62
    if-nez p1, :cond_4

    .line 63
    .line 64
    invoke-static {}, Lcom/p1/mobile/putong/data/PartialIdList;->new_()Lcom/p1/mobile/putong/data/PartialIdList;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 69
    .line 70
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 71
    .line 72
    if-nez p1, :cond_5

    .line 73
    .line 74
    invoke-static {}, Lcom/p1/mobile/putong/data/PartialIdList;->new_()Lcom/p1/mobile/putong/data/PartialIdList;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 79
    .line 80
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->topics:Ljava/util/List;

    .line 81
    .line 82
    if-nez p1, :cond_6

    .line 83
    .line 84
    new-instance p1, Ljava/util/ArrayList;

    .line 85
    .line 86
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 87
    .line 88
    .line 89
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->topics:Ljava/util/List;

    .line 90
    .line 91
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->tags:Ljava/util/List;

    .line 92
    .line 93
    if-nez p1, :cond_7

    .line 94
    .line 95
    new-instance p1, Ljava/util/ArrayList;

    .line 96
    .line 97
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 98
    .line 99
    .line 100
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->tags:Ljava/util/List;

    .line 101
    .line 102
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->videoBullets:Ljava/util/List;

    .line 103
    .line 104
    if-nez p1, :cond_8

    .line 105
    .line 106
    new-instance p1, Ljava/util/ArrayList;

    .line 107
    .line 108
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 109
    .line 110
    .line 111
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->videoBullets:Ljava/util/List;

    .line 112
    .line 113
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->musicId:Ljava/lang/String;

    .line 114
    .line 115
    if-nez p1, :cond_9

    .line 116
    .line 117
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->musicId:Ljava/lang/String;

    .line 118
    .line 119
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentCard:Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 120
    .line 121
    if-nez p1, :cond_a

    .line 122
    .line 123
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MomentCard;->new_()Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentCard:Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 128
    .line 129
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->sourceType:Ljava/lang/String;

    .line 130
    .line 131
    if-nez p1, :cond_16

    .line 132
    .line 133
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->sourceType:Ljava/lang/String;

    .line 134
    .line 135
    return-object p0

    .line 136
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->sourceType:Ljava/lang/String;

    .line 141
    .line 142
    goto/16 :goto_0

    .line 143
    .line 144
    :sswitch_1
    sget-object v2, Lcom/p1/mobile/putong/core/data/MomentCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 145
    .line 146
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    check-cast v2, Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 151
    .line 152
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentCard:Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->musicId:Ljava/lang/String;

    .line 161
    .line 162
    goto/16 :goto_0

    .line 163
    .line 164
    :sswitch_3
    sget-object v2, Lcom/p1/mobile/putong/core/data/VideoBullet;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 165
    .line 166
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    check-cast v2, Ljava/util/List;

    .line 175
    .line 176
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->videoBullets:Ljava/util/List;

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :sswitch_4
    sget-object v2, Lcom/p1/mobile/putong/core/data/CoreMomentType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 181
    .line 182
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 187
    .line 188
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentType:Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 189
    .line 190
    goto/16 :goto_0

    .line 191
    .line 192
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    goto/16 :goto_0

    .line 201
    .line 202
    :sswitch_6
    sget-object v2, Lcom/p1/mobile/putong/data/MessageLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 203
    .line 204
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v2

    .line 208
    check-cast v2, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 209
    .line 210
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 211
    .line 212
    goto/16 :goto_0

    .line 213
    .line 214
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 215
    .line 216
    .line 217
    move-result v2

    .line 218
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 219
    .line 220
    goto/16 :goto_0

    .line 221
    .line 222
    :sswitch_8
    sget-object v2, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 223
    .line 224
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 225
    .line 226
    .line 227
    move-result-object v2

    .line 228
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    move-result-object v2

    .line 232
    check-cast v2, Ljava/util/List;

    .line 233
    .line 234
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 235
    .line 236
    goto/16 :goto_0

    .line 237
    .line 238
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v2

    .line 242
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 243
    .line 244
    goto/16 :goto_0

    .line 245
    .line 246
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 247
    .line 248
    .line 249
    move-result-wide v2

    .line 250
    iput-wide v2, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->createdTime:D

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v2

    .line 258
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 259
    .line 260
    goto/16 :goto_0

    .line 261
    .line 262
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 263
    .line 264
    .line 265
    move-result v2

    .line 266
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localInUserFeed:Z

    .line 267
    .line 268
    goto/16 :goto_0

    .line 269
    .line 270
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 271
    .line 272
    .line 273
    move-result v2

    .line 274
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localInFeed:Z

    .line 275
    .line 276
    goto/16 :goto_0

    .line 277
    .line 278
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 279
    .line 280
    .line 281
    move-result v2

    .line 282
    iput v2, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localCreatedSession:I

    .line 283
    .line 284
    goto/16 :goto_0

    .line 285
    .line 286
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object v2

    .line 290
    iput-object v2, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 291
    .line 292
    goto/16 :goto_0

    .line 293
    .line 294
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 295
    .line 296
    .line 297
    move-result-wide v2

    .line 298
    iput-wide v2, p0, Lcom/tantanapp/common/data/CopyObject;->_id:J

    .line 299
    .line 300
    goto/16 :goto_0

    .line 301
    .line 302
    :sswitch_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentType:Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 303
    .line 304
    if-nez p1, :cond_b

    .line 305
    .line 306
    if-eqz v1, :cond_b

    .line 307
    .line 308
    sget-object p1, Lcom/p1/mobile/putong/core/data/CoreMomentType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 309
    .line 310
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 311
    .line 312
    .line 313
    move-result v1

    .line 314
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 319
    .line 320
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentType:Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 321
    .line 322
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 323
    .line 324
    if-nez p1, :cond_c

    .line 325
    .line 326
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 327
    .line 328
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 329
    .line 330
    if-nez p1, :cond_d

    .line 331
    .line 332
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 333
    .line 334
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 335
    .line 336
    if-nez p1, :cond_e

    .line 337
    .line 338
    new-instance p1, Ljava/util/ArrayList;

    .line 339
    .line 340
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 341
    .line 342
    .line 343
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 344
    .line 345
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 346
    .line 347
    if-nez p1, :cond_f

    .line 348
    .line 349
    invoke-static {}, Lcom/p1/mobile/putong/data/PartialIdList;->new_()Lcom/p1/mobile/putong/data/PartialIdList;

    .line 350
    .line 351
    .line 352
    move-result-object p1

    .line 353
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 354
    .line 355
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 356
    .line 357
    if-nez p1, :cond_10

    .line 358
    .line 359
    invoke-static {}, Lcom/p1/mobile/putong/data/PartialIdList;->new_()Lcom/p1/mobile/putong/data/PartialIdList;

    .line 360
    .line 361
    .line 362
    move-result-object p1

    .line 363
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 364
    .line 365
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->topics:Ljava/util/List;

    .line 366
    .line 367
    if-nez p1, :cond_11

    .line 368
    .line 369
    new-instance p1, Ljava/util/ArrayList;

    .line 370
    .line 371
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 372
    .line 373
    .line 374
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->topics:Ljava/util/List;

    .line 375
    .line 376
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->tags:Ljava/util/List;

    .line 377
    .line 378
    if-nez p1, :cond_12

    .line 379
    .line 380
    new-instance p1, Ljava/util/ArrayList;

    .line 381
    .line 382
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 383
    .line 384
    .line 385
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->tags:Ljava/util/List;

    .line 386
    .line 387
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->videoBullets:Ljava/util/List;

    .line 388
    .line 389
    if-nez p1, :cond_13

    .line 390
    .line 391
    new-instance p1, Ljava/util/ArrayList;

    .line 392
    .line 393
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 394
    .line 395
    .line 396
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->videoBullets:Ljava/util/List;

    .line 397
    .line 398
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->musicId:Ljava/lang/String;

    .line 399
    .line 400
    if-nez p1, :cond_14

    .line 401
    .line 402
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->musicId:Ljava/lang/String;

    .line 403
    .line 404
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentCard:Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 405
    .line 406
    if-nez p1, :cond_15

    .line 407
    .line 408
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MomentCard;->new_()Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 409
    .line 410
    .line 411
    move-result-object p1

    .line 412
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentCard:Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 413
    .line 414
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->sourceType:Ljava/lang/String;

    .line 415
    .line 416
    if-nez p1, :cond_16

    .line 417
    .line 418
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->sourceType:Ljava/lang/String;

    .line 419
    .line 420
    :cond_16
    return-object p0

    .line 421
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_11
        0x8 -> :sswitch_10
        0x12 -> :sswitch_f
        0x198 -> :sswitch_e
        0x1a0 -> :sswitch_d
        0x1a8 -> :sswitch_c
        0x1b2 -> :sswitch_b
        0x1b9 -> :sswitch_a
        0x1c2 -> :sswitch_9
        0x1ca -> :sswitch_8
        0x1d0 -> :sswitch_7
        0x1da -> :sswitch_6
        0x1e0 -> :sswitch_5
        0x1ea -> :sswitch_4
        0x1f2 -> :sswitch_3
        0x1fa -> :sswitch_2
        0x202 -> :sswitch_1
        0x20a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 421
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/CopyObject;->_id:J

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

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
    const/16 p0, 0x33

    .line 16
    .line 17
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localCreatedSession:I

    .line 18
    .line 19
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 20
    .line 21
    .line 22
    const/16 p0, 0x34

    .line 23
    .line 24
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localInFeed:Z

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 27
    .line 28
    .line 29
    const/16 p0, 0x35

    .line 30
    .line 31
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localInUserFeed:Z

    .line 32
    .line 33
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    const/16 v0, 0x36

    .line 41
    .line 42
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    const/16 p0, 0x37

    .line 46
    .line 47
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->createdTime:D

    .line 48
    .line 49
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz p0, :cond_2

    .line 55
    .line 56
    const/16 v0, 0x38

    .line 57
    .line 58
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 62
    .line 63
    if-eqz p0, :cond_3

    .line 64
    .line 65
    sget-object v0, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const/16 v1, 0x39

    .line 72
    .line 73
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 74
    .line 75
    .line 76
    :cond_3
    const/16 p0, 0x3a

    .line 77
    .line 78
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 79
    .line 80
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 84
    .line 85
    if-eqz p0, :cond_4

    .line 86
    .line 87
    const/16 v0, 0x3b

    .line 88
    .line 89
    sget-object v1, Lcom/p1/mobile/putong/data/MessageLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 90
    .line 91
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 92
    .line 93
    .line 94
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentType:Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 95
    .line 96
    if-eqz p0, :cond_5

    .line 97
    .line 98
    const/16 v0, 0x3c

    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 105
    .line 106
    .line 107
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentType:Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 108
    .line 109
    if-eqz p0, :cond_6

    .line 110
    .line 111
    const/16 v0, 0x3d

    .line 112
    .line 113
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreMomentType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 114
    .line 115
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 116
    .line 117
    .line 118
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->videoBullets:Ljava/util/List;

    .line 119
    .line 120
    if-eqz p0, :cond_7

    .line 121
    .line 122
    sget-object v0, Lcom/p1/mobile/putong/core/data/VideoBullet;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 123
    .line 124
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    const/16 v1, 0x3e

    .line 129
    .line 130
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 131
    .line 132
    .line 133
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->musicId:Ljava/lang/String;

    .line 134
    .line 135
    if-eqz p0, :cond_8

    .line 136
    .line 137
    const/16 v0, 0x3f

    .line 138
    .line 139
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 140
    .line 141
    .line 142
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentCard:Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 143
    .line 144
    if-eqz p0, :cond_9

    .line 145
    .line 146
    const/16 v0, 0x40

    .line 147
    .line 148
    sget-object v1, Lcom/p1/mobile/putong/core/data/MomentCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 149
    .line 150
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 151
    .line 152
    .line 153
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->sourceType:Ljava/lang/String;

    .line 154
    .line 155
    if-eqz p0, :cond_a

    .line 156
    .line 157
    const/16 p1, 0x41

    .line 158
    .line 159
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 160
    .line 161
    .line 162
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

    .line 163
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo$1;->serialize(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
