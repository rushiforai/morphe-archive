.class Lcom/p1/mobile/putong/core/data/WarmingUpResConfig$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_text:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/WarmingUpEmoItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_poke_sticker:Ljava/util/List;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/data/WarmingUpEmoItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_intimate_sticker:Ljava/util/List;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    sget-object v1, Lcom/p1/mobile/putong/core/data/WarmingUpEmoItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const/4 v2, 0x3

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->h5_url:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    const/4 v1, 0x4

    .line 55
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_0:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz v0, :cond_4

    .line 63
    .line 64
    const/4 v1, 0x5

    .line 65
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_1:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz v0, :cond_5

    .line 73
    .line 74
    const/4 v1, 0x6

    .line 75
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    add-int/2addr p0, v0

    .line 80
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_2:Ljava/lang/String;

    .line 81
    .line 82
    if-eqz v0, :cond_6

    .line 83
    .line 84
    const/4 v1, 0x7

    .line 85
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    add-int/2addr p0, v0

    .line 90
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_3:Ljava/lang/String;

    .line 91
    .line 92
    if-eqz v0, :cond_7

    .line 93
    .line 94
    const/16 v1, 0x8

    .line 95
    .line 96
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    add-int/2addr p0, v0

    .line 101
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_4:Ljava/lang/String;

    .line 102
    .line 103
    if-eqz v0, :cond_8

    .line 104
    .line 105
    const/16 v1, 0x9

    .line 106
    .line 107
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    add-int/2addr p0, v0

    .line 112
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_1:Ljava/lang/String;

    .line 113
    .line 114
    if-eqz v0, :cond_9

    .line 115
    .line 116
    const/16 v1, 0xa

    .line 117
    .line 118
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    add-int/2addr p0, v0

    .line 123
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_2:Ljava/lang/String;

    .line 124
    .line 125
    if-eqz v0, :cond_a

    .line 126
    .line 127
    const/16 v1, 0xb

    .line 128
    .line 129
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    add-int/2addr p0, v0

    .line 134
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_3:Ljava/lang/String;

    .line 135
    .line 136
    if-eqz v0, :cond_b

    .line 137
    .line 138
    const/16 v1, 0xc

    .line 139
    .line 140
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    add-int/2addr p0, v0

    .line 145
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_4:Ljava/lang/String;

    .line 146
    .line 147
    if-eqz v0, :cond_c

    .line 148
    .line 149
    const/16 v1, 0xd

    .line 150
    .line 151
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    add-int/2addr p0, v0

    .line 156
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_1:Ljava/lang/String;

    .line 157
    .line 158
    if-eqz v0, :cond_d

    .line 159
    .line 160
    const/16 v1, 0xe

    .line 161
    .line 162
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    add-int/2addr p0, v0

    .line 167
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_2:Ljava/lang/String;

    .line 168
    .line 169
    if-eqz v0, :cond_e

    .line 170
    .line 171
    const/16 v1, 0xf

    .line 172
    .line 173
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    add-int/2addr p0, v0

    .line 178
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_3:Ljava/lang/String;

    .line 179
    .line 180
    if-eqz v0, :cond_f

    .line 181
    .line 182
    const/16 v1, 0x10

    .line 183
    .line 184
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    add-int/2addr p0, v0

    .line 189
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_4:Ljava/lang/String;

    .line 190
    .line 191
    if-eqz v0, :cond_10

    .line 192
    .line 193
    const/16 v1, 0x11

    .line 194
    .line 195
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    add-int/2addr p0, v0

    .line 200
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_1:Ljava/lang/String;

    .line 201
    .line 202
    if-eqz v0, :cond_11

    .line 203
    .line 204
    const/16 v1, 0x12

    .line 205
    .line 206
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    add-int/2addr p0, v0

    .line 211
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_2:Ljava/lang/String;

    .line 212
    .line 213
    if-eqz v0, :cond_12

    .line 214
    .line 215
    const/16 v1, 0x13

    .line 216
    .line 217
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    add-int/2addr p0, v0

    .line 222
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_3:Ljava/lang/String;

    .line 223
    .line 224
    if-eqz v0, :cond_13

    .line 225
    .line 226
    const/16 v1, 0x14

    .line 227
    .line 228
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    add-int/2addr p0, v0

    .line 233
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_temp_down_rq:Ljava/lang/String;

    .line 234
    .line 235
    if-eqz v0, :cond_14

    .line 236
    .line 237
    const/16 v1, 0x15

    .line 238
    .line 239
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 240
    .line 241
    .line 242
    move-result v0

    .line 243
    add-int/2addr p0, v0

    .line 244
    :cond_14
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 245
    .line 246
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 247
    check-cast p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_text:Ljava/util/List;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    new-instance p1, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_text:Ljava/util/List;

    .line 25
    .line 26
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_poke_sticker:Ljava/util/List;

    .line 27
    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    new-instance p1, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_poke_sticker:Ljava/util/List;

    .line 36
    .line 37
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_intimate_sticker:Ljava/util/List;

    .line 38
    .line 39
    if-nez p1, :cond_2

    .line 40
    .line 41
    new-instance p1, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_intimate_sticker:Ljava/util/List;

    .line 47
    .line 48
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->h5_url:Ljava/lang/String;

    .line 49
    .line 50
    if-nez p1, :cond_3

    .line 51
    .line 52
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->h5_url:Ljava/lang/String;

    .line 53
    .line 54
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_0:Ljava/lang/String;

    .line 55
    .line 56
    if-nez p1, :cond_4

    .line 57
    .line 58
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_0:Ljava/lang/String;

    .line 59
    .line 60
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_1:Ljava/lang/String;

    .line 61
    .line 62
    if-nez p1, :cond_5

    .line 63
    .line 64
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_1:Ljava/lang/String;

    .line 65
    .line 66
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_2:Ljava/lang/String;

    .line 67
    .line 68
    if-nez p1, :cond_6

    .line 69
    .line 70
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_2:Ljava/lang/String;

    .line 71
    .line 72
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_3:Ljava/lang/String;

    .line 73
    .line 74
    if-nez p1, :cond_7

    .line 75
    .line 76
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_3:Ljava/lang/String;

    .line 77
    .line 78
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_4:Ljava/lang/String;

    .line 79
    .line 80
    if-nez p1, :cond_8

    .line 81
    .line 82
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_4:Ljava/lang/String;

    .line 83
    .line 84
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_1:Ljava/lang/String;

    .line 85
    .line 86
    if-nez p1, :cond_9

    .line 87
    .line 88
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_1:Ljava/lang/String;

    .line 89
    .line 90
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_2:Ljava/lang/String;

    .line 91
    .line 92
    if-nez p1, :cond_a

    .line 93
    .line 94
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_2:Ljava/lang/String;

    .line 95
    .line 96
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_3:Ljava/lang/String;

    .line 97
    .line 98
    if-nez p1, :cond_b

    .line 99
    .line 100
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_3:Ljava/lang/String;

    .line 101
    .line 102
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_4:Ljava/lang/String;

    .line 103
    .line 104
    if-nez p1, :cond_c

    .line 105
    .line 106
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_4:Ljava/lang/String;

    .line 107
    .line 108
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_1:Ljava/lang/String;

    .line 109
    .line 110
    if-nez p1, :cond_d

    .line 111
    .line 112
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_1:Ljava/lang/String;

    .line 113
    .line 114
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_2:Ljava/lang/String;

    .line 115
    .line 116
    if-nez p1, :cond_e

    .line 117
    .line 118
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_2:Ljava/lang/String;

    .line 119
    .line 120
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_3:Ljava/lang/String;

    .line 121
    .line 122
    if-nez p1, :cond_f

    .line 123
    .line 124
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_3:Ljava/lang/String;

    .line 125
    .line 126
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_4:Ljava/lang/String;

    .line 127
    .line 128
    if-nez p1, :cond_10

    .line 129
    .line 130
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_4:Ljava/lang/String;

    .line 131
    .line 132
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_1:Ljava/lang/String;

    .line 133
    .line 134
    if-nez p1, :cond_11

    .line 135
    .line 136
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_1:Ljava/lang/String;

    .line 137
    .line 138
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_2:Ljava/lang/String;

    .line 139
    .line 140
    if-nez p1, :cond_12

    .line 141
    .line 142
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_2:Ljava/lang/String;

    .line 143
    .line 144
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_3:Ljava/lang/String;

    .line 145
    .line 146
    if-nez p1, :cond_13

    .line 147
    .line 148
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_3:Ljava/lang/String;

    .line 149
    .line 150
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_temp_down_rq:Ljava/lang/String;

    .line 151
    .line 152
    if-nez p1, :cond_28

    .line 153
    .line 154
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_temp_down_rq:Ljava/lang/String;

    .line 155
    .line 156
    return-object p0

    .line 157
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_temp_down_rq:Ljava/lang/String;

    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_3:Ljava/lang/String;

    .line 170
    .line 171
    goto/16 :goto_0

    .line 172
    .line 173
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_2:Ljava/lang/String;

    .line 178
    .line 179
    goto/16 :goto_0

    .line 180
    .line 181
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_1:Ljava/lang/String;

    .line 186
    .line 187
    goto/16 :goto_0

    .line 188
    .line 189
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_4:Ljava/lang/String;

    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_3:Ljava/lang/String;

    .line 202
    .line 203
    goto/16 :goto_0

    .line 204
    .line 205
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_2:Ljava/lang/String;

    .line 210
    .line 211
    goto/16 :goto_0

    .line 212
    .line 213
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_1:Ljava/lang/String;

    .line 218
    .line 219
    goto/16 :goto_0

    .line 220
    .line 221
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_4:Ljava/lang/String;

    .line 226
    .line 227
    goto/16 :goto_0

    .line 228
    .line 229
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_3:Ljava/lang/String;

    .line 234
    .line 235
    goto/16 :goto_0

    .line 236
    .line 237
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_2:Ljava/lang/String;

    .line 242
    .line 243
    goto/16 :goto_0

    .line 244
    .line 245
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_1:Ljava/lang/String;

    .line 250
    .line 251
    goto/16 :goto_0

    .line 252
    .line 253
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_4:Ljava/lang/String;

    .line 258
    .line 259
    goto/16 :goto_0

    .line 260
    .line 261
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_3:Ljava/lang/String;

    .line 266
    .line 267
    goto/16 :goto_0

    .line 268
    .line 269
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_2:Ljava/lang/String;

    .line 274
    .line 275
    goto/16 :goto_0

    .line 276
    .line 277
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_1:Ljava/lang/String;

    .line 282
    .line 283
    goto/16 :goto_0

    .line 284
    .line 285
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_0:Ljava/lang/String;

    .line 290
    .line 291
    goto/16 :goto_0

    .line 292
    .line 293
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->h5_url:Ljava/lang/String;

    .line 298
    .line 299
    goto/16 :goto_0

    .line 300
    .line 301
    :sswitch_12
    sget-object v0, Lcom/p1/mobile/putong/core/data/WarmingUpEmoItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 302
    .line 303
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    move-result-object v0

    .line 311
    check-cast v0, Ljava/util/List;

    .line 312
    .line 313
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_intimate_sticker:Ljava/util/List;

    .line 314
    .line 315
    goto/16 :goto_0

    .line 316
    .line 317
    :sswitch_13
    sget-object v0, Lcom/p1/mobile/putong/core/data/WarmingUpEmoItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 318
    .line 319
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 324
    .line 325
    .line 326
    move-result-object v0

    .line 327
    check-cast v0, Ljava/util/List;

    .line 328
    .line 329
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_poke_sticker:Ljava/util/List;

    .line 330
    .line 331
    goto/16 :goto_0

    .line 332
    .line 333
    :sswitch_14
    sget-object v0, Lcom/p1/mobile/putong/core/data/WarmingUpEmoItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 334
    .line 335
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    check-cast v0, Ljava/util/List;

    .line 344
    .line 345
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_text:Ljava/util/List;

    .line 346
    .line 347
    goto/16 :goto_0

    .line 348
    .line 349
    :sswitch_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_text:Ljava/util/List;

    .line 350
    .line 351
    if-nez p1, :cond_14

    .line 352
    .line 353
    new-instance p1, Ljava/util/ArrayList;

    .line 354
    .line 355
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 356
    .line 357
    .line 358
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_text:Ljava/util/List;

    .line 359
    .line 360
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_poke_sticker:Ljava/util/List;

    .line 361
    .line 362
    if-nez p1, :cond_15

    .line 363
    .line 364
    new-instance p1, Ljava/util/ArrayList;

    .line 365
    .line 366
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 367
    .line 368
    .line 369
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_poke_sticker:Ljava/util/List;

    .line 370
    .line 371
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_intimate_sticker:Ljava/util/List;

    .line 372
    .line 373
    if-nez p1, :cond_16

    .line 374
    .line 375
    new-instance p1, Ljava/util/ArrayList;

    .line 376
    .line 377
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 378
    .line 379
    .line 380
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_intimate_sticker:Ljava/util/List;

    .line 381
    .line 382
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->h5_url:Ljava/lang/String;

    .line 383
    .line 384
    if-nez p1, :cond_17

    .line 385
    .line 386
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->h5_url:Ljava/lang/String;

    .line 387
    .line 388
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_0:Ljava/lang/String;

    .line 389
    .line 390
    if-nez p1, :cond_18

    .line 391
    .line 392
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_0:Ljava/lang/String;

    .line 393
    .line 394
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_1:Ljava/lang/String;

    .line 395
    .line 396
    if-nez p1, :cond_19

    .line 397
    .line 398
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_1:Ljava/lang/String;

    .line 399
    .line 400
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_2:Ljava/lang/String;

    .line 401
    .line 402
    if-nez p1, :cond_1a

    .line 403
    .line 404
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_2:Ljava/lang/String;

    .line 405
    .line 406
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_3:Ljava/lang/String;

    .line 407
    .line 408
    if-nez p1, :cond_1b

    .line 409
    .line 410
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_3:Ljava/lang/String;

    .line 411
    .line 412
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_4:Ljava/lang/String;

    .line 413
    .line 414
    if-nez p1, :cond_1c

    .line 415
    .line 416
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_4:Ljava/lang/String;

    .line 417
    .line 418
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_1:Ljava/lang/String;

    .line 419
    .line 420
    if-nez p1, :cond_1d

    .line 421
    .line 422
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_1:Ljava/lang/String;

    .line 423
    .line 424
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_2:Ljava/lang/String;

    .line 425
    .line 426
    if-nez p1, :cond_1e

    .line 427
    .line 428
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_2:Ljava/lang/String;

    .line 429
    .line 430
    :cond_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_3:Ljava/lang/String;

    .line 431
    .line 432
    if-nez p1, :cond_1f

    .line 433
    .line 434
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_3:Ljava/lang/String;

    .line 435
    .line 436
    :cond_1f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_4:Ljava/lang/String;

    .line 437
    .line 438
    if-nez p1, :cond_20

    .line 439
    .line 440
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_4:Ljava/lang/String;

    .line 441
    .line 442
    :cond_20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_1:Ljava/lang/String;

    .line 443
    .line 444
    if-nez p1, :cond_21

    .line 445
    .line 446
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_1:Ljava/lang/String;

    .line 447
    .line 448
    :cond_21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_2:Ljava/lang/String;

    .line 449
    .line 450
    if-nez p1, :cond_22

    .line 451
    .line 452
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_2:Ljava/lang/String;

    .line 453
    .line 454
    :cond_22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_3:Ljava/lang/String;

    .line 455
    .line 456
    if-nez p1, :cond_23

    .line 457
    .line 458
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_3:Ljava/lang/String;

    .line 459
    .line 460
    :cond_23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_4:Ljava/lang/String;

    .line 461
    .line 462
    if-nez p1, :cond_24

    .line 463
    .line 464
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_4:Ljava/lang/String;

    .line 465
    .line 466
    :cond_24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_1:Ljava/lang/String;

    .line 467
    .line 468
    if-nez p1, :cond_25

    .line 469
    .line 470
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_1:Ljava/lang/String;

    .line 471
    .line 472
    :cond_25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_2:Ljava/lang/String;

    .line 473
    .line 474
    if-nez p1, :cond_26

    .line 475
    .line 476
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_2:Ljava/lang/String;

    .line 477
    .line 478
    :cond_26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_3:Ljava/lang/String;

    .line 479
    .line 480
    if-nez p1, :cond_27

    .line 481
    .line 482
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_3:Ljava/lang/String;

    .line 483
    .line 484
    :cond_27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_temp_down_rq:Ljava/lang/String;

    .line 485
    .line 486
    if-nez p1, :cond_28

    .line 487
    .line 488
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_temp_down_rq:Ljava/lang/String;

    .line 489
    .line 490
    :cond_28
    return-object p0

    .line 491
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_15
        0xa -> :sswitch_14
        0x12 -> :sswitch_13
        0x1a -> :sswitch_12
        0x22 -> :sswitch_11
        0x2a -> :sswitch_10
        0x32 -> :sswitch_f
        0x3a -> :sswitch_e
        0x42 -> :sswitch_d
        0x4a -> :sswitch_c
        0x52 -> :sswitch_b
        0x5a -> :sswitch_a
        0x62 -> :sswitch_9
        0x6a -> :sswitch_8
        0x72 -> :sswitch_7
        0x7a -> :sswitch_6
        0x82 -> :sswitch_5
        0x8a -> :sswitch_4
        0x92 -> :sswitch_3
        0x9a -> :sswitch_2
        0xa2 -> :sswitch_1
        0xaa -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 491
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_text:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/WarmingUpEmoItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_poke_sticker:Ljava/util/List;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/data/WarmingUpEmoItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->restore_heat_guide_intimate_sticker:Ljava/util/List;

    .line 30
    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/data/WarmingUpEmoItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const/4 v1, 0x3

    .line 40
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->h5_url:Ljava/lang/String;

    .line 44
    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    const/4 v0, 0x4

    .line 48
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_0:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz p0, :cond_4

    .line 54
    .line 55
    const/4 v0, 0x5

    .line 56
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_1:Ljava/lang/String;

    .line 60
    .line 61
    if-eqz p0, :cond_5

    .line 62
    .line 63
    const/4 v0, 0x6

    .line 64
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_2:Ljava/lang/String;

    .line 68
    .line 69
    if-eqz p0, :cond_6

    .line 70
    .line 71
    const/4 v0, 0x7

    .line 72
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_3:Ljava/lang/String;

    .line 76
    .line 77
    if-eqz p0, :cond_7

    .line 78
    .line 79
    const/16 v0, 0x8

    .line 80
    .line 81
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_warming_up_rq_4:Ljava/lang/String;

    .line 85
    .line 86
    if-eqz p0, :cond_8

    .line 87
    .line 88
    const/16 v0, 0x9

    .line 89
    .line 90
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_1:Ljava/lang/String;

    .line 94
    .line 95
    if-eqz p0, :cond_9

    .line 96
    .line 97
    const/16 v0, 0xa

    .line 98
    .line 99
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 100
    .line 101
    .line 102
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_2:Ljava/lang/String;

    .line 103
    .line 104
    if-eqz p0, :cond_a

    .line 105
    .line 106
    const/16 v0, 0xb

    .line 107
    .line 108
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 109
    .line 110
    .line 111
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_3:Ljava/lang/String;

    .line 112
    .line 113
    if-eqz p0, :cond_b

    .line 114
    .line 115
    const/16 v0, 0xc

    .line 116
    .line 117
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 118
    .line 119
    .line 120
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_love_heart_4:Ljava/lang/String;

    .line 121
    .line 122
    if-eqz p0, :cond_c

    .line 123
    .line 124
    const/16 v0, 0xd

    .line 125
    .line 126
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 127
    .line 128
    .line 129
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_1:Ljava/lang/String;

    .line 130
    .line 131
    if-eqz p0, :cond_d

    .line 132
    .line 133
    const/16 v0, 0xe

    .line 134
    .line 135
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 136
    .line 137
    .line 138
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_2:Ljava/lang/String;

    .line 139
    .line 140
    if-eqz p0, :cond_e

    .line 141
    .line 142
    const/16 v0, 0xf

    .line 143
    .line 144
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 145
    .line 146
    .line 147
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_3:Ljava/lang/String;

    .line 148
    .line 149
    if-eqz p0, :cond_f

    .line 150
    .line 151
    const/16 v0, 0x10

    .line 152
    .line 153
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 154
    .line 155
    .line 156
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_up_left_bottom_4:Ljava/lang/String;

    .line 157
    .line 158
    if-eqz p0, :cond_10

    .line 159
    .line 160
    const/16 v0, 0x11

    .line 161
    .line 162
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 163
    .line 164
    .line 165
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_1:Ljava/lang/String;

    .line 166
    .line 167
    if-eqz p0, :cond_11

    .line 168
    .line 169
    const/16 v0, 0x12

    .line 170
    .line 171
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 172
    .line 173
    .line 174
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_2:Ljava/lang/String;

    .line 175
    .line 176
    if-eqz p0, :cond_12

    .line 177
    .line 178
    const/16 v0, 0x13

    .line 179
    .line 180
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 181
    .line 182
    .line 183
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_down_left_bottom_3:Ljava/lang/String;

    .line 184
    .line 185
    if-eqz p0, :cond_13

    .line 186
    .line 187
    const/16 v0, 0x14

    .line 188
    .line 189
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 190
    .line 191
    .line 192
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;->core_temp_down_rq:Ljava/lang/String;

    .line 193
    .line 194
    if-eqz p0, :cond_14

    .line 195
    .line 196
    const/16 p1, 0x15

    .line 197
    .line 198
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 199
    .line 200
    .line 201
    :cond_14
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 202
    check-cast p1, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/WarmingUpResConfig$1;->serialize(Lcom/p1/mobile/putong/core/data/WarmingUpResConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
