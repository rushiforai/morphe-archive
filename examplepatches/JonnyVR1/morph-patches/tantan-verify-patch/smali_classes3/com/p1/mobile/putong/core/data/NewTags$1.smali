.class Lcom/p1/mobile/putong/core/data/NewTags$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/NewTags;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/NewTags;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/NewTags;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->categories:Ljava/util/List;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const/4 v2, 0x3

    .line 33
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x4

    .line 43
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->operation:Ljava/lang/String;

    .line 49
    .line 50
    if-eqz v0, :cond_4

    .line 51
    .line 52
    const/4 v1, 0x5

    .line 53
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->status:Ljava/lang/String;

    .line 59
    .line 60
    if-eqz v0, :cond_5

    .line 61
    .line 62
    const/4 v1, 0x6

    .line 63
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    :cond_5
    const/4 v0, 0x7

    .line 69
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localTagUserCounts:J

    .line 70
    .line 71
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int/2addr p0, v0

    .line 76
    const/16 v0, 0x8

    .line 77
    .line 78
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localIsCommonLabel:Z

    .line 79
    .line 80
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    add-int/2addr p0, v0

    .line 85
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localTagCategories:Ljava/util/List;

    .line 86
    .line 87
    if-eqz v0, :cond_6

    .line 88
    .line 89
    sget-object v1, Lcom/p1/mobile/putong/core/data/TagCategories;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    const/16 v2, 0x9

    .line 96
    .line 97
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    add-int/2addr p0, v0

    .line 102
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localShowName:Ljava/lang/String;

    .line 103
    .line 104
    if-eqz v0, :cond_7

    .line 105
    .line 106
    const/16 v1, 0xa

    .line 107
    .line 108
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    add-int/2addr p0, v0

    .line 113
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->gender:Ljava/lang/String;

    .line 114
    .line 115
    if-eqz v0, :cond_8

    .line 116
    .line 117
    const/16 v1, 0xb

    .line 118
    .line 119
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    add-int/2addr p0, v0

    .line 124
    :cond_8
    const/16 v0, 0xc

    .line 125
    .line 126
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->isPictureTag:Z

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
    iget v1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->index:I

    .line 136
    .line 137
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    add-int/2addr p0, v0

    .line 142
    const/16 v0, 0xe

    .line 143
    .line 144
    iget v1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->loadIcon:I

    .line 145
    .line 146
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    add-int/2addr p0, v0

    .line 151
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->nameColor:Ljava/lang/String;

    .line 152
    .line 153
    if-eqz v0, :cond_9

    .line 154
    .line 155
    const/16 v1, 0xf

    .line 156
    .line 157
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    add-int/2addr p0, v0

    .line 162
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->bgColor:Ljava/lang/String;

    .line 163
    .line 164
    if-eqz v0, :cond_a

    .line 165
    .line 166
    const/16 v1, 0x10

    .line 167
    .line 168
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    add-int/2addr p0, v0

    .line 173
    :cond_a
    const/16 v0, 0x11

    .line 174
    .line 175
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localShowCreditScore:Z

    .line 176
    .line 177
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    add-int/2addr p0, v0

    .line 182
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localCreditScore:Ljava/lang/String;

    .line 183
    .line 184
    if-eqz v0, :cond_b

    .line 185
    .line 186
    const/16 v1, 0x12

    .line 187
    .line 188
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    add-int/2addr p0, v0

    .line 193
    :cond_b
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 194
    .line 195
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 196
    check-cast p1, Lcom/p1/mobile/putong/core/data/NewTags;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/NewTags$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/NewTags;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/NewTags;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/NewTags;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->categories:Ljava/util/List;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    new-instance p1, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->categories:Ljava/util/List;

    .line 37
    .line 38
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 39
    .line 40
    if-nez p1, :cond_3

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 43
    .line 44
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->operation:Ljava/lang/String;

    .line 45
    .line 46
    if-nez p1, :cond_4

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->operation:Ljava/lang/String;

    .line 49
    .line 50
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->status:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_5

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->status:Ljava/lang/String;

    .line 55
    .line 56
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localTagCategories:Ljava/util/List;

    .line 57
    .line 58
    if-nez p1, :cond_6

    .line 59
    .line 60
    new-instance p1, Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localTagCategories:Ljava/util/List;

    .line 66
    .line 67
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localShowName:Ljava/lang/String;

    .line 68
    .line 69
    if-nez p1, :cond_7

    .line 70
    .line 71
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localShowName:Ljava/lang/String;

    .line 72
    .line 73
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->gender:Ljava/lang/String;

    .line 74
    .line 75
    if-nez p1, :cond_8

    .line 76
    .line 77
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->gender:Ljava/lang/String;

    .line 78
    .line 79
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->nameColor:Ljava/lang/String;

    .line 80
    .line 81
    if-nez p1, :cond_9

    .line 82
    .line 83
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->nameColor:Ljava/lang/String;

    .line 84
    .line 85
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->bgColor:Ljava/lang/String;

    .line 86
    .line 87
    if-nez p1, :cond_14

    .line 88
    .line 89
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->bgColor:Ljava/lang/String;

    .line 90
    .line 91
    return-object p0

    .line 92
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localCreditScore:Ljava/lang/String;

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localShowCreditScore:Z

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->bgColor:Ljava/lang/String;

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->nameColor:Ljava/lang/String;

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    iput v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->loadIcon:I

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    iput v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->index:I

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->isPictureTag:Z

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->gender:Ljava/lang/String;

    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localShowName:Ljava/lang/String;

    .line 155
    .line 156
    goto/16 :goto_0

    .line 157
    .line 158
    :sswitch_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/TagCategories;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 159
    .line 160
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    check-cast v0, Ljava/util/List;

    .line 169
    .line 170
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localTagCategories:Ljava/util/List;

    .line 171
    .line 172
    goto/16 :goto_0

    .line 173
    .line 174
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localIsCommonLabel:Z

    .line 179
    .line 180
    goto/16 :goto_0

    .line 181
    .line 182
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 183
    .line 184
    .line 185
    move-result-wide v0

    .line 186
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localTagUserCounts:J

    .line 187
    .line 188
    goto/16 :goto_0

    .line 189
    .line 190
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->status:Ljava/lang/String;

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->operation:Ljava/lang/String;

    .line 203
    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 211
    .line 212
    goto/16 :goto_0

    .line 213
    .line 214
    :sswitch_f
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 215
    .line 216
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    check-cast v0, Ljava/util/List;

    .line 225
    .line 226
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->categories:Ljava/util/List;

    .line 227
    .line 228
    goto/16 :goto_0

    .line 229
    .line 230
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 235
    .line 236
    goto/16 :goto_0

    .line 237
    .line 238
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 243
    .line 244
    goto/16 :goto_0

    .line 245
    .line 246
    :sswitch_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 247
    .line 248
    if-nez p1, :cond_a

    .line 249
    .line 250
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 251
    .line 252
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 253
    .line 254
    if-nez p1, :cond_b

    .line 255
    .line 256
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 257
    .line 258
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->categories:Ljava/util/List;

    .line 259
    .line 260
    if-nez p1, :cond_c

    .line 261
    .line 262
    new-instance p1, Ljava/util/ArrayList;

    .line 263
    .line 264
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 265
    .line 266
    .line 267
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->categories:Ljava/util/List;

    .line 268
    .line 269
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 270
    .line 271
    if-nez p1, :cond_d

    .line 272
    .line 273
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 274
    .line 275
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->operation:Ljava/lang/String;

    .line 276
    .line 277
    if-nez p1, :cond_e

    .line 278
    .line 279
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->operation:Ljava/lang/String;

    .line 280
    .line 281
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->status:Ljava/lang/String;

    .line 282
    .line 283
    if-nez p1, :cond_f

    .line 284
    .line 285
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->status:Ljava/lang/String;

    .line 286
    .line 287
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localTagCategories:Ljava/util/List;

    .line 288
    .line 289
    if-nez p1, :cond_10

    .line 290
    .line 291
    new-instance p1, Ljava/util/ArrayList;

    .line 292
    .line 293
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 294
    .line 295
    .line 296
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localTagCategories:Ljava/util/List;

    .line 297
    .line 298
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localShowName:Ljava/lang/String;

    .line 299
    .line 300
    if-nez p1, :cond_11

    .line 301
    .line 302
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localShowName:Ljava/lang/String;

    .line 303
    .line 304
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->gender:Ljava/lang/String;

    .line 305
    .line 306
    if-nez p1, :cond_12

    .line 307
    .line 308
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->gender:Ljava/lang/String;

    .line 309
    .line 310
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->nameColor:Ljava/lang/String;

    .line 311
    .line 312
    if-nez p1, :cond_13

    .line 313
    .line 314
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->nameColor:Ljava/lang/String;

    .line 315
    .line 316
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->bgColor:Ljava/lang/String;

    .line 317
    .line 318
    if-nez p1, :cond_14

    .line 319
    .line 320
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->bgColor:Ljava/lang/String;

    .line 321
    .line 322
    :cond_14
    return-object p0

    .line 323
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_12
        0xa -> :sswitch_11
        0x12 -> :sswitch_10
        0x1a -> :sswitch_f
        0x22 -> :sswitch_e
        0x2a -> :sswitch_d
        0x32 -> :sswitch_c
        0x38 -> :sswitch_b
        0x40 -> :sswitch_a
        0x4a -> :sswitch_9
        0x52 -> :sswitch_8
        0x5a -> :sswitch_7
        0x60 -> :sswitch_6
        0x68 -> :sswitch_5
        0x70 -> :sswitch_4
        0x7a -> :sswitch_3
        0x82 -> :sswitch_2
        0x88 -> :sswitch_1
        0x92 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 323
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/NewTags$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/NewTags;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/NewTags;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->categories:Ljava/util/List;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v1, 0x3

    .line 28
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->operation:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz p0, :cond_4

    .line 42
    .line 43
    const/4 v0, 0x5

    .line 44
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->status:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz p0, :cond_5

    .line 50
    .line 51
    const/4 v0, 0x6

    .line 52
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_5
    const/4 p0, 0x7

    .line 56
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localTagUserCounts:J

    .line 57
    .line 58
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 59
    .line 60
    .line 61
    const/16 p0, 0x8

    .line 62
    .line 63
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localIsCommonLabel:Z

    .line 64
    .line 65
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localTagCategories:Ljava/util/List;

    .line 69
    .line 70
    if-eqz p0, :cond_6

    .line 71
    .line 72
    sget-object v0, Lcom/p1/mobile/putong/core/data/TagCategories;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    const/16 v1, 0x9

    .line 79
    .line 80
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 81
    .line 82
    .line 83
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localShowName:Ljava/lang/String;

    .line 84
    .line 85
    if-eqz p0, :cond_7

    .line 86
    .line 87
    const/16 v0, 0xa

    .line 88
    .line 89
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 90
    .line 91
    .line 92
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->gender:Ljava/lang/String;

    .line 93
    .line 94
    if-eqz p0, :cond_8

    .line 95
    .line 96
    const/16 v0, 0xb

    .line 97
    .line 98
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_8
    const/16 p0, 0xc

    .line 102
    .line 103
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->isPictureTag:Z

    .line 104
    .line 105
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 106
    .line 107
    .line 108
    const/16 p0, 0xd

    .line 109
    .line 110
    iget v0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->index:I

    .line 111
    .line 112
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 113
    .line 114
    .line 115
    const/16 p0, 0xe

    .line 116
    .line 117
    iget v0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->loadIcon:I

    .line 118
    .line 119
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 120
    .line 121
    .line 122
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->nameColor:Ljava/lang/String;

    .line 123
    .line 124
    if-eqz p0, :cond_9

    .line 125
    .line 126
    const/16 v0, 0xf

    .line 127
    .line 128
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 129
    .line 130
    .line 131
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->bgColor:Ljava/lang/String;

    .line 132
    .line 133
    if-eqz p0, :cond_a

    .line 134
    .line 135
    const/16 v0, 0x10

    .line 136
    .line 137
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 138
    .line 139
    .line 140
    :cond_a
    const/16 p0, 0x11

    .line 141
    .line 142
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localShowCreditScore:Z

    .line 143
    .line 144
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 145
    .line 146
    .line 147
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localCreditScore:Ljava/lang/String;

    .line 148
    .line 149
    if-eqz p0, :cond_b

    .line 150
    .line 151
    const/16 p1, 0x12

    .line 152
    .line 153
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 154
    .line 155
    .line 156
    :cond_b
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 157
    check-cast p1, Lcom/p1/mobile/putong/core/data/NewTags;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/NewTags$1;->serialize(Lcom/p1/mobile/putong/core/data/NewTags;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
