.class Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->enable:Z

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->idNumShow:Z

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    const/4 v0, 0x3

    .line 17
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->myTabFetchCoolTime:I

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->sections_order:Ljava/util/List;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const/4 v2, 0x4

    .line 35
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_0
    const/4 v0, 0x5

    .line 41
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->dislikeCountToTriggerGuide:I

    .line 42
    .line 43
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    const/4 v0, 0x6

    .line 49
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->maxDislikeGuideShowCount:I

    .line 50
    .line 51
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    const/4 v0, 0x7

    .line 57
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->likeCountToTriggerGuide:I

    .line 58
    .line 59
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    const/16 v0, 0x8

    .line 65
    .line 66
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->maxLikeGuideShowCount:I

    .line 67
    .line 68
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    add-int/2addr p0, v0

    .line 73
    const/16 v0, 0x9

    .line 74
    .line 75
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->showNaviOnlyWhenReachTop:Z

    .line 76
    .line 77
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    add-int/2addr p0, v0

    .line 82
    const/16 v0, 0xa

    .line 83
    .line 84
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->sendProfileLikeEnable:Z

    .line 85
    .line 86
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    add-int/2addr p0, v0

    .line 91
    const/16 v0, 0xb

    .line 92
    .line 93
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->receiveProfileLikeEnable:Z

    .line 94
    .line 95
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr p0, v0

    .line 100
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->default_order:Ljava/util/List;

    .line 101
    .line 102
    if-eqz v0, :cond_1

    .line 103
    .line 104
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 105
    .line 106
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    const/16 v2, 0xc

    .line 111
    .line 112
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    add-int/2addr p0, v0

    .line 117
    :cond_1
    const/16 v0, 0xd

    .line 118
    .line 119
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->checkPicNum:I

    .line 120
    .line 121
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    add-int/2addr p0, v0

    .line 126
    const/16 v0, 0xe

    .line 127
    .line 128
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->checkPicIndex:I

    .line 129
    .line 130
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    add-int/2addr p0, v0

    .line 135
    const/16 v0, 0xf

    .line 136
    .line 137
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->pic_label_op_enable:Z

    .line 138
    .line 139
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    add-int/2addr p0, v0

    .line 144
    const/16 v0, 0x10

    .line 145
    .line 146
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->nextInfoHeight:I

    .line 147
    .line 148
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    add-int/2addr p0, v0

    .line 153
    const/16 v0, 0x11

    .line 154
    .line 155
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->lifePicIndex:I

    .line 156
    .line 157
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    add-int/2addr p0, v0

    .line 162
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 163
    .line 164
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 165
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;-><init>()V

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
    sparse-switch v0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->sections_order:Ljava/util/List;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    new-instance p1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->sections_order:Ljava/util/List;

    .line 23
    .line 24
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->default_order:Ljava/util/List;

    .line 25
    .line 26
    if-nez p1, :cond_2

    .line 27
    .line 28
    new-instance p1, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->default_order:Ljava/util/List;

    .line 34
    .line 35
    return-object p0

    .line 36
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->lifePicIndex:I

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->nextInfoHeight:I

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->pic_label_op_enable:Z

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->checkPicIndex:I

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->checkPicNum:I

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :sswitch_5
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Ljava/util/List;

    .line 82
    .line 83
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->default_order:Ljava/util/List;

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->receiveProfileLikeEnable:Z

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->sendProfileLikeEnable:Z

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->showNaviOnlyWhenReachTop:Z

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->maxLikeGuideShowCount:I

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->likeCountToTriggerGuide:I

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->maxDislikeGuideShowCount:I

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->dislikeCountToTriggerGuide:I

    .line 133
    .line 134
    goto/16 :goto_0

    .line 135
    .line 136
    :sswitch_d
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 137
    .line 138
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    check-cast v0, Ljava/util/List;

    .line 147
    .line 148
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->sections_order:Ljava/util/List;

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->myTabFetchCoolTime:I

    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->idNumShow:Z

    .line 165
    .line 166
    goto/16 :goto_0

    .line 167
    .line 168
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->enable:Z

    .line 173
    .line 174
    goto/16 :goto_0

    .line 175
    .line 176
    :sswitch_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->sections_order:Ljava/util/List;

    .line 177
    .line 178
    if-nez p1, :cond_1

    .line 179
    .line 180
    new-instance p1, Ljava/util/ArrayList;

    .line 181
    .line 182
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 183
    .line 184
    .line 185
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->sections_order:Ljava/util/List;

    .line 186
    .line 187
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->default_order:Ljava/util/List;

    .line 188
    .line 189
    if-nez p1, :cond_2

    .line 190
    .line 191
    new-instance p1, Ljava/util/ArrayList;

    .line 192
    .line 193
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 194
    .line 195
    .line 196
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->default_order:Ljava/util/List;

    .line 197
    .line 198
    :cond_2
    return-object p0

    .line 199
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_11
        0x8 -> :sswitch_10
        0x10 -> :sswitch_f
        0x18 -> :sswitch_e
        0x22 -> :sswitch_d
        0x28 -> :sswitch_c
        0x30 -> :sswitch_b
        0x38 -> :sswitch_a
        0x40 -> :sswitch_9
        0x48 -> :sswitch_8
        0x50 -> :sswitch_7
        0x58 -> :sswitch_6
        0x62 -> :sswitch_5
        0x68 -> :sswitch_4
        0x70 -> :sswitch_3
        0x78 -> :sswitch_2
        0x80 -> :sswitch_1
        0x88 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 199
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->enable:Z

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->idNumShow:Z

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->myTabFetchCoolTime:I

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->sections_order:Ljava/util/List;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/4 v1, 0x4

    .line 30
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    const/4 p0, 0x5

    .line 34
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->dislikeCountToTriggerGuide:I

    .line 35
    .line 36
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x6

    .line 40
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->maxDislikeGuideShowCount:I

    .line 41
    .line 42
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x7

    .line 46
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->likeCountToTriggerGuide:I

    .line 47
    .line 48
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 49
    .line 50
    .line 51
    const/16 p0, 0x8

    .line 52
    .line 53
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->maxLikeGuideShowCount:I

    .line 54
    .line 55
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 56
    .line 57
    .line 58
    const/16 p0, 0x9

    .line 59
    .line 60
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->showNaviOnlyWhenReachTop:Z

    .line 61
    .line 62
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 63
    .line 64
    .line 65
    const/16 p0, 0xa

    .line 66
    .line 67
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->sendProfileLikeEnable:Z

    .line 68
    .line 69
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 70
    .line 71
    .line 72
    const/16 p0, 0xb

    .line 73
    .line 74
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->receiveProfileLikeEnable:Z

    .line 75
    .line 76
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->default_order:Ljava/util/List;

    .line 80
    .line 81
    if-eqz p0, :cond_1

    .line 82
    .line 83
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const/16 v1, 0xc

    .line 90
    .line 91
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 92
    .line 93
    .line 94
    :cond_1
    const/16 p0, 0xd

    .line 95
    .line 96
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->checkPicNum:I

    .line 97
    .line 98
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 99
    .line 100
    .line 101
    const/16 p0, 0xe

    .line 102
    .line 103
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->checkPicIndex:I

    .line 104
    .line 105
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 106
    .line 107
    .line 108
    const/16 p0, 0xf

    .line 109
    .line 110
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->pic_label_op_enable:Z

    .line 111
    .line 112
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 113
    .line 114
    .line 115
    const/16 p0, 0x10

    .line 116
    .line 117
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->nextInfoHeight:I

    .line 118
    .line 119
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 120
    .line 121
    .line 122
    const/16 p0, 0x11

    .line 123
    .line 124
    iget p1, p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;->lifePicIndex:I

    .line 125
    .line 126
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 127
    .line 128
    .line 129
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
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig$1;->serialize(Lcom/p1/mobile/putong/core/data/CoreExpandedCardConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
