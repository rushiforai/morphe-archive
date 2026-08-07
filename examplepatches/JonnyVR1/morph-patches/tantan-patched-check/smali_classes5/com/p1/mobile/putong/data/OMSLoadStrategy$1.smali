.class Lcom/p1/mobile/putong/data/OMSLoadStrategy$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/OMSLoadStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/OMSLoadStrategy;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSLoadStrategy;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->triggerRuleIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    sget-object v2, Lcom/p1/mobile/putong/data/OMSIds;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 22
    .line 23
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->displayRuleIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const/4 v1, 0x3

    .line 33
    sget-object v2, Lcom/p1/mobile/putong/data/OMSIds;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->resourceIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    const/4 v1, 0x4

    .line 45
    sget-object v2, Lcom/p1/mobile/putong/data/OMSIds;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 46
    .line 47
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->positionIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 53
    .line 54
    if-eqz v0, :cond_4

    .line 55
    .line 56
    const/4 v1, 0x5

    .line 57
    sget-object v2, Lcom/p1/mobile/putong/data/OMSIds;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 58
    .line 59
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 65
    .line 66
    if-eqz v0, :cond_5

    .line 67
    .line 68
    const/4 v1, 0x6

    .line 69
    sget-object v2, Lcom/p1/mobile/putong/data/LoadStrategy;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 70
    .line 71
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int/2addr p0, v0

    .line 76
    :cond_5
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 77
    .line 78
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 79
    check-cast p1, Lcom/p1/mobile/putong/data/OMSLoadStrategy;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSLoadStrategy$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSLoadStrategy;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSLoadStrategy;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OMSLoadStrategy;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eqz v2, :cond_b

    .line 13
    .line 14
    const/16 v3, 0x8

    .line 15
    .line 16
    if-eq v2, v3, :cond_a

    .line 17
    .line 18
    const/16 v3, 0x12

    .line 19
    .line 20
    if-eq v2, v3, :cond_9

    .line 21
    .line 22
    const/16 v3, 0x1a

    .line 23
    .line 24
    if-eq v2, v3, :cond_8

    .line 25
    .line 26
    const/16 v3, 0x22

    .line 27
    .line 28
    if-eq v2, v3, :cond_7

    .line 29
    .line 30
    const/16 v3, 0x2a

    .line 31
    .line 32
    if-eq v2, v3, :cond_6

    .line 33
    .line 34
    const/16 v3, 0x32

    .line 35
    .line 36
    if-eq v2, v3, :cond_5

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 39
    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    sget-object p1, Lcom/p1/mobile/putong/data/LoadStrategy;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 57
    .line 58
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 59
    .line 60
    if-nez p1, :cond_1

    .line 61
    .line 62
    sget-object p1, Lcom/p1/mobile/putong/data/LoadStrategy;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 69
    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 71
    .line 72
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->triggerRuleIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 73
    .line 74
    if-nez p1, :cond_2

    .line 75
    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSIds;->new_()Lcom/p1/mobile/putong/data/OMSIds;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->triggerRuleIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 81
    .line 82
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->displayRuleIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 83
    .line 84
    if-nez p1, :cond_3

    .line 85
    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSIds;->new_()Lcom/p1/mobile/putong/data/OMSIds;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->displayRuleIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 91
    .line 92
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->resourceIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 93
    .line 94
    if-nez p1, :cond_4

    .line 95
    .line 96
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSIds;->new_()Lcom/p1/mobile/putong/data/OMSIds;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->resourceIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 101
    .line 102
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->positionIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 103
    .line 104
    if-nez p1, :cond_11

    .line 105
    .line 106
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSIds;->new_()Lcom/p1/mobile/putong/data/OMSIds;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->positionIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 111
    .line 112
    return-object p0

    .line 113
    :cond_5
    sget-object v2, Lcom/p1/mobile/putong/data/LoadStrategy;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 114
    .line 115
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    check-cast v2, Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 120
    .line 121
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_6
    sget-object v2, Lcom/p1/mobile/putong/data/OMSIds;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 125
    .line 126
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    check-cast v2, Lcom/p1/mobile/putong/data/OMSIds;

    .line 131
    .line 132
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->positionIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_7
    sget-object v2, Lcom/p1/mobile/putong/data/OMSIds;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 136
    .line 137
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    check-cast v2, Lcom/p1/mobile/putong/data/OMSIds;

    .line 142
    .line 143
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->resourceIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 144
    .line 145
    goto/16 :goto_0

    .line 146
    .line 147
    :cond_8
    sget-object v2, Lcom/p1/mobile/putong/data/OMSIds;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 148
    .line 149
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    check-cast v2, Lcom/p1/mobile/putong/data/OMSIds;

    .line 154
    .line 155
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->displayRuleIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 156
    .line 157
    goto/16 :goto_0

    .line 158
    .line 159
    :cond_9
    sget-object v2, Lcom/p1/mobile/putong/data/OMSIds;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 160
    .line 161
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    check-cast v2, Lcom/p1/mobile/putong/data/OMSIds;

    .line 166
    .line 167
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->triggerRuleIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 168
    .line 169
    goto/16 :goto_0

    .line 170
    .line 171
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    goto/16 :goto_0

    .line 180
    .line 181
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 182
    .line 183
    if-nez p1, :cond_c

    .line 184
    .line 185
    if-eqz v1, :cond_c

    .line 186
    .line 187
    sget-object p1, Lcom/p1/mobile/putong/data/LoadStrategy;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 188
    .line 189
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    check-cast p1, Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 198
    .line 199
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 200
    .line 201
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 202
    .line 203
    if-nez p1, :cond_d

    .line 204
    .line 205
    sget-object p1, Lcom/p1/mobile/putong/data/LoadStrategy;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 206
    .line 207
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    check-cast p1, Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 212
    .line 213
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 214
    .line 215
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->triggerRuleIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 216
    .line 217
    if-nez p1, :cond_e

    .line 218
    .line 219
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSIds;->new_()Lcom/p1/mobile/putong/data/OMSIds;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->triggerRuleIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 224
    .line 225
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->displayRuleIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 226
    .line 227
    if-nez p1, :cond_f

    .line 228
    .line 229
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSIds;->new_()Lcom/p1/mobile/putong/data/OMSIds;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->displayRuleIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 234
    .line 235
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->resourceIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 236
    .line 237
    if-nez p1, :cond_10

    .line 238
    .line 239
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSIds;->new_()Lcom/p1/mobile/putong/data/OMSIds;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->resourceIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 244
    .line 245
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->positionIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 246
    .line 247
    if-nez p1, :cond_11

    .line 248
    .line 249
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSIds;->new_()Lcom/p1/mobile/putong/data/OMSIds;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->positionIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 254
    .line 255
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

    .line 256
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSLoadStrategy$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSLoadStrategy;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/OMSLoadStrategy;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->triggerRuleIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    sget-object v1, Lcom/p1/mobile/putong/data/OMSIds;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 19
    .line 20
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->displayRuleIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x3

    .line 28
    sget-object v1, Lcom/p1/mobile/putong/data/OMSIds;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 29
    .line 30
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->resourceIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 34
    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    const/4 v0, 0x4

    .line 38
    sget-object v1, Lcom/p1/mobile/putong/data/OMSIds;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 39
    .line 40
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 41
    .line 42
    .line 43
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->positionIDs:Lcom/p1/mobile/putong/data/OMSIds;

    .line 44
    .line 45
    if-eqz p0, :cond_4

    .line 46
    .line 47
    const/4 v0, 0x5

    .line 48
    sget-object v1, Lcom/p1/mobile/putong/data/OMSIds;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 49
    .line 50
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 51
    .line 52
    .line 53
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 54
    .line 55
    if-eqz p0, :cond_5

    .line 56
    .line 57
    const/4 p1, 0x6

    .line 58
    sget-object v0, Lcom/p1/mobile/putong/data/LoadStrategy;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 59
    .line 60
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 61
    .line 62
    .line 63
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

    .line 64
    check-cast p1, Lcom/p1/mobile/putong/data/OMSLoadStrategy;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/OMSLoadStrategy$1;->serialize(Lcom/p1/mobile/putong/data/OMSLoadStrategy;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
