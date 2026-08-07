.class Lcom/p1/mobile/putong/data/OMSLauncherInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/OMSLauncherInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/OMSLauncherInfo;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSLauncherInfo;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

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
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->version:I

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->viewMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    sget-object v2, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 26
    .line 27
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->skipMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    sget-object v2, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->clickMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x5

    .line 49
    sget-object v2, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 50
    .line 51
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->behaviorMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 57
    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    const/4 v1, 0x6

    .line 61
    sget-object v2, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 62
    .line 63
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    :cond_4
    const/4 v0, 0x7

    .line 69
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->duration:I

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 77
    .line 78
    if-eqz v0, :cond_5

    .line 79
    .line 80
    const/16 v1, 0x8

    .line 81
    .line 82
    sget-object v2, Lcom/p1/mobile/putong/data/OMSDisplayRule;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 83
    .line 84
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    add-int/2addr p0, v0

    .line 89
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->url:Ljava/lang/String;

    .line 90
    .line 91
    if-eqz v0, :cond_6

    .line 92
    .line 93
    const/16 v1, 0x9

    .line 94
    .line 95
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr p0, v0

    .line 100
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->href:Ljava/lang/String;

    .line 101
    .line 102
    if-eqz v0, :cond_7

    .line 103
    .line 104
    const/16 v1, 0xa

    .line 105
    .line 106
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    add-int/2addr p0, v0

    .line 111
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 112
    .line 113
    if-eqz v0, :cond_8

    .line 114
    .line 115
    const/16 v1, 0xb

    .line 116
    .line 117
    sget-object v2, Lcom/p1/mobile/putong/data/ADInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 118
    .line 119
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

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
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->cacheEnable:Z

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->scenes:Ljava/util/List;

    .line 134
    .line 135
    if-eqz v0, :cond_9

    .line 136
    .line 137
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 138
    .line 139
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    const/16 v2, 0xd

    .line 144
    .line 145
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    add-int/2addr p0, v0

    .line 150
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->type:Ljava/lang/String;

    .line 151
    .line 152
    if-eqz v0, :cond_a

    .line 153
    .line 154
    const/16 v1, 0xe

    .line 155
    .line 156
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    add-int/2addr p0, v0

    .line 161
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->creative:Lcom/p1/mobile/putong/data/CreativeOms;

    .line 162
    .line 163
    if-eqz v0, :cond_b

    .line 164
    .line 165
    const/16 v1, 0xf

    .line 166
    .line 167
    sget-object v2, Lcom/p1/mobile/putong/data/CreativeOms;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 168
    .line 169
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    add-int/2addr p0, v0

    .line 174
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->operationConfig:Lcom/p1/mobile/putong/data/OperationConfig;

    .line 175
    .line 176
    if-eqz v0, :cond_c

    .line 177
    .line 178
    const/16 v1, 0x10

    .line 179
    .line 180
    sget-object v2, Lcom/p1/mobile/putong/data/OperationConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 181
    .line 182
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    add-int/2addr p0, v0

    .line 187
    :cond_c
    const/16 v0, 0x11

    .line 188
    .line 189
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->budgetType:I

    .line 190
    .line 191
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    add-int/2addr p0, v0

    .line 196
    const/16 v0, 0x12

    .line 197
    .line 198
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ifBeRealtime:Z

    .line 199
    .line 200
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    add-int/2addr p0, v0

    .line 205
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->dspId:Ljava/lang/String;

    .line 206
    .line 207
    if-eqz v0, :cond_d

    .line 208
    .line 209
    const/16 v1, 0x13

    .line 210
    .line 211
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    add-int/2addr p0, v0

    .line 216
    :cond_d
    const/16 v0, 0x14

    .line 217
    .line 218
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->issueTimestamp:J

    .line 219
    .line 220
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 221
    .line 222
    .line 223
    move-result v0

    .line 224
    add-int/2addr p0, v0

    .line 225
    const/16 v0, 0x15

    .line 226
    .line 227
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->price:I

    .line 228
    .line 229
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    add-int/2addr p0, v0

    .line 234
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 235
    .line 236
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 237
    check-cast p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSLauncherInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSLauncherInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSLauncherInfo;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OMSLauncherInfo;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->viewMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->new_()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->viewMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 30
    .line 31
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->skipMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 32
    .line 33
    if-nez p1, :cond_2

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->new_()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->skipMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 40
    .line 41
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->clickMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 42
    .line 43
    if-nez p1, :cond_3

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->new_()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->clickMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 50
    .line 51
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->behaviorMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 52
    .line 53
    if-nez p1, :cond_4

    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->new_()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->behaviorMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 60
    .line 61
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 62
    .line 63
    if-nez p1, :cond_5

    .line 64
    .line 65
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSDisplayRule;->new_()Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 70
    .line 71
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->url:Ljava/lang/String;

    .line 72
    .line 73
    if-nez p1, :cond_6

    .line 74
    .line 75
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->url:Ljava/lang/String;

    .line 76
    .line 77
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->href:Ljava/lang/String;

    .line 78
    .line 79
    if-nez p1, :cond_7

    .line 80
    .line 81
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->href:Ljava/lang/String;

    .line 82
    .line 83
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->scenes:Ljava/util/List;

    .line 84
    .line 85
    if-nez p1, :cond_8

    .line 86
    .line 87
    new-instance p1, Ljava/util/ArrayList;

    .line 88
    .line 89
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 90
    .line 91
    .line 92
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->scenes:Ljava/util/List;

    .line 93
    .line 94
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->type:Ljava/lang/String;

    .line 95
    .line 96
    if-nez p1, :cond_9

    .line 97
    .line 98
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->type:Ljava/lang/String;

    .line 99
    .line 100
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->creative:Lcom/p1/mobile/putong/data/CreativeOms;

    .line 101
    .line 102
    if-nez p1, :cond_a

    .line 103
    .line 104
    invoke-static {}, Lcom/p1/mobile/putong/data/CreativeOms;->new_()Lcom/p1/mobile/putong/data/CreativeOms;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->creative:Lcom/p1/mobile/putong/data/CreativeOms;

    .line 109
    .line 110
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->operationConfig:Lcom/p1/mobile/putong/data/OperationConfig;

    .line 111
    .line 112
    if-nez p1, :cond_b

    .line 113
    .line 114
    invoke-static {}, Lcom/p1/mobile/putong/data/OperationConfig;->new_()Lcom/p1/mobile/putong/data/OperationConfig;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->operationConfig:Lcom/p1/mobile/putong/data/OperationConfig;

    .line 119
    .line 120
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->dspId:Ljava/lang/String;

    .line 121
    .line 122
    if-nez p1, :cond_18

    .line 123
    .line 124
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->dspId:Ljava/lang/String;

    .line 125
    .line 126
    return-object p0

    .line 127
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    iput v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->price:I

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 135
    .line 136
    .line 137
    move-result-wide v0

    .line 138
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->issueTimestamp:J

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->dspId:Ljava/lang/String;

    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ifBeRealtime:Z

    .line 155
    .line 156
    goto/16 :goto_0

    .line 157
    .line 158
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    iput v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->budgetType:I

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :sswitch_5
    sget-object v0, Lcom/p1/mobile/putong/data/OperationConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 167
    .line 168
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    check-cast v0, Lcom/p1/mobile/putong/data/OperationConfig;

    .line 173
    .line 174
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->operationConfig:Lcom/p1/mobile/putong/data/OperationConfig;

    .line 175
    .line 176
    goto/16 :goto_0

    .line 177
    .line 178
    :sswitch_6
    sget-object v0, Lcom/p1/mobile/putong/data/CreativeOms;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 179
    .line 180
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    check-cast v0, Lcom/p1/mobile/putong/data/CreativeOms;

    .line 185
    .line 186
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->creative:Lcom/p1/mobile/putong/data/CreativeOms;

    .line 187
    .line 188
    goto/16 :goto_0

    .line 189
    .line 190
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->type:Ljava/lang/String;

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_8
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 199
    .line 200
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    check-cast v0, Ljava/util/List;

    .line 209
    .line 210
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->scenes:Ljava/util/List;

    .line 211
    .line 212
    goto/16 :goto_0

    .line 213
    .line 214
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->cacheEnable:Z

    .line 219
    .line 220
    goto/16 :goto_0

    .line 221
    .line 222
    :sswitch_a
    sget-object v0, Lcom/p1/mobile/putong/data/ADInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 223
    .line 224
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    check-cast v0, Lcom/p1/mobile/putong/data/ADInfo;

    .line 229
    .line 230
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 231
    .line 232
    goto/16 :goto_0

    .line 233
    .line 234
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->href:Ljava/lang/String;

    .line 239
    .line 240
    goto/16 :goto_0

    .line 241
    .line 242
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->url:Ljava/lang/String;

    .line 247
    .line 248
    goto/16 :goto_0

    .line 249
    .line 250
    :sswitch_d
    sget-object v0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 251
    .line 252
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    check-cast v0, Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 257
    .line 258
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 259
    .line 260
    goto/16 :goto_0

    .line 261
    .line 262
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 263
    .line 264
    .line 265
    move-result v0

    .line 266
    iput v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->duration:I

    .line 267
    .line 268
    goto/16 :goto_0

    .line 269
    .line 270
    :sswitch_f
    sget-object v0, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 271
    .line 272
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    check-cast v0, Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 277
    .line 278
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->behaviorMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 279
    .line 280
    goto/16 :goto_0

    .line 281
    .line 282
    :sswitch_10
    sget-object v0, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 283
    .line 284
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 285
    .line 286
    .line 287
    move-result-object v0

    .line 288
    check-cast v0, Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 289
    .line 290
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->clickMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 291
    .line 292
    goto/16 :goto_0

    .line 293
    .line 294
    :sswitch_11
    sget-object v0, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 295
    .line 296
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    check-cast v0, Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 301
    .line 302
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->skipMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 303
    .line 304
    goto/16 :goto_0

    .line 305
    .line 306
    :sswitch_12
    sget-object v0, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 307
    .line 308
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    check-cast v0, Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 313
    .line 314
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->viewMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 315
    .line 316
    goto/16 :goto_0

    .line 317
    .line 318
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 319
    .line 320
    .line 321
    move-result v0

    .line 322
    iput v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->version:I

    .line 323
    .line 324
    goto/16 :goto_0

    .line 325
    .line 326
    :sswitch_14
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object v0

    .line 330
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

    .line 331
    .line 332
    goto/16 :goto_0

    .line 333
    .line 334
    :sswitch_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

    .line 335
    .line 336
    if-nez p1, :cond_c

    .line 337
    .line 338
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

    .line 339
    .line 340
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->viewMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 341
    .line 342
    if-nez p1, :cond_d

    .line 343
    .line 344
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->new_()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 345
    .line 346
    .line 347
    move-result-object p1

    .line 348
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->viewMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 349
    .line 350
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->skipMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 351
    .line 352
    if-nez p1, :cond_e

    .line 353
    .line 354
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->new_()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 355
    .line 356
    .line 357
    move-result-object p1

    .line 358
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->skipMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 359
    .line 360
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->clickMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 361
    .line 362
    if-nez p1, :cond_f

    .line 363
    .line 364
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->new_()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 365
    .line 366
    .line 367
    move-result-object p1

    .line 368
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->clickMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 369
    .line 370
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->behaviorMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 371
    .line 372
    if-nez p1, :cond_10

    .line 373
    .line 374
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->new_()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 375
    .line 376
    .line 377
    move-result-object p1

    .line 378
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->behaviorMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 379
    .line 380
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 381
    .line 382
    if-nez p1, :cond_11

    .line 383
    .line 384
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSDisplayRule;->new_()Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 385
    .line 386
    .line 387
    move-result-object p1

    .line 388
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 389
    .line 390
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->url:Ljava/lang/String;

    .line 391
    .line 392
    if-nez p1, :cond_12

    .line 393
    .line 394
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->url:Ljava/lang/String;

    .line 395
    .line 396
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->href:Ljava/lang/String;

    .line 397
    .line 398
    if-nez p1, :cond_13

    .line 399
    .line 400
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->href:Ljava/lang/String;

    .line 401
    .line 402
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->scenes:Ljava/util/List;

    .line 403
    .line 404
    if-nez p1, :cond_14

    .line 405
    .line 406
    new-instance p1, Ljava/util/ArrayList;

    .line 407
    .line 408
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 409
    .line 410
    .line 411
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->scenes:Ljava/util/List;

    .line 412
    .line 413
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->type:Ljava/lang/String;

    .line 414
    .line 415
    if-nez p1, :cond_15

    .line 416
    .line 417
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->type:Ljava/lang/String;

    .line 418
    .line 419
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->creative:Lcom/p1/mobile/putong/data/CreativeOms;

    .line 420
    .line 421
    if-nez p1, :cond_16

    .line 422
    .line 423
    invoke-static {}, Lcom/p1/mobile/putong/data/CreativeOms;->new_()Lcom/p1/mobile/putong/data/CreativeOms;

    .line 424
    .line 425
    .line 426
    move-result-object p1

    .line 427
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->creative:Lcom/p1/mobile/putong/data/CreativeOms;

    .line 428
    .line 429
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->operationConfig:Lcom/p1/mobile/putong/data/OperationConfig;

    .line 430
    .line 431
    if-nez p1, :cond_17

    .line 432
    .line 433
    invoke-static {}, Lcom/p1/mobile/putong/data/OperationConfig;->new_()Lcom/p1/mobile/putong/data/OperationConfig;

    .line 434
    .line 435
    .line 436
    move-result-object p1

    .line 437
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->operationConfig:Lcom/p1/mobile/putong/data/OperationConfig;

    .line 438
    .line 439
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->dspId:Ljava/lang/String;

    .line 440
    .line 441
    if-nez p1, :cond_18

    .line 442
    .line 443
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->dspId:Ljava/lang/String;

    .line 444
    .line 445
    :cond_18
    return-object p0

    .line 446
    nop

    .line 447
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_15
        0xa -> :sswitch_14
        0x10 -> :sswitch_13
        0x1a -> :sswitch_12
        0x22 -> :sswitch_11
        0x2a -> :sswitch_10
        0x32 -> :sswitch_f
        0x38 -> :sswitch_e
        0x42 -> :sswitch_d
        0x4a -> :sswitch_c
        0x52 -> :sswitch_b
        0x5a -> :sswitch_a
        0x60 -> :sswitch_9
        0x6a -> :sswitch_8
        0x72 -> :sswitch_7
        0x7a -> :sswitch_6
        0x82 -> :sswitch_5
        0x88 -> :sswitch_4
        0x90 -> :sswitch_3
        0x9a -> :sswitch_2
        0xa0 -> :sswitch_1
        0xa8 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 447
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSLauncherInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSLauncherInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/OMSLauncherInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

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
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->version:I

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->viewMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    sget-object v1, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 21
    .line 22
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->skipMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    sget-object v1, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->clickMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    const/4 v0, 0x5

    .line 40
    sget-object v1, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 41
    .line 42
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 43
    .line 44
    .line 45
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->behaviorMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const/4 v0, 0x6

    .line 50
    sget-object v1, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 51
    .line 52
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 53
    .line 54
    .line 55
    :cond_4
    const/4 p0, 0x7

    .line 56
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->duration:I

    .line 57
    .line 58
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 62
    .line 63
    if-eqz p0, :cond_5

    .line 64
    .line 65
    const/16 v0, 0x8

    .line 66
    .line 67
    sget-object v1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 68
    .line 69
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 70
    .line 71
    .line 72
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->url:Ljava/lang/String;

    .line 73
    .line 74
    if-eqz p0, :cond_6

    .line 75
    .line 76
    const/16 v0, 0x9

    .line 77
    .line 78
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->href:Ljava/lang/String;

    .line 82
    .line 83
    if-eqz p0, :cond_7

    .line 84
    .line 85
    const/16 v0, 0xa

    .line 86
    .line 87
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 91
    .line 92
    if-eqz p0, :cond_8

    .line 93
    .line 94
    const/16 v0, 0xb

    .line 95
    .line 96
    sget-object v1, Lcom/p1/mobile/putong/data/ADInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 97
    .line 98
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 99
    .line 100
    .line 101
    :cond_8
    const/16 p0, 0xc

    .line 102
    .line 103
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->cacheEnable:Z

    .line 104
    .line 105
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 106
    .line 107
    .line 108
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->scenes:Ljava/util/List;

    .line 109
    .line 110
    if-eqz p0, :cond_9

    .line 111
    .line 112
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 113
    .line 114
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    const/16 v1, 0xd

    .line 119
    .line 120
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 121
    .line 122
    .line 123
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->type:Ljava/lang/String;

    .line 124
    .line 125
    if-eqz p0, :cond_a

    .line 126
    .line 127
    const/16 v0, 0xe

    .line 128
    .line 129
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 130
    .line 131
    .line 132
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->creative:Lcom/p1/mobile/putong/data/CreativeOms;

    .line 133
    .line 134
    if-eqz p0, :cond_b

    .line 135
    .line 136
    const/16 v0, 0xf

    .line 137
    .line 138
    sget-object v1, Lcom/p1/mobile/putong/data/CreativeOms;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 139
    .line 140
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 141
    .line 142
    .line 143
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->operationConfig:Lcom/p1/mobile/putong/data/OperationConfig;

    .line 144
    .line 145
    if-eqz p0, :cond_c

    .line 146
    .line 147
    const/16 v0, 0x10

    .line 148
    .line 149
    sget-object v1, Lcom/p1/mobile/putong/data/OperationConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 150
    .line 151
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 152
    .line 153
    .line 154
    :cond_c
    const/16 p0, 0x11

    .line 155
    .line 156
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->budgetType:I

    .line 157
    .line 158
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 159
    .line 160
    .line 161
    const/16 p0, 0x12

    .line 162
    .line 163
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ifBeRealtime:Z

    .line 164
    .line 165
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 166
    .line 167
    .line 168
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->dspId:Ljava/lang/String;

    .line 169
    .line 170
    if-eqz p0, :cond_d

    .line 171
    .line 172
    const/16 v0, 0x13

    .line 173
    .line 174
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 175
    .line 176
    .line 177
    :cond_d
    const/16 p0, 0x14

    .line 178
    .line 179
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->issueTimestamp:J

    .line 180
    .line 181
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 182
    .line 183
    .line 184
    const/16 p0, 0x15

    .line 185
    .line 186
    iget p1, p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->price:I

    .line 187
    .line 188
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 189
    .line 190
    .line 191
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 192
    check-cast p1, Lcom/p1/mobile/putong/data/OMSLauncherInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/OMSLauncherInfo$1;->serialize(Lcom/p1/mobile/putong/data/OMSLauncherInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
