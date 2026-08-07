.class Lcom/p1/mobile/putong/data/LiveGiftItem$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/LiveGiftItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/LiveGiftItem;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/LiveGiftItem;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->id:I

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftType:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->name:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/4 v1, 0x3

    .line 23
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const/4 v1, 0x4

    .line 33
    sget-object v2, Lcom/p1/mobile/putong/data/LangModel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 34
    .line 35
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->url:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    const/4 v1, 0x5

    .line 45
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_3
    const/4 v0, 0x6

    .line 51
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->unitPrice:D

    .line 52
    .line 53
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    const/4 v0, 0x7

    .line 59
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->purchasePrice:D

    .line 60
    .line 61
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->status:Ljava/lang/String;

    .line 67
    .line 68
    if-eqz v0, :cond_4

    .line 69
    .line 70
    const/16 v1, 0x8

    .line 71
    .line 72
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    add-int/2addr p0, v0

    .line 77
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->tag:Ljava/lang/String;

    .line 78
    .line 79
    if-eqz v0, :cond_5

    .line 80
    .line 81
    const/16 v1, 0x9

    .line 82
    .line 83
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    add-int/2addr p0, v0

    .line 88
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 89
    .line 90
    if-eqz v0, :cond_6

    .line 91
    .line 92
    const/16 v1, 0xa

    .line 93
    .line 94
    sget-object v2, Lcom/p1/mobile/putong/data/LangModel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 95
    .line 96
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    add-int/2addr p0, v0

    .line 101
    :cond_6
    const/16 v0, 0xb

    .line 102
    .line 103
    iget v1, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftLevel:I

    .line 104
    .line 105
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    add-int/2addr p0, v0

    .line 110
    const/16 v0, 0xc

    .line 111
    .line 112
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->combosDuration:J

    .line 113
    .line 114
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    add-int/2addr p0, v0

    .line 119
    const/16 v0, 0xd

    .line 120
    .line 121
    iget v1, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->fastGiftNum:I

    .line 122
    .line 123
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    add-int/2addr p0, v0

    .line 128
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationType:Ljava/lang/String;

    .line 129
    .line 130
    if-eqz v0, :cond_7

    .line 131
    .line 132
    const/16 v1, 0xe

    .line 133
    .line 134
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    add-int/2addr p0, v0

    .line 139
    :cond_7
    const/16 v0, 0xf

    .line 140
    .line 141
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->version:J

    .line 142
    .line 143
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    add-int/2addr p0, v0

    .line 148
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationUrl:Ljava/lang/String;

    .line 149
    .line 150
    if-eqz v0, :cond_8

    .line 151
    .line 152
    const/16 v1, 0x10

    .line 153
    .line 154
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    add-int/2addr p0, v0

    .line 159
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 160
    .line 161
    if-eqz v0, :cond_9

    .line 162
    .line 163
    const/16 v1, 0x11

    .line 164
    .line 165
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    add-int/2addr p0, v0

    .line 170
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 171
    .line 172
    if-eqz v0, :cond_a

    .line 173
    .line 174
    const/16 v1, 0x12

    .line 175
    .line 176
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    add-int/2addr p0, v0

    .line 181
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 182
    .line 183
    if-eqz v0, :cond_b

    .line 184
    .line 185
    const/16 v1, 0x13

    .line 186
    .line 187
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    add-int/2addr p0, v0

    .line 192
    :cond_b
    const/16 v0, 0x14

    .line 193
    .line 194
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->trayDuration:J

    .line 195
    .line 196
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    add-int/2addr p0, v0

    .line 201
    const/16 v0, 0x15

    .line 202
    .line 203
    iget v1, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftSource:I

    .line 204
    .line 205
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    add-int/2addr p0, v0

    .line 210
    const/16 v0, 0x16

    .line 211
    .line 212
    iget v1, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->remain:I

    .line 213
    .line 214
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    add-int/2addr p0, v0

    .line 219
    const/16 v0, 0x17

    .line 220
    .line 221
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->expiredTime:J

    .line 222
    .line 223
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    add-int/2addr p0, v0

    .line 228
    const/16 v0, 0x18

    .line 229
    .line 230
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->mobileVibration:Z

    .line 231
    .line 232
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 233
    .line 234
    .line 235
    move-result v0

    .line 236
    add-int/2addr p0, v0

    .line 237
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 238
    .line 239
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 240
    check-cast p1, Lcom/p1/mobile/putong/data/LiveGiftItem;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/LiveGiftItem$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/LiveGiftItem;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/LiveGiftItem;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/LiveGiftItem;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/LiveGiftItem;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftType:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftType:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->name:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->name:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/data/LangModel;->new_()Lcom/p1/mobile/putong/data/LangModel;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 36
    .line 37
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->url:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_3

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->url:Ljava/lang/String;

    .line 42
    .line 43
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->status:Ljava/lang/String;

    .line 44
    .line 45
    if-nez p1, :cond_4

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->status:Ljava/lang/String;

    .line 48
    .line 49
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationType:Ljava/lang/String;

    .line 50
    .line 51
    if-nez p1, :cond_5

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationType:Ljava/lang/String;

    .line 54
    .line 55
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationUrl:Ljava/lang/String;

    .line 56
    .line 57
    if-nez p1, :cond_6

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationUrl:Ljava/lang/String;

    .line 60
    .line 61
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 62
    .line 63
    if-nez p1, :cond_7

    .line 64
    .line 65
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 66
    .line 67
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 68
    .line 69
    if-nez p1, :cond_8

    .line 70
    .line 71
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 72
    .line 73
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 74
    .line 75
    if-nez p1, :cond_12

    .line 76
    .line 77
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 78
    .line 79
    return-object p0

    .line 80
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->mobileVibration:Z

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 88
    .line 89
    .line 90
    move-result-wide v0

    .line 91
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->expiredTime:J

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    iput v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->remain:I

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    iput v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftSource:I

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 109
    .line 110
    .line 111
    move-result-wide v0

    .line 112
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->trayDuration:J

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationUrl:Ljava/lang/String;

    .line 142
    .line 143
    goto/16 :goto_0

    .line 144
    .line 145
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 146
    .line 147
    .line 148
    move-result-wide v0

    .line 149
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->version:J

    .line 150
    .line 151
    goto/16 :goto_0

    .line 152
    .line 153
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationType:Ljava/lang/String;

    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    iput v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->fastGiftNum:I

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 170
    .line 171
    .line 172
    move-result-wide v0

    .line 173
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->combosDuration:J

    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    iput v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftLevel:I

    .line 182
    .line 183
    goto/16 :goto_0

    .line 184
    .line 185
    :sswitch_e
    sget-object v0, Lcom/p1/mobile/putong/data/LangModel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 186
    .line 187
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    check-cast v0, Lcom/p1/mobile/putong/data/LangModel;

    .line 192
    .line 193
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->tag:Ljava/lang/String;

    .line 202
    .line 203
    goto/16 :goto_0

    .line 204
    .line 205
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->status:Ljava/lang/String;

    .line 210
    .line 211
    goto/16 :goto_0

    .line 212
    .line 213
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 214
    .line 215
    .line 216
    move-result-wide v0

    .line 217
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->purchasePrice:D

    .line 218
    .line 219
    goto/16 :goto_0

    .line 220
    .line 221
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 222
    .line 223
    .line 224
    move-result-wide v0

    .line 225
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->unitPrice:D

    .line 226
    .line 227
    goto/16 :goto_0

    .line 228
    .line 229
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->url:Ljava/lang/String;

    .line 234
    .line 235
    goto/16 :goto_0

    .line 236
    .line 237
    :sswitch_14
    sget-object v0, Lcom/p1/mobile/putong/data/LangModel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 238
    .line 239
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    check-cast v0, Lcom/p1/mobile/putong/data/LangModel;

    .line 244
    .line 245
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 246
    .line 247
    goto/16 :goto_0

    .line 248
    .line 249
    :sswitch_15
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->name:Ljava/lang/String;

    .line 254
    .line 255
    goto/16 :goto_0

    .line 256
    .line 257
    :sswitch_16
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftType:Ljava/lang/String;

    .line 262
    .line 263
    goto/16 :goto_0

    .line 264
    .line 265
    :sswitch_17
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 266
    .line 267
    .line 268
    move-result v0

    .line 269
    iput v0, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->id:I

    .line 270
    .line 271
    goto/16 :goto_0

    .line 272
    .line 273
    :sswitch_18
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftType:Ljava/lang/String;

    .line 274
    .line 275
    if-nez p1, :cond_9

    .line 276
    .line 277
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftType:Ljava/lang/String;

    .line 278
    .line 279
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->name:Ljava/lang/String;

    .line 280
    .line 281
    if-nez p1, :cond_a

    .line 282
    .line 283
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->name:Ljava/lang/String;

    .line 284
    .line 285
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 286
    .line 287
    if-nez p1, :cond_b

    .line 288
    .line 289
    invoke-static {}, Lcom/p1/mobile/putong/data/LangModel;->new_()Lcom/p1/mobile/putong/data/LangModel;

    .line 290
    .line 291
    .line 292
    move-result-object p1

    .line 293
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 294
    .line 295
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->url:Ljava/lang/String;

    .line 296
    .line 297
    if-nez p1, :cond_c

    .line 298
    .line 299
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->url:Ljava/lang/String;

    .line 300
    .line 301
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->status:Ljava/lang/String;

    .line 302
    .line 303
    if-nez p1, :cond_d

    .line 304
    .line 305
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->status:Ljava/lang/String;

    .line 306
    .line 307
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationType:Ljava/lang/String;

    .line 308
    .line 309
    if-nez p1, :cond_e

    .line 310
    .line 311
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationType:Ljava/lang/String;

    .line 312
    .line 313
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationUrl:Ljava/lang/String;

    .line 314
    .line 315
    if-nez p1, :cond_f

    .line 316
    .line 317
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationUrl:Ljava/lang/String;

    .line 318
    .line 319
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 320
    .line 321
    if-nez p1, :cond_10

    .line 322
    .line 323
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 324
    .line 325
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 326
    .line 327
    if-nez p1, :cond_11

    .line 328
    .line 329
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 330
    .line 331
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 332
    .line 333
    if-nez p1, :cond_12

    .line 334
    .line 335
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 336
    .line 337
    :cond_12
    return-object p0

    .line 338
    nop

    .line 339
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_18
        0x8 -> :sswitch_17
        0x12 -> :sswitch_16
        0x1a -> :sswitch_15
        0x22 -> :sswitch_14
        0x2a -> :sswitch_13
        0x31 -> :sswitch_12
        0x39 -> :sswitch_11
        0x42 -> :sswitch_10
        0x4a -> :sswitch_f
        0x52 -> :sswitch_e
        0x58 -> :sswitch_d
        0x60 -> :sswitch_c
        0x68 -> :sswitch_b
        0x72 -> :sswitch_a
        0x78 -> :sswitch_9
        0x82 -> :sswitch_8
        0x8a -> :sswitch_7
        0x92 -> :sswitch_6
        0x9a -> :sswitch_5
        0xa0 -> :sswitch_4
        0xa8 -> :sswitch_3
        0xb0 -> :sswitch_2
        0xb8 -> :sswitch_1
        0xc0 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 339
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/LiveGiftItem$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/LiveGiftItem;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/LiveGiftItem;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->id:I

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftType:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->name:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x4

    .line 28
    sget-object v1, Lcom/p1/mobile/putong/data/LangModel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 29
    .line 30
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->url:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    const/4 v0, 0x5

    .line 38
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    const/4 p0, 0x6

    .line 42
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->unitPrice:D

    .line 43
    .line 44
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x7

    .line 48
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->purchasePrice:D

    .line 49
    .line 50
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->status:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz p0, :cond_4

    .line 56
    .line 57
    const/16 v0, 0x8

    .line 58
    .line 59
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->tag:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz p0, :cond_5

    .line 65
    .line 66
    const/16 v0, 0x9

    .line 67
    .line 68
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 72
    .line 73
    if-eqz p0, :cond_6

    .line 74
    .line 75
    const/16 v0, 0xa

    .line 76
    .line 77
    sget-object v1, Lcom/p1/mobile/putong/data/LangModel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 80
    .line 81
    .line 82
    :cond_6
    const/16 p0, 0xb

    .line 83
    .line 84
    iget v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftLevel:I

    .line 85
    .line 86
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 87
    .line 88
    .line 89
    const/16 p0, 0xc

    .line 90
    .line 91
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->combosDuration:J

    .line 92
    .line 93
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 94
    .line 95
    .line 96
    const/16 p0, 0xd

    .line 97
    .line 98
    iget v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->fastGiftNum:I

    .line 99
    .line 100
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 101
    .line 102
    .line 103
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationType:Ljava/lang/String;

    .line 104
    .line 105
    if-eqz p0, :cond_7

    .line 106
    .line 107
    const/16 v0, 0xe

    .line 108
    .line 109
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 110
    .line 111
    .line 112
    :cond_7
    const/16 p0, 0xf

    .line 113
    .line 114
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->version:J

    .line 115
    .line 116
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 117
    .line 118
    .line 119
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->animationUrl:Ljava/lang/String;

    .line 120
    .line 121
    if-eqz p0, :cond_8

    .line 122
    .line 123
    const/16 v0, 0x10

    .line 124
    .line 125
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 126
    .line 127
    .line 128
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 129
    .line 130
    if-eqz p0, :cond_9

    .line 131
    .line 132
    const/16 v0, 0x11

    .line 133
    .line 134
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 135
    .line 136
    .line 137
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 138
    .line 139
    if-eqz p0, :cond_a

    .line 140
    .line 141
    const/16 v0, 0x12

    .line 142
    .line 143
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 144
    .line 145
    .line 146
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 147
    .line 148
    if-eqz p0, :cond_b

    .line 149
    .line 150
    const/16 v0, 0x13

    .line 151
    .line 152
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 153
    .line 154
    .line 155
    :cond_b
    const/16 p0, 0x14

    .line 156
    .line 157
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->trayDuration:J

    .line 158
    .line 159
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 160
    .line 161
    .line 162
    const/16 p0, 0x15

    .line 163
    .line 164
    iget v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->giftSource:I

    .line 165
    .line 166
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 167
    .line 168
    .line 169
    const/16 p0, 0x16

    .line 170
    .line 171
    iget v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->remain:I

    .line 172
    .line 173
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 174
    .line 175
    .line 176
    const/16 p0, 0x17

    .line 177
    .line 178
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->expiredTime:J

    .line 179
    .line 180
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 181
    .line 182
    .line 183
    const/16 p0, 0x18

    .line 184
    .line 185
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/LiveGiftItem;->mobileVibration:Z

    .line 186
    .line 187
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 188
    .line 189
    .line 190
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 191
    check-cast p1, Lcom/p1/mobile/putong/data/LiveGiftItem;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/LiveGiftItem$1;->serialize(Lcom/p1/mobile/putong/data/LiveGiftItem;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
