.class Lcom/p1/mobile/putong/core/data/IntlMarketConfigData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->meta:Lcom/p1/mobile/putong/core/data/IntlMarketConfigDataMeta;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/IntlMarketConfigDataMeta;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-static {v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->entrypoint:Lcom/p1/mobile/putong/core/data/IntlMarketConfigEntrypoint;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/core/data/IntlMarketConfigEntrypoint;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 20
    .line 21
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->regular_summary:Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 32
    .line 33
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->regular_sticker:Lcom/p1/mobile/putong/core/data/IntlMarketStickerData;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x4

    .line 43
    sget-object v2, Lcom/p1/mobile/putong/core/data/IntlMarketStickerData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 44
    .line 45
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->quiz_summary:Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x5

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 56
    .line 57
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->quiz_question:Lcom/p1/mobile/putong/core/data/IntlMarketQuestionData;

    .line 63
    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    const/4 v1, 0x6

    .line 67
    sget-object v2, Lcom/p1/mobile/putong/core/data/IntlMarketQuestionData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 68
    .line 69
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    :cond_5
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 75
    .line 76
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 77
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;-><init>()V

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
    if-eqz v0, :cond_b

    .line 11
    .line 12
    const/16 v1, 0xa

    .line 13
    .line 14
    if-eq v0, v1, :cond_a

    .line 15
    .line 16
    const/16 v1, 0x12

    .line 17
    .line 18
    if-eq v0, v1, :cond_9

    .line 19
    .line 20
    const/16 v1, 0x1a

    .line 21
    .line 22
    if-eq v0, v1, :cond_8

    .line 23
    .line 24
    const/16 v1, 0x22

    .line 25
    .line 26
    if-eq v0, v1, :cond_7

    .line 27
    .line 28
    const/16 v1, 0x2a

    .line 29
    .line 30
    if-eq v0, v1, :cond_6

    .line 31
    .line 32
    const/16 v1, 0x32

    .line 33
    .line 34
    if-eq v0, v1, :cond_5

    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->meta:Lcom/p1/mobile/putong/core/data/IntlMarketConfigDataMeta;

    .line 37
    .line 38
    if-nez p1, :cond_0

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlMarketConfigDataMeta;->new_()Lcom/p1/mobile/putong/core/data/IntlMarketConfigDataMeta;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->meta:Lcom/p1/mobile/putong/core/data/IntlMarketConfigDataMeta;

    .line 45
    .line 46
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->entrypoint:Lcom/p1/mobile/putong/core/data/IntlMarketConfigEntrypoint;

    .line 47
    .line 48
    if-nez p1, :cond_1

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlMarketConfigEntrypoint;->new_()Lcom/p1/mobile/putong/core/data/IntlMarketConfigEntrypoint;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->entrypoint:Lcom/p1/mobile/putong/core/data/IntlMarketConfigEntrypoint;

    .line 55
    .line 56
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->regular_summary:Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    .line 57
    .line 58
    if-nez p1, :cond_2

    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->new_()Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->regular_summary:Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    .line 65
    .line 66
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->regular_sticker:Lcom/p1/mobile/putong/core/data/IntlMarketStickerData;

    .line 67
    .line 68
    if-nez p1, :cond_3

    .line 69
    .line 70
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlMarketStickerData;->new_()Lcom/p1/mobile/putong/core/data/IntlMarketStickerData;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->regular_sticker:Lcom/p1/mobile/putong/core/data/IntlMarketStickerData;

    .line 75
    .line 76
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->quiz_summary:Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    .line 77
    .line 78
    if-nez p1, :cond_4

    .line 79
    .line 80
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->new_()Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->quiz_summary:Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    .line 85
    .line 86
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->quiz_question:Lcom/p1/mobile/putong/core/data/IntlMarketQuestionData;

    .line 87
    .line 88
    if-nez p1, :cond_11

    .line 89
    .line 90
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlMarketQuestionData;->new_()Lcom/p1/mobile/putong/core/data/IntlMarketQuestionData;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->quiz_question:Lcom/p1/mobile/putong/core/data/IntlMarketQuestionData;

    .line 95
    .line 96
    return-object p0

    .line 97
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlMarketQuestionData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 98
    .line 99
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Lcom/p1/mobile/putong/core/data/IntlMarketQuestionData;

    .line 104
    .line 105
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->quiz_question:Lcom/p1/mobile/putong/core/data/IntlMarketQuestionData;

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 109
    .line 110
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    check-cast v0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    .line 115
    .line 116
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->quiz_summary:Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlMarketStickerData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 120
    .line 121
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    check-cast v0, Lcom/p1/mobile/putong/core/data/IntlMarketStickerData;

    .line 126
    .line 127
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->regular_sticker:Lcom/p1/mobile/putong/core/data/IntlMarketStickerData;

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 131
    .line 132
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    check-cast v0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    .line 137
    .line 138
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->regular_summary:Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :cond_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigEntrypoint;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 143
    .line 144
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    check-cast v0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigEntrypoint;

    .line 149
    .line 150
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->entrypoint:Lcom/p1/mobile/putong/core/data/IntlMarketConfigEntrypoint;

    .line 151
    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :cond_a
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigDataMeta;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 155
    .line 156
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    check-cast v0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigDataMeta;

    .line 161
    .line 162
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->meta:Lcom/p1/mobile/putong/core/data/IntlMarketConfigDataMeta;

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->meta:Lcom/p1/mobile/putong/core/data/IntlMarketConfigDataMeta;

    .line 167
    .line 168
    if-nez p1, :cond_c

    .line 169
    .line 170
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlMarketConfigDataMeta;->new_()Lcom/p1/mobile/putong/core/data/IntlMarketConfigDataMeta;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->meta:Lcom/p1/mobile/putong/core/data/IntlMarketConfigDataMeta;

    .line 175
    .line 176
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->entrypoint:Lcom/p1/mobile/putong/core/data/IntlMarketConfigEntrypoint;

    .line 177
    .line 178
    if-nez p1, :cond_d

    .line 179
    .line 180
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlMarketConfigEntrypoint;->new_()Lcom/p1/mobile/putong/core/data/IntlMarketConfigEntrypoint;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->entrypoint:Lcom/p1/mobile/putong/core/data/IntlMarketConfigEntrypoint;

    .line 185
    .line 186
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->regular_summary:Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    .line 187
    .line 188
    if-nez p1, :cond_e

    .line 189
    .line 190
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->new_()Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->regular_summary:Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    .line 195
    .line 196
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->regular_sticker:Lcom/p1/mobile/putong/core/data/IntlMarketStickerData;

    .line 197
    .line 198
    if-nez p1, :cond_f

    .line 199
    .line 200
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlMarketStickerData;->new_()Lcom/p1/mobile/putong/core/data/IntlMarketStickerData;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->regular_sticker:Lcom/p1/mobile/putong/core/data/IntlMarketStickerData;

    .line 205
    .line 206
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->quiz_summary:Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    .line 207
    .line 208
    if-nez p1, :cond_10

    .line 209
    .line 210
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->new_()Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->quiz_summary:Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    .line 215
    .line 216
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->quiz_question:Lcom/p1/mobile/putong/core/data/IntlMarketQuestionData;

    .line 217
    .line 218
    if-nez p1, :cond_11

    .line 219
    .line 220
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlMarketQuestionData;->new_()Lcom/p1/mobile/putong/core/data/IntlMarketQuestionData;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->quiz_question:Lcom/p1/mobile/putong/core/data/IntlMarketQuestionData;

    .line 225
    .line 226
    :cond_11
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 227
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->meta:Lcom/p1/mobile/putong/core/data/IntlMarketConfigDataMeta;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/IntlMarketConfigDataMeta;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->entrypoint:Lcom/p1/mobile/putong/core/data/IntlMarketConfigEntrypoint;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/data/IntlMarketConfigEntrypoint;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->regular_summary:Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->regular_sticker:Lcom/p1/mobile/putong/core/data/IntlMarketStickerData;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/core/data/IntlMarketStickerData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 37
    .line 38
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->quiz_summary:Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    .line 42
    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    const/4 v0, 0x5

    .line 46
    sget-object v1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 49
    .line 50
    .line 51
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;->quiz_question:Lcom/p1/mobile/putong/core/data/IntlMarketQuestionData;

    .line 52
    .line 53
    if-eqz p0, :cond_5

    .line 54
    .line 55
    const/4 p1, 0x6

    .line 56
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlMarketQuestionData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 57
    .line 58
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 59
    .line 60
    .line 61
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

    .line 62
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/IntlMarketConfigData$1;->serialize(Lcom/p1/mobile/putong/core/data/IntlMarketConfigData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
