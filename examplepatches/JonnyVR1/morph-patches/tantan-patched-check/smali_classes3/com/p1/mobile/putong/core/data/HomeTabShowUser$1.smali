.class Lcom/p1/mobile/putong/core/data/HomeTabShowUser$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/HomeTabShowUser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/HomeTabShowUser;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/HomeTabShowUser;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->id:Ljava/lang/String;

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
    const/4 v0, 0x2

    .line 13
    iget v1, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->age:I

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/2addr p0, v0

    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->pictures:Ljava/util/List;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    sget-object v1, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const/4 v2, 0x4

    .line 45
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->relationship:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 51
    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    const/4 v1, 0x5

    .line 55
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->location:Lcom/p1/mobile/putong/data/Location;

    .line 65
    .line 66
    if-eqz v0, :cond_4

    .line 67
    .line 68
    const/4 v1, 0x6

    .line 69
    sget-object v2, Lcom/p1/mobile/putong/data/Location;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 70
    .line 71
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int/2addr p0, v0

    .line 76
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 77
    .line 78
    if-eqz v0, :cond_5

    .line 79
    .line 80
    const/4 v1, 0x7

    .line 81
    sget-object v2, Lcom/p1/mobile/putong/data/Profile;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    const/16 v0, 0x8

    .line 89
    .line 90
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->popular:Z

    .line 91
    .line 92
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    add-int/2addr p0, v0

    .line 97
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->name:Ljava/lang/String;

    .line 98
    .line 99
    if-eqz v0, :cond_6

    .line 100
    .line 101
    const/16 v1, 0x9

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->description:Ljava/lang/String;

    .line 109
    .line 110
    if-eqz v0, :cond_7

    .line 111
    .line 112
    const/16 v1, 0xa

    .line 113
    .line 114
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    add-int/2addr p0, v0

    .line 119
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->tags:Ljava/util/List;

    .line 120
    .line 121
    if-eqz v0, :cond_8

    .line 122
    .line 123
    sget-object v1, Lcom/p1/mobile/putong/data/Tag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 124
    .line 125
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    const/16 v2, 0xb

    .line 130
    .line 131
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    add-int/2addr p0, v0

    .line 136
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 137
    .line 138
    if-eqz v0, :cond_9

    .line 139
    .line 140
    const/16 v1, 0xc

    .line 141
    .line 142
    sget-object v2, Lcom/p1/mobile/putong/data/Gender;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 143
    .line 144
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    add-int/2addr p0, v0

    .line 149
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->relationship:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 150
    .line 151
    if-eqz v0, :cond_a

    .line 152
    .line 153
    const/16 v1, 0xd

    .line 154
    .line 155
    sget-object v2, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 156
    .line 157
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    add-int/2addr p0, v0

    .line 162
    :cond_a
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 163
    .line 164
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 165
    check-cast p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/HomeTabShowUser$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/HomeTabShowUser;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/HomeTabShowUser;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    sget-object p1, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/data/Gender;

    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 37
    .line 38
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->relationship:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 39
    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->relationship:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->id:Ljava/lang/String;

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->id:Ljava/lang/String;

    .line 63
    .line 64
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 65
    .line 66
    if-nez p1, :cond_3

    .line 67
    .line 68
    sget-object p1, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    check-cast p1, Lcom/p1/mobile/putong/data/Gender;

    .line 75
    .line 76
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 77
    .line 78
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->pictures:Ljava/util/List;

    .line 79
    .line 80
    if-nez p1, :cond_4

    .line 81
    .line 82
    new-instance p1, Ljava/util/ArrayList;

    .line 83
    .line 84
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 85
    .line 86
    .line 87
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->pictures:Ljava/util/List;

    .line 88
    .line 89
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->relationship:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 90
    .line 91
    if-nez p1, :cond_5

    .line 92
    .line 93
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 100
    .line 101
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->relationship:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 102
    .line 103
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->location:Lcom/p1/mobile/putong/data/Location;

    .line 104
    .line 105
    if-nez p1, :cond_6

    .line 106
    .line 107
    invoke-static {}, Lcom/p1/mobile/putong/data/Location;->new_()Lcom/p1/mobile/putong/data/Location;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->location:Lcom/p1/mobile/putong/data/Location;

    .line 112
    .line 113
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 114
    .line 115
    if-nez p1, :cond_7

    .line 116
    .line 117
    invoke-static {}, Lcom/p1/mobile/putong/data/Profile;->new_()Lcom/p1/mobile/putong/data/Profile;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 122
    .line 123
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->name:Ljava/lang/String;

    .line 124
    .line 125
    if-nez p1, :cond_8

    .line 126
    .line 127
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->name:Ljava/lang/String;

    .line 128
    .line 129
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->description:Ljava/lang/String;

    .line 130
    .line 131
    if-nez p1, :cond_9

    .line 132
    .line 133
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->description:Ljava/lang/String;

    .line 134
    .line 135
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->tags:Ljava/util/List;

    .line 136
    .line 137
    if-nez p1, :cond_14

    .line 138
    .line 139
    new-instance p1, Ljava/util/ArrayList;

    .line 140
    .line 141
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 142
    .line 143
    .line 144
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->tags:Ljava/util/List;

    .line 145
    .line 146
    return-object p0

    .line 147
    :sswitch_0
    sget-object v3, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 148
    .line 149
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    check-cast v3, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 154
    .line 155
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->relationship:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 156
    .line 157
    goto/16 :goto_0

    .line 158
    .line 159
    :sswitch_1
    sget-object v3, Lcom/p1/mobile/putong/data/Gender;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 160
    .line 161
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    check-cast v3, Lcom/p1/mobile/putong/data/Gender;

    .line 166
    .line 167
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 168
    .line 169
    goto/16 :goto_0

    .line 170
    .line 171
    :sswitch_2
    sget-object v3, Lcom/p1/mobile/putong/data/Tag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 172
    .line 173
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v3

    .line 181
    check-cast v3, Ljava/util/List;

    .line 182
    .line 183
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->tags:Ljava/util/List;

    .line 184
    .line 185
    goto/16 :goto_0

    .line 186
    .line 187
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->description:Ljava/lang/String;

    .line 192
    .line 193
    goto/16 :goto_0

    .line 194
    .line 195
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v3

    .line 199
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->name:Ljava/lang/String;

    .line 200
    .line 201
    goto/16 :goto_0

    .line 202
    .line 203
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 204
    .line 205
    .line 206
    move-result v3

    .line 207
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->popular:Z

    .line 208
    .line 209
    goto/16 :goto_0

    .line 210
    .line 211
    :sswitch_6
    sget-object v3, Lcom/p1/mobile/putong/data/Profile;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 212
    .line 213
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    check-cast v3, Lcom/p1/mobile/putong/data/Profile;

    .line 218
    .line 219
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 220
    .line 221
    goto/16 :goto_0

    .line 222
    .line 223
    :sswitch_7
    sget-object v3, Lcom/p1/mobile/putong/data/Location;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 224
    .line 225
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object v3

    .line 229
    check-cast v3, Lcom/p1/mobile/putong/data/Location;

    .line 230
    .line 231
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->location:Lcom/p1/mobile/putong/data/Location;

    .line 232
    .line 233
    goto/16 :goto_0

    .line 234
    .line 235
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 236
    .line 237
    .line 238
    move-result v2

    .line 239
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 240
    .line 241
    .line 242
    move-result-object v2

    .line 243
    goto/16 :goto_0

    .line 244
    .line 245
    :sswitch_9
    sget-object v3, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 246
    .line 247
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 248
    .line 249
    .line 250
    move-result-object v3

    .line 251
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    move-result-object v3

    .line 255
    check-cast v3, Ljava/util/List;

    .line 256
    .line 257
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->pictures:Ljava/util/List;

    .line 258
    .line 259
    goto/16 :goto_0

    .line 260
    .line 261
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 262
    .line 263
    .line 264
    move-result v1

    .line 265
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    goto/16 :goto_0

    .line 270
    .line 271
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 272
    .line 273
    .line 274
    move-result v3

    .line 275
    iput v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->age:I

    .line 276
    .line 277
    goto/16 :goto_0

    .line 278
    .line 279
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v3

    .line 283
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->id:Ljava/lang/String;

    .line 284
    .line 285
    goto/16 :goto_0

    .line 286
    .line 287
    :sswitch_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 288
    .line 289
    if-nez p1, :cond_a

    .line 290
    .line 291
    if-eqz v1, :cond_a

    .line 292
    .line 293
    sget-object p1, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 294
    .line 295
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 296
    .line 297
    .line 298
    move-result v1

    .line 299
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    check-cast p1, Lcom/p1/mobile/putong/data/Gender;

    .line 304
    .line 305
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 306
    .line 307
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->relationship:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 308
    .line 309
    if-nez p1, :cond_b

    .line 310
    .line 311
    if-eqz v2, :cond_b

    .line 312
    .line 313
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 314
    .line 315
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 316
    .line 317
    .line 318
    move-result v1

    .line 319
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 320
    .line 321
    .line 322
    move-result-object p1

    .line 323
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 324
    .line 325
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->relationship:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 326
    .line 327
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->id:Ljava/lang/String;

    .line 328
    .line 329
    if-nez p1, :cond_c

    .line 330
    .line 331
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->id:Ljava/lang/String;

    .line 332
    .line 333
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 334
    .line 335
    if-nez p1, :cond_d

    .line 336
    .line 337
    sget-object p1, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 338
    .line 339
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 340
    .line 341
    .line 342
    move-result-object p1

    .line 343
    check-cast p1, Lcom/p1/mobile/putong/data/Gender;

    .line 344
    .line 345
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 346
    .line 347
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->pictures:Ljava/util/List;

    .line 348
    .line 349
    if-nez p1, :cond_e

    .line 350
    .line 351
    new-instance p1, Ljava/util/ArrayList;

    .line 352
    .line 353
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 354
    .line 355
    .line 356
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->pictures:Ljava/util/List;

    .line 357
    .line 358
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->relationship:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 359
    .line 360
    if-nez p1, :cond_f

    .line 361
    .line 362
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 363
    .line 364
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 365
    .line 366
    .line 367
    move-result-object p1

    .line 368
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 369
    .line 370
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->relationship:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 371
    .line 372
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->location:Lcom/p1/mobile/putong/data/Location;

    .line 373
    .line 374
    if-nez p1, :cond_10

    .line 375
    .line 376
    invoke-static {}, Lcom/p1/mobile/putong/data/Location;->new_()Lcom/p1/mobile/putong/data/Location;

    .line 377
    .line 378
    .line 379
    move-result-object p1

    .line 380
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->location:Lcom/p1/mobile/putong/data/Location;

    .line 381
    .line 382
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 383
    .line 384
    if-nez p1, :cond_11

    .line 385
    .line 386
    invoke-static {}, Lcom/p1/mobile/putong/data/Profile;->new_()Lcom/p1/mobile/putong/data/Profile;

    .line 387
    .line 388
    .line 389
    move-result-object p1

    .line 390
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 391
    .line 392
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->name:Ljava/lang/String;

    .line 393
    .line 394
    if-nez p1, :cond_12

    .line 395
    .line 396
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->name:Ljava/lang/String;

    .line 397
    .line 398
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->description:Ljava/lang/String;

    .line 399
    .line 400
    if-nez p1, :cond_13

    .line 401
    .line 402
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->description:Ljava/lang/String;

    .line 403
    .line 404
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->tags:Ljava/util/List;

    .line 405
    .line 406
    if-nez p1, :cond_14

    .line 407
    .line 408
    new-instance p1, Ljava/util/ArrayList;

    .line 409
    .line 410
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 411
    .line 412
    .line 413
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->tags:Ljava/util/List;

    .line 414
    .line 415
    :cond_14
    return-object p0

    .line 416
    nop

    .line 417
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_d
        0xa -> :sswitch_c
        0x10 -> :sswitch_b
        0x18 -> :sswitch_a
        0x22 -> :sswitch_9
        0x28 -> :sswitch_8
        0x32 -> :sswitch_7
        0x3a -> :sswitch_6
        0x40 -> :sswitch_5
        0x4a -> :sswitch_4
        0x52 -> :sswitch_3
        0x5a -> :sswitch_2
        0x62 -> :sswitch_1
        0x6a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 417
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/HomeTabShowUser$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/HomeTabShowUser;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/HomeTabShowUser;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->id:Ljava/lang/String;

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
    const/4 p0, 0x2

    .line 10
    iget v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->age:I

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->pictures:Ljava/util/List;

    .line 28
    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const/4 v1, 0x4

    .line 38
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 39
    .line 40
    .line 41
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->relationship:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 42
    .line 43
    if-eqz p0, :cond_3

    .line 44
    .line 45
    const/4 v0, 0x5

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 51
    .line 52
    .line 53
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->location:Lcom/p1/mobile/putong/data/Location;

    .line 54
    .line 55
    if-eqz p0, :cond_4

    .line 56
    .line 57
    const/4 v0, 0x6

    .line 58
    sget-object v1, Lcom/p1/mobile/putong/data/Location;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 59
    .line 60
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 61
    .line 62
    .line 63
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 64
    .line 65
    if-eqz p0, :cond_5

    .line 66
    .line 67
    const/4 v0, 0x7

    .line 68
    sget-object v1, Lcom/p1/mobile/putong/data/Profile;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 69
    .line 70
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 71
    .line 72
    .line 73
    :cond_5
    const/16 p0, 0x8

    .line 74
    .line 75
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->popular:Z

    .line 76
    .line 77
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->name:Ljava/lang/String;

    .line 81
    .line 82
    if-eqz p0, :cond_6

    .line 83
    .line 84
    const/16 v0, 0x9

    .line 85
    .line 86
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->description:Ljava/lang/String;

    .line 90
    .line 91
    if-eqz p0, :cond_7

    .line 92
    .line 93
    const/16 v0, 0xa

    .line 94
    .line 95
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 96
    .line 97
    .line 98
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->tags:Ljava/util/List;

    .line 99
    .line 100
    if-eqz p0, :cond_8

    .line 101
    .line 102
    sget-object v0, Lcom/p1/mobile/putong/data/Tag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 103
    .line 104
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    const/16 v1, 0xb

    .line 109
    .line 110
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 111
    .line 112
    .line 113
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 114
    .line 115
    if-eqz p0, :cond_9

    .line 116
    .line 117
    const/16 v0, 0xc

    .line 118
    .line 119
    sget-object v1, Lcom/p1/mobile/putong/data/Gender;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 120
    .line 121
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 122
    .line 123
    .line 124
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;->relationship:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 125
    .line 126
    if-eqz p0, :cond_a

    .line 127
    .line 128
    const/16 p1, 0xd

    .line 129
    .line 130
    sget-object v0, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 131
    .line 132
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 133
    .line 134
    .line 135
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

    .line 136
    check-cast p1, Lcom/p1/mobile/putong/core/data/HomeTabShowUser;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/HomeTabShowUser$1;->serialize(Lcom/p1/mobile/putong/core/data/HomeTabShowUser;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
