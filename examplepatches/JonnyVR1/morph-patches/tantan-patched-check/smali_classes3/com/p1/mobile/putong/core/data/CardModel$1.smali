.class Lcom/p1/mobile/putong/core/data/CardModel$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/CardModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/CardModel;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CardModel;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CardModel;->userId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CardModel;->borderModel:Lcom/p1/mobile/putong/core/data/BorderModel;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/core/data/BorderModel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    const/4 v0, 0x3

    .line 25
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CardModel;->cardType:I

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CardModel;->extraData:Lcom/p1/mobile/putong/core/data/CardExtraData;

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    sget-object v2, Lcom/p1/mobile/putong/core/data/CardExtraData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 38
    .line 39
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_2
    const/4 v0, 0x5

    .line 45
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CardModel;->momentLikedYou:Z

    .line 46
    .line 47
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    const/4 v0, 0x6

    .line 53
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CardModel;->boostLikeYou:Z

    .line 54
    .line 55
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    const/4 v0, 0x7

    .line 61
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CardModel;->newUser:Z

    .line 62
    .line 63
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CardModel;->payCardStyle:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    const/16 v1, 0x8

    .line 73
    .line 74
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    add-int/2addr p0, v0

    .line 79
    :cond_3
    const/16 v0, 0x9

    .line 80
    .line 81
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CardModel;->meetAgain:Z

    .line 82
    .line 83
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    add-int/2addr p0, v0

    .line 88
    const/16 v0, 0xa

    .line 89
    .line 90
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CardModel;->friendSenseExamLikeCnt:I

    .line 91
    .line 92
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    add-int/2addr p0, v0

    .line 97
    const/16 v0, 0xb

    .line 98
    .line 99
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CardModel;->selectionUser:Z

    .line 100
    .line 101
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    add-int/2addr p0, v0

    .line 106
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CardModel;->dynamicLabels:Ljava/util/List;

    .line 107
    .line 108
    if-eqz v0, :cond_4

    .line 109
    .line 110
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 111
    .line 112
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    const/16 v2, 0xc

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
    :cond_4
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 124
    .line 125
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 126
    check-cast p1, Lcom/p1/mobile/putong/core/data/CardModel;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CardModel$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CardModel;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CardModel;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/CardModel;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/CardModel;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->userId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->userId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->borderModel:Lcom/p1/mobile/putong/core/data/BorderModel;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BorderModel;->new_()Lcom/p1/mobile/putong/core/data/BorderModel;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->borderModel:Lcom/p1/mobile/putong/core/data/BorderModel;

    .line 30
    .line 31
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->extraData:Lcom/p1/mobile/putong/core/data/CardExtraData;

    .line 32
    .line 33
    if-nez p1, :cond_2

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CardExtraData;->new_()Lcom/p1/mobile/putong/core/data/CardExtraData;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->extraData:Lcom/p1/mobile/putong/core/data/CardExtraData;

    .line 40
    .line 41
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->payCardStyle:Ljava/lang/String;

    .line 42
    .line 43
    if-nez p1, :cond_3

    .line 44
    .line 45
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->payCardStyle:Ljava/lang/String;

    .line 46
    .line 47
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->dynamicLabels:Ljava/util/List;

    .line 48
    .line 49
    if-nez p1, :cond_8

    .line 50
    .line 51
    new-instance p1, Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->dynamicLabels:Ljava/util/List;

    .line 57
    .line 58
    return-object p0

    .line 59
    :sswitch_0
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Ljava/util/List;

    .line 70
    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->dynamicLabels:Ljava/util/List;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->selectionUser:Z

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->friendSenseExamLikeCnt:I

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->meetAgain:Z

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->payCardStyle:Ljava/lang/String;

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->newUser:Z

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->boostLikeYou:Z

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->momentLikedYou:Z

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :sswitch_8
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardExtraData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 124
    .line 125
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    check-cast v0, Lcom/p1/mobile/putong/core/data/CardExtraData;

    .line 130
    .line 131
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->extraData:Lcom/p1/mobile/putong/core/data/CardExtraData;

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->cardType:I

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_a
    sget-object v0, Lcom/p1/mobile/putong/core/data/BorderModel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 143
    .line 144
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    check-cast v0, Lcom/p1/mobile/putong/core/data/BorderModel;

    .line 149
    .line 150
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->borderModel:Lcom/p1/mobile/putong/core/data/BorderModel;

    .line 151
    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CardModel;->userId:Ljava/lang/String;

    .line 159
    .line 160
    goto/16 :goto_0

    .line 161
    .line 162
    :sswitch_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->userId:Ljava/lang/String;

    .line 163
    .line 164
    if-nez p1, :cond_4

    .line 165
    .line 166
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->userId:Ljava/lang/String;

    .line 167
    .line 168
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->borderModel:Lcom/p1/mobile/putong/core/data/BorderModel;

    .line 169
    .line 170
    if-nez p1, :cond_5

    .line 171
    .line 172
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BorderModel;->new_()Lcom/p1/mobile/putong/core/data/BorderModel;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->borderModel:Lcom/p1/mobile/putong/core/data/BorderModel;

    .line 177
    .line 178
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->extraData:Lcom/p1/mobile/putong/core/data/CardExtraData;

    .line 179
    .line 180
    if-nez p1, :cond_6

    .line 181
    .line 182
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CardExtraData;->new_()Lcom/p1/mobile/putong/core/data/CardExtraData;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->extraData:Lcom/p1/mobile/putong/core/data/CardExtraData;

    .line 187
    .line 188
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->payCardStyle:Ljava/lang/String;

    .line 189
    .line 190
    if-nez p1, :cond_7

    .line 191
    .line 192
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->payCardStyle:Ljava/lang/String;

    .line 193
    .line 194
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->dynamicLabels:Ljava/util/List;

    .line 195
    .line 196
    if-nez p1, :cond_8

    .line 197
    .line 198
    new-instance p1, Ljava/util/ArrayList;

    .line 199
    .line 200
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 201
    .line 202
    .line 203
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CardModel;->dynamicLabels:Ljava/util/List;

    .line 204
    .line 205
    :cond_8
    return-object p0

    .line 206
    nop

    .line 207
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_c
        0xa -> :sswitch_b
        0x12 -> :sswitch_a
        0x18 -> :sswitch_9
        0x22 -> :sswitch_8
        0x28 -> :sswitch_7
        0x30 -> :sswitch_6
        0x38 -> :sswitch_5
        0x42 -> :sswitch_4
        0x48 -> :sswitch_3
        0x50 -> :sswitch_2
        0x58 -> :sswitch_1
        0x62 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 207
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CardModel$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CardModel;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/CardModel;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CardModel;->userId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CardModel;->borderModel:Lcom/p1/mobile/putong/core/data/BorderModel;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/data/BorderModel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    const/4 p0, 0x3

    .line 20
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CardModel;->cardType:I

    .line 21
    .line 22
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CardModel;->extraData:Lcom/p1/mobile/putong/core/data/CardExtraData;

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardExtraData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    const/4 p0, 0x5

    .line 36
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CardModel;->momentLikedYou:Z

    .line 37
    .line 38
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x6

    .line 42
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CardModel;->boostLikeYou:Z

    .line 43
    .line 44
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x7

    .line 48
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CardModel;->newUser:Z

    .line 49
    .line 50
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CardModel;->payCardStyle:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz p0, :cond_3

    .line 56
    .line 57
    const/16 v0, 0x8

    .line 58
    .line 59
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_3
    const/16 p0, 0x9

    .line 63
    .line 64
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CardModel;->meetAgain:Z

    .line 65
    .line 66
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 67
    .line 68
    .line 69
    const/16 p0, 0xa

    .line 70
    .line 71
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CardModel;->friendSenseExamLikeCnt:I

    .line 72
    .line 73
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 74
    .line 75
    .line 76
    const/16 p0, 0xb

    .line 77
    .line 78
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CardModel;->selectionUser:Z

    .line 79
    .line 80
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CardModel;->dynamicLabels:Ljava/util/List;

    .line 84
    .line 85
    if-eqz p0, :cond_4

    .line 86
    .line 87
    sget-object p1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    const/16 v0, 0xc

    .line 94
    .line 95
    invoke-virtual {p2, v0, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 96
    .line 97
    .line 98
    :cond_4
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 99
    check-cast p1, Lcom/p1/mobile/putong/core/data/CardModel;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/CardModel$1;->serialize(Lcom/p1/mobile/putong/core/data/CardModel;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
