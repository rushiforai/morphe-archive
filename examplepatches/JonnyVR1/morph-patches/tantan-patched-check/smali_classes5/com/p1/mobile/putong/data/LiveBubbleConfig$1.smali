.class Lcom/p1/mobile/putong/data/LiveBubbleConfig$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/LiveBubbleConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/LiveBubbleConfig;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/LiveBubbleConfig;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->type:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextList:Ljava/util/List;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

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
    iget v1, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowAfterWatch:I

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
    const/16 v0, 0x8

    .line 77
    .line 78
    iget v1, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleDisappear:I

    .line 79
    .line 80
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    add-int/2addr p0, v0

    .line 85
    const/16 v0, 0x9

    .line 86
    .line 87
    iget v1, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEveryDayShowMaxCount:I

    .line 88
    .line 89
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    add-int/2addr p0, v0

    .line 94
    const/16 v0, 0xa

    .line 95
    .line 96
    iget v1, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleUserShowMaxCount:I

    .line 97
    .line 98
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    add-int/2addr p0, v0

    .line 103
    const/16 v0, 0xb

    .line 104
    .line 105
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->needCheckHasEnterSquare:Z

    .line 106
    .line 107
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    add-int/2addr p0, v0

    .line 112
    const/16 v0, 0xc

    .line 113
    .line 114
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->needCheckHasEnterLive:Z

    .line 115
    .line 116
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    add-int/2addr p0, v0

    .line 121
    const/16 v0, 0xd

    .line 122
    .line 123
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTimeInterval:J

    .line 124
    .line 125
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    add-int/2addr p0, v0

    .line 130
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->subType:Ljava/lang/String;

    .line 131
    .line 132
    if-eqz v0, :cond_6

    .line 133
    .line 134
    const/16 v1, 0xe

    .line 135
    .line 136
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    add-int/2addr p0, v0

    .line 141
    :cond_6
    const/16 v0, 0xf

    .line 142
    .line 143
    iget v1, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowNotMatchedTimes:I

    .line 144
    .line 145
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    add-int/2addr p0, v0

    .line 150
    const/16 v0, 0x10

    .line 151
    .line 152
    iget v1, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowDisappearDays:I

    .line 153
    .line 154
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    add-int/2addr p0, v0

    .line 159
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 160
    .line 161
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 162
    check-cast p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/LiveBubbleConfig$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/LiveBubbleConfig;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/LiveBubbleConfig;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/LiveBubbleConfig;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->id:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->id:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->type:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->type:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextList:Ljava/util/List;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 37
    .line 38
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

    .line 39
    .line 40
    if-nez p1, :cond_3

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

    .line 43
    .line 44
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

    .line 45
    .line 46
    if-nez p1, :cond_4

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

    .line 49
    .line 50
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_5

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 55
    .line 56
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->subType:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_c

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->subType:Ljava/lang/String;

    .line 61
    .line 62
    return-object p0

    .line 63
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    iput v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowDisappearDays:I

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    iput v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowNotMatchedTimes:I

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->subType:Ljava/lang/String;

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 85
    .line 86
    .line 87
    move-result-wide v0

    .line 88
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTimeInterval:J

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->needCheckHasEnterLive:Z

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->needCheckHasEnterSquare:Z

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    iput v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleUserShowMaxCount:I

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    iput v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEveryDayShowMaxCount:I

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    iput v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleDisappear:I

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    iput v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowAfterWatch:I

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

    .line 154
    .line 155
    goto/16 :goto_0

    .line 156
    .line 157
    :sswitch_d
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 158
    .line 159
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    check-cast v0, Ljava/util/List;

    .line 168
    .line 169
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 170
    .line 171
    goto/16 :goto_0

    .line 172
    .line 173
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->type:Ljava/lang/String;

    .line 178
    .line 179
    goto/16 :goto_0

    .line 180
    .line 181
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->id:Ljava/lang/String;

    .line 186
    .line 187
    goto/16 :goto_0

    .line 188
    .line 189
    :sswitch_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->id:Ljava/lang/String;

    .line 190
    .line 191
    if-nez p1, :cond_6

    .line 192
    .line 193
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->id:Ljava/lang/String;

    .line 194
    .line 195
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->type:Ljava/lang/String;

    .line 196
    .line 197
    if-nez p1, :cond_7

    .line 198
    .line 199
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->type:Ljava/lang/String;

    .line 200
    .line 201
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 202
    .line 203
    if-nez p1, :cond_8

    .line 204
    .line 205
    new-instance p1, Ljava/util/ArrayList;

    .line 206
    .line 207
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 208
    .line 209
    .line 210
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 211
    .line 212
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

    .line 213
    .line 214
    if-nez p1, :cond_9

    .line 215
    .line 216
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

    .line 217
    .line 218
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

    .line 219
    .line 220
    if-nez p1, :cond_a

    .line 221
    .line 222
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

    .line 223
    .line 224
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 225
    .line 226
    if-nez p1, :cond_b

    .line 227
    .line 228
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 229
    .line 230
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->subType:Ljava/lang/String;

    .line 231
    .line 232
    if-nez p1, :cond_c

    .line 233
    .line 234
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->subType:Ljava/lang/String;

    .line 235
    .line 236
    :cond_c
    return-object p0

    .line 237
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_10
        0xa -> :sswitch_f
        0x12 -> :sswitch_e
        0x1a -> :sswitch_d
        0x22 -> :sswitch_c
        0x2a -> :sswitch_b
        0x32 -> :sswitch_a
        0x38 -> :sswitch_9
        0x40 -> :sswitch_8
        0x48 -> :sswitch_7
        0x50 -> :sswitch_6
        0x58 -> :sswitch_5
        0x60 -> :sswitch_4
        0x68 -> :sswitch_3
        0x72 -> :sswitch_2
        0x78 -> :sswitch_1
        0x80 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 237
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/LiveBubbleConfig$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/LiveBubbleConfig;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/LiveBubbleConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->type:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextList:Ljava/util/List;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

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
    iget v0, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowAfterWatch:I

    .line 57
    .line 58
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 59
    .line 60
    .line 61
    const/16 p0, 0x8

    .line 62
    .line 63
    iget v0, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleDisappear:I

    .line 64
    .line 65
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 66
    .line 67
    .line 68
    const/16 p0, 0x9

    .line 69
    .line 70
    iget v0, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEveryDayShowMaxCount:I

    .line 71
    .line 72
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 73
    .line 74
    .line 75
    const/16 p0, 0xa

    .line 76
    .line 77
    iget v0, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleUserShowMaxCount:I

    .line 78
    .line 79
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 80
    .line 81
    .line 82
    const/16 p0, 0xb

    .line 83
    .line 84
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->needCheckHasEnterSquare:Z

    .line 85
    .line 86
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 87
    .line 88
    .line 89
    const/16 p0, 0xc

    .line 90
    .line 91
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->needCheckHasEnterLive:Z

    .line 92
    .line 93
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 94
    .line 95
    .line 96
    const/16 p0, 0xd

    .line 97
    .line 98
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTimeInterval:J

    .line 99
    .line 100
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 101
    .line 102
    .line 103
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->subType:Ljava/lang/String;

    .line 104
    .line 105
    if-eqz p0, :cond_6

    .line 106
    .line 107
    const/16 v0, 0xe

    .line 108
    .line 109
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 110
    .line 111
    .line 112
    :cond_6
    const/16 p0, 0xf

    .line 113
    .line 114
    iget v0, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowNotMatchedTimes:I

    .line 115
    .line 116
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 117
    .line 118
    .line 119
    const/16 p0, 0x10

    .line 120
    .line 121
    iget p1, p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowDisappearDays:I

    .line 122
    .line 123
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 127
    check-cast p1, Lcom/p1/mobile/putong/data/LiveBubbleConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/LiveBubbleConfig$1;->serialize(Lcom/p1/mobile/putong/data/LiveBubbleConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
