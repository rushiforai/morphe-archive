.class Lcom/p1/mobile/putong/core/data/MyTabTask$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MyTabTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/MyTabTask;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MyTabTask;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->title:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->subTitle:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->mode:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->avatarGroups:Ljava/util/List;

    .line 43
    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    sget-object v1, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const/4 v2, 0x5

    .line 53
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->button:Lcom/p1/mobile/putong/core/data/TaskButtonDesc;

    .line 59
    .line 60
    if-eqz v0, :cond_5

    .line 61
    .line 62
    const/4 v1, 0x6

    .line 63
    sget-object v2, Lcom/p1/mobile/putong/core/data/TaskButtonDesc;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 64
    .line 65
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    :cond_5
    const/4 v0, 0x7

    .line 71
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->exposed:Z

    .line 72
    .line 73
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    add-int/2addr p0, v0

    .line 78
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->extraInfos:Lcom/p1/mobile/putong/core/data/ExtraInfos;

    .line 79
    .line 80
    if-eqz v0, :cond_6

    .line 81
    .line 82
    const/16 v1, 0x8

    .line 83
    .line 84
    sget-object v2, Lcom/p1/mobile/putong/core/data/ExtraInfos;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 85
    .line 86
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    add-int/2addr p0, v0

    .line 91
    :cond_6
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 92
    .line 93
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 94
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyTabTask;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MyTabTask$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MyTabTask;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MyTabTask;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MyTabTask;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MyTabTask;-><init>()V

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
    if-eqz v0, :cond_e

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_d

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_c

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_b

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_a

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_9

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_8

    .line 37
    .line 38
    const/16 v2, 0x38

    .line 39
    .line 40
    if-eq v0, v2, :cond_7

    .line 41
    .line 42
    const/16 v2, 0x42

    .line 43
    .line 44
    if-eq v0, v2, :cond_6

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->title:Ljava/lang/String;

    .line 47
    .line 48
    if-nez p1, :cond_0

    .line 49
    .line 50
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->title:Ljava/lang/String;

    .line 51
    .line 52
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->subTitle:Ljava/lang/String;

    .line 53
    .line 54
    if-nez p1, :cond_1

    .line 55
    .line 56
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->subTitle:Ljava/lang/String;

    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 63
    .line 64
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->mode:Ljava/lang/String;

    .line 65
    .line 66
    if-nez p1, :cond_3

    .line 67
    .line 68
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->mode:Ljava/lang/String;

    .line 69
    .line 70
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->avatarGroups:Ljava/util/List;

    .line 71
    .line 72
    if-nez p1, :cond_4

    .line 73
    .line 74
    new-instance p1, Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->avatarGroups:Ljava/util/List;

    .line 80
    .line 81
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->button:Lcom/p1/mobile/putong/core/data/TaskButtonDesc;

    .line 82
    .line 83
    if-nez p1, :cond_5

    .line 84
    .line 85
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TaskButtonDesc;->new_()Lcom/p1/mobile/putong/core/data/TaskButtonDesc;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->button:Lcom/p1/mobile/putong/core/data/TaskButtonDesc;

    .line 90
    .line 91
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->extraInfos:Lcom/p1/mobile/putong/core/data/ExtraInfos;

    .line 92
    .line 93
    if-nez p1, :cond_15

    .line 94
    .line 95
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ExtraInfos;->new_()Lcom/p1/mobile/putong/core/data/ExtraInfos;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->extraInfos:Lcom/p1/mobile/putong/core/data/ExtraInfos;

    .line 100
    .line 101
    return-object p0

    .line 102
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/ExtraInfos;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 103
    .line 104
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    check-cast v0, Lcom/p1/mobile/putong/core/data/ExtraInfos;

    .line 109
    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->extraInfos:Lcom/p1/mobile/putong/core/data/ExtraInfos;

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->exposed:Z

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/core/data/TaskButtonDesc;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 121
    .line 122
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    check-cast v0, Lcom/p1/mobile/putong/core/data/TaskButtonDesc;

    .line 127
    .line 128
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->button:Lcom/p1/mobile/putong/core/data/TaskButtonDesc;

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 132
    .line 133
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    check-cast v0, Ljava/util/List;

    .line 142
    .line 143
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->avatarGroups:Ljava/util/List;

    .line 144
    .line 145
    goto/16 :goto_0

    .line 146
    .line 147
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->mode:Ljava/lang/String;

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 160
    .line 161
    goto/16 :goto_0

    .line 162
    .line 163
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->subTitle:Ljava/lang/String;

    .line 168
    .line 169
    goto/16 :goto_0

    .line 170
    .line 171
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->title:Ljava/lang/String;

    .line 176
    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->title:Ljava/lang/String;

    .line 180
    .line 181
    if-nez p1, :cond_f

    .line 182
    .line 183
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->title:Ljava/lang/String;

    .line 184
    .line 185
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->subTitle:Ljava/lang/String;

    .line 186
    .line 187
    if-nez p1, :cond_10

    .line 188
    .line 189
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->subTitle:Ljava/lang/String;

    .line 190
    .line 191
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 192
    .line 193
    if-nez p1, :cond_11

    .line 194
    .line 195
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 196
    .line 197
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->mode:Ljava/lang/String;

    .line 198
    .line 199
    if-nez p1, :cond_12

    .line 200
    .line 201
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->mode:Ljava/lang/String;

    .line 202
    .line 203
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->avatarGroups:Ljava/util/List;

    .line 204
    .line 205
    if-nez p1, :cond_13

    .line 206
    .line 207
    new-instance p1, Ljava/util/ArrayList;

    .line 208
    .line 209
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 210
    .line 211
    .line 212
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->avatarGroups:Ljava/util/List;

    .line 213
    .line 214
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->button:Lcom/p1/mobile/putong/core/data/TaskButtonDesc;

    .line 215
    .line 216
    if-nez p1, :cond_14

    .line 217
    .line 218
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TaskButtonDesc;->new_()Lcom/p1/mobile/putong/core/data/TaskButtonDesc;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->button:Lcom/p1/mobile/putong/core/data/TaskButtonDesc;

    .line 223
    .line 224
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->extraInfos:Lcom/p1/mobile/putong/core/data/ExtraInfos;

    .line 225
    .line 226
    if-nez p1, :cond_15

    .line 227
    .line 228
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ExtraInfos;->new_()Lcom/p1/mobile/putong/core/data/ExtraInfos;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->extraInfos:Lcom/p1/mobile/putong/core/data/ExtraInfos;

    .line 233
    .line 234
    :cond_15
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 235
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MyTabTask$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MyTabTask;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/MyTabTask;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->title:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->subTitle:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->mode:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->avatarGroups:Ljava/util/List;

    .line 34
    .line 35
    if-eqz p0, :cond_4

    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const/4 v1, 0x5

    .line 44
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 45
    .line 46
    .line 47
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->button:Lcom/p1/mobile/putong/core/data/TaskButtonDesc;

    .line 48
    .line 49
    if-eqz p0, :cond_5

    .line 50
    .line 51
    const/4 v0, 0x6

    .line 52
    sget-object v1, Lcom/p1/mobile/putong/core/data/TaskButtonDesc;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 53
    .line 54
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 55
    .line 56
    .line 57
    :cond_5
    const/4 p0, 0x7

    .line 58
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->exposed:Z

    .line 59
    .line 60
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->extraInfos:Lcom/p1/mobile/putong/core/data/ExtraInfos;

    .line 64
    .line 65
    if-eqz p0, :cond_6

    .line 66
    .line 67
    const/16 p1, 0x8

    .line 68
    .line 69
    sget-object v0, Lcom/p1/mobile/putong/core/data/ExtraInfos;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 70
    .line 71
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 72
    .line 73
    .line 74
    :cond_6
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 75
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyTabTask;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MyTabTask$1;->serialize(Lcom/p1/mobile/putong/core/data/MyTabTask;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
