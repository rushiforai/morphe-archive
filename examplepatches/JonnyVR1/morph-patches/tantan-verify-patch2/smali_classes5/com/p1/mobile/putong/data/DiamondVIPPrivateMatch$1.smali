.class Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMale:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemale:Ljava/util/List;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const/4 v2, 0x2

    .line 29
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    :cond_1
    const/4 v0, 0x3

    .line 35
    iget v1, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->beauty:I

    .line 36
    .line 37
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    const/4 v0, 0x4

    .line 43
    iget v1, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->enthusiasm:I

    .line 44
    .line 45
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    const/4 v0, 0x5

    .line 51
    iget v1, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->serious:I

    .line 52
    .line 53
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    const/4 v0, 0x6

    .line 59
    iget v1, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->profile:I

    .line 60
    .line 61
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    const/4 v0, 0x7

    .line 67
    iget v1, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->habbit:I

    .line 68
    .line 69
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    iget-object v0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMaleIdealType:Ljava/util/List;

    .line 75
    .line 76
    if-eqz v0, :cond_2

    .line 77
    .line 78
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 79
    .line 80
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    const/16 v2, 0x8

    .line 85
    .line 86
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    add-int/2addr p0, v0

    .line 91
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemaleIdealType:Ljava/util/List;

    .line 92
    .line 93
    if-eqz v0, :cond_3

    .line 94
    .line 95
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 96
    .line 97
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    const/16 v2, 0x9

    .line 102
    .line 103
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    add-int/2addr p0, v0

    .line 108
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMalePriority:Ljava/util/List;

    .line 109
    .line 110
    if-eqz v0, :cond_4

    .line 111
    .line 112
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 113
    .line 114
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    const/16 v2, 0xa

    .line 119
    .line 120
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    add-int/2addr p0, v0

    .line 125
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemalePriority:Ljava/util/List;

    .line 126
    .line 127
    if-eqz v0, :cond_5

    .line 128
    .line 129
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 130
    .line 131
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    const/16 v2, 0xb

    .line 136
    .line 137
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    add-int/2addr p0, v0

    .line 142
    :cond_5
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 143
    .line 144
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 145
    check-cast p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMale:Ljava/util/List;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMale:Ljava/util/List;

    .line 23
    .line 24
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemale:Ljava/util/List;

    .line 25
    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    new-instance p1, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemale:Ljava/util/List;

    .line 34
    .line 35
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMaleIdealType:Ljava/util/List;

    .line 36
    .line 37
    if-nez p1, :cond_2

    .line 38
    .line 39
    new-instance p1, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMaleIdealType:Ljava/util/List;

    .line 45
    .line 46
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemaleIdealType:Ljava/util/List;

    .line 47
    .line 48
    if-nez p1, :cond_3

    .line 49
    .line 50
    new-instance p1, Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemaleIdealType:Ljava/util/List;

    .line 56
    .line 57
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMalePriority:Ljava/util/List;

    .line 58
    .line 59
    if-nez p1, :cond_4

    .line 60
    .line 61
    new-instance p1, Ljava/util/ArrayList;

    .line 62
    .line 63
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMalePriority:Ljava/util/List;

    .line 67
    .line 68
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemalePriority:Ljava/util/List;

    .line 69
    .line 70
    if-nez p1, :cond_a

    .line 71
    .line 72
    new-instance p1, Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 75
    .line 76
    .line 77
    iput-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemalePriority:Ljava/util/List;

    .line 78
    .line 79
    return-object p0

    .line 80
    :sswitch_0
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Ljava/util/List;

    .line 91
    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemalePriority:Ljava/util/List;

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :sswitch_1
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 96
    .line 97
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Ljava/util/List;

    .line 106
    .line 107
    iput-object v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMalePriority:Ljava/util/List;

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :sswitch_2
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 111
    .line 112
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    check-cast v0, Ljava/util/List;

    .line 121
    .line 122
    iput-object v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemaleIdealType:Ljava/util/List;

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :sswitch_3
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 126
    .line 127
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    check-cast v0, Ljava/util/List;

    .line 136
    .line 137
    iput-object v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMaleIdealType:Ljava/util/List;

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    iput v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->habbit:I

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    iput v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->profile:I

    .line 154
    .line 155
    goto/16 :goto_0

    .line 156
    .line 157
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    iput v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->serious:I

    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    iput v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->enthusiasm:I

    .line 170
    .line 171
    goto/16 :goto_0

    .line 172
    .line 173
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    iput v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->beauty:I

    .line 178
    .line 179
    goto/16 :goto_0

    .line 180
    .line 181
    :sswitch_9
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 182
    .line 183
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    check-cast v0, Ljava/util/List;

    .line 192
    .line 193
    iput-object v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemale:Ljava/util/List;

    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :sswitch_a
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 198
    .line 199
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    check-cast v0, Ljava/util/List;

    .line 208
    .line 209
    iput-object v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMale:Ljava/util/List;

    .line 210
    .line 211
    goto/16 :goto_0

    .line 212
    .line 213
    :sswitch_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMale:Ljava/util/List;

    .line 214
    .line 215
    if-nez p1, :cond_5

    .line 216
    .line 217
    new-instance p1, Ljava/util/ArrayList;

    .line 218
    .line 219
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 220
    .line 221
    .line 222
    iput-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMale:Ljava/util/List;

    .line 223
    .line 224
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemale:Ljava/util/List;

    .line 225
    .line 226
    if-nez p1, :cond_6

    .line 227
    .line 228
    new-instance p1, Ljava/util/ArrayList;

    .line 229
    .line 230
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 231
    .line 232
    .line 233
    iput-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemale:Ljava/util/List;

    .line 234
    .line 235
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMaleIdealType:Ljava/util/List;

    .line 236
    .line 237
    if-nez p1, :cond_7

    .line 238
    .line 239
    new-instance p1, Ljava/util/ArrayList;

    .line 240
    .line 241
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 242
    .line 243
    .line 244
    iput-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMaleIdealType:Ljava/util/List;

    .line 245
    .line 246
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemaleIdealType:Ljava/util/List;

    .line 247
    .line 248
    if-nez p1, :cond_8

    .line 249
    .line 250
    new-instance p1, Ljava/util/ArrayList;

    .line 251
    .line 252
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 253
    .line 254
    .line 255
    iput-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemaleIdealType:Ljava/util/List;

    .line 256
    .line 257
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMalePriority:Ljava/util/List;

    .line 258
    .line 259
    if-nez p1, :cond_9

    .line 260
    .line 261
    new-instance p1, Ljava/util/ArrayList;

    .line 262
    .line 263
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 264
    .line 265
    .line 266
    iput-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMalePriority:Ljava/util/List;

    .line 267
    .line 268
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemalePriority:Ljava/util/List;

    .line 269
    .line 270
    if-nez p1, :cond_a

    .line 271
    .line 272
    new-instance p1, Ljava/util/ArrayList;

    .line 273
    .line 274
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 275
    .line 276
    .line 277
    iput-object p1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemalePriority:Ljava/util/List;

    .line 278
    .line 279
    :cond_a
    return-object p0

    .line 280
    nop

    .line 281
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_b
        0xa -> :sswitch_a
        0x12 -> :sswitch_9
        0x18 -> :sswitch_8
        0x20 -> :sswitch_7
        0x28 -> :sswitch_6
        0x30 -> :sswitch_5
        0x38 -> :sswitch_4
        0x42 -> :sswitch_3
        0x4a -> :sswitch_2
        0x52 -> :sswitch_1
        0x5a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 281
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMale:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemale:Ljava/util/List;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x2

    .line 26
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    const/4 p0, 0x3

    .line 30
    iget v0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->beauty:I

    .line 31
    .line 32
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x4

    .line 36
    iget v0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->enthusiasm:I

    .line 37
    .line 38
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x5

    .line 42
    iget v0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->serious:I

    .line 43
    .line 44
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x6

    .line 48
    iget v0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->profile:I

    .line 49
    .line 50
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 51
    .line 52
    .line 53
    const/4 p0, 0x7

    .line 54
    iget v0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->habbit:I

    .line 55
    .line 56
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMaleIdealType:Ljava/util/List;

    .line 60
    .line 61
    if-eqz p0, :cond_2

    .line 62
    .line 63
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    const/16 v1, 0x8

    .line 70
    .line 71
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 72
    .line 73
    .line 74
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemaleIdealType:Ljava/util/List;

    .line 75
    .line 76
    if-eqz p0, :cond_3

    .line 77
    .line 78
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    const/16 v1, 0x9

    .line 85
    .line 86
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 87
    .line 88
    .line 89
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForMalePriority:Ljava/util/List;

    .line 90
    .line 91
    if-eqz p0, :cond_4

    .line 92
    .line 93
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 94
    .line 95
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    const/16 v1, 0xa

    .line 100
    .line 101
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 102
    .line 103
    .line 104
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->styleForFemalePriority:Ljava/util/List;

    .line 105
    .line 106
    if-eqz p0, :cond_5

    .line 107
    .line 108
    sget-object p1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 109
    .line 110
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    const/16 v0, 0xb

    .line 115
    .line 116
    invoke-virtual {p2, v0, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 117
    .line 118
    .line 119
    :cond_5
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 120
    check-cast p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch$1;->serialize(Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
