.class Lcom/p1/mobile/putong/data/CreativeOms$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/CreativeOms;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/CreativeOms;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/CreativeOms;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CreativeOms;->creativeType:Lcom/p1/mobile/putong/data/CreativeType;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CreativeOms;->url:Ljava/lang/String;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CreativeOms;->logoRatio:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_2
    const/4 v0, 0x4

    .line 37
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/CreativeOms;->logoAreaClickable:Z

    .line 38
    .line 39
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CreativeOms;->skipPosition:Lcom/p1/mobile/putong/data/SkipPosition;

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x5

    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CreativeOms;->creativeType:Lcom/p1/mobile/putong/data/CreativeType;

    .line 59
    .line 60
    if-eqz v0, :cond_4

    .line 61
    .line 62
    const/4 v1, 0x6

    .line 63
    sget-object v2, Lcom/p1/mobile/putong/data/CreativeType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CreativeOms;->skipPosition:Lcom/p1/mobile/putong/data/SkipPosition;

    .line 71
    .line 72
    if-eqz v0, :cond_5

    .line 73
    .line 74
    const/4 v1, 0x7

    .line 75
    sget-object v2, Lcom/p1/mobile/putong/data/SkipPosition;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 76
    .line 77
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    add-int/2addr p0, v0

    .line 82
    :cond_5
    const/16 v0, 0x8

    .line 83
    .line 84
    iget v1, p1, Lcom/p1/mobile/putong/data/CreativeOms;->processMethod:I

    .line 85
    .line 86
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    add-int/2addr p0, v0

    .line 91
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 92
    .line 93
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 94
    check-cast p1, Lcom/p1/mobile/putong/data/CreativeOms;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/CreativeOms$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/CreativeOms;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/CreativeOms;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/CreativeOms;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/CreativeOms;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    move-object v2, v1

    .line 9
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    const-string v4, ""

    .line 14
    .line 15
    if-eqz v3, :cond_d

    .line 16
    .line 17
    const/16 v5, 0x8

    .line 18
    .line 19
    if-eq v3, v5, :cond_c

    .line 20
    .line 21
    const/16 v5, 0x12

    .line 22
    .line 23
    if-eq v3, v5, :cond_b

    .line 24
    .line 25
    const/16 v5, 0x1a

    .line 26
    .line 27
    if-eq v3, v5, :cond_a

    .line 28
    .line 29
    const/16 v5, 0x20

    .line 30
    .line 31
    if-eq v3, v5, :cond_9

    .line 32
    .line 33
    const/16 v5, 0x28

    .line 34
    .line 35
    if-eq v3, v5, :cond_8

    .line 36
    .line 37
    const/16 v5, 0x32

    .line 38
    .line 39
    if-eq v3, v5, :cond_7

    .line 40
    .line 41
    const/16 v5, 0x3a

    .line 42
    .line 43
    if-eq v3, v5, :cond_6

    .line 44
    .line 45
    const/16 v5, 0x40

    .line 46
    .line 47
    if-eq v3, v5, :cond_5

    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CreativeOms;->creativeType:Lcom/p1/mobile/putong/data/CreativeType;

    .line 50
    .line 51
    if-nez p1, :cond_0

    .line 52
    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    sget-object p1, Lcom/p1/mobile/putong/data/CreativeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Lcom/p1/mobile/putong/data/CreativeType;

    .line 66
    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CreativeOms;->creativeType:Lcom/p1/mobile/putong/data/CreativeType;

    .line 68
    .line 69
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CreativeOms;->skipPosition:Lcom/p1/mobile/putong/data/SkipPosition;

    .line 70
    .line 71
    if-nez p1, :cond_1

    .line 72
    .line 73
    if-eqz v2, :cond_1

    .line 74
    .line 75
    sget-object p1, Lcom/p1/mobile/putong/data/SkipPosition;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 76
    .line 77
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    check-cast p1, Lcom/p1/mobile/putong/data/SkipPosition;

    .line 86
    .line 87
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CreativeOms;->skipPosition:Lcom/p1/mobile/putong/data/SkipPosition;

    .line 88
    .line 89
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CreativeOms;->creativeType:Lcom/p1/mobile/putong/data/CreativeType;

    .line 90
    .line 91
    if-nez p1, :cond_2

    .line 92
    .line 93
    sget-object p1, Lcom/p1/mobile/putong/data/CreativeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    check-cast p1, Lcom/p1/mobile/putong/data/CreativeType;

    .line 100
    .line 101
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CreativeOms;->creativeType:Lcom/p1/mobile/putong/data/CreativeType;

    .line 102
    .line 103
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CreativeOms;->url:Ljava/lang/String;

    .line 104
    .line 105
    if-nez p1, :cond_3

    .line 106
    .line 107
    iput-object v4, p0, Lcom/p1/mobile/putong/data/CreativeOms;->url:Ljava/lang/String;

    .line 108
    .line 109
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CreativeOms;->logoRatio:Ljava/lang/String;

    .line 110
    .line 111
    if-nez p1, :cond_4

    .line 112
    .line 113
    iput-object v4, p0, Lcom/p1/mobile/putong/data/CreativeOms;->logoRatio:Ljava/lang/String;

    .line 114
    .line 115
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CreativeOms;->skipPosition:Lcom/p1/mobile/putong/data/SkipPosition;

    .line 116
    .line 117
    if-nez p1, :cond_13

    .line 118
    .line 119
    sget-object p1, Lcom/p1/mobile/putong/data/SkipPosition;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 120
    .line 121
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    check-cast p1, Lcom/p1/mobile/putong/data/SkipPosition;

    .line 126
    .line 127
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CreativeOms;->skipPosition:Lcom/p1/mobile/putong/data/SkipPosition;

    .line 128
    .line 129
    return-object p0

    .line 130
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 131
    .line 132
    .line 133
    move-result v3

    .line 134
    iput v3, p0, Lcom/p1/mobile/putong/data/CreativeOms;->processMethod:I

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_6
    sget-object v3, Lcom/p1/mobile/putong/data/SkipPosition;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 138
    .line 139
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    check-cast v3, Lcom/p1/mobile/putong/data/SkipPosition;

    .line 144
    .line 145
    iput-object v3, p0, Lcom/p1/mobile/putong/data/CreativeOms;->skipPosition:Lcom/p1/mobile/putong/data/SkipPosition;

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :cond_7
    sget-object v3, Lcom/p1/mobile/putong/data/CreativeType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 150
    .line 151
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    check-cast v3, Lcom/p1/mobile/putong/data/CreativeType;

    .line 156
    .line 157
    iput-object v3, p0, Lcom/p1/mobile/putong/data/CreativeOms;->creativeType:Lcom/p1/mobile/putong/data/CreativeType;

    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 162
    .line 163
    .line 164
    move-result v2

    .line 165
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    goto/16 :goto_0

    .line 170
    .line 171
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 172
    .line 173
    .line 174
    move-result v3

    .line 175
    iput-boolean v3, p0, Lcom/p1/mobile/putong/data/CreativeOms;->logoAreaClickable:Z

    .line 176
    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v3

    .line 183
    iput-object v3, p0, Lcom/p1/mobile/putong/data/CreativeOms;->logoRatio:Ljava/lang/String;

    .line 184
    .line 185
    goto/16 :goto_0

    .line 186
    .line 187
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    iput-object v3, p0, Lcom/p1/mobile/putong/data/CreativeOms;->url:Ljava/lang/String;

    .line 192
    .line 193
    goto/16 :goto_0

    .line 194
    .line 195
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 196
    .line 197
    .line 198
    move-result v1

    .line 199
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    goto/16 :goto_0

    .line 204
    .line 205
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CreativeOms;->creativeType:Lcom/p1/mobile/putong/data/CreativeType;

    .line 206
    .line 207
    if-nez p1, :cond_e

    .line 208
    .line 209
    if-eqz v1, :cond_e

    .line 210
    .line 211
    sget-object p1, Lcom/p1/mobile/putong/data/CreativeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 212
    .line 213
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 214
    .line 215
    .line 216
    move-result v1

    .line 217
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    check-cast p1, Lcom/p1/mobile/putong/data/CreativeType;

    .line 222
    .line 223
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CreativeOms;->creativeType:Lcom/p1/mobile/putong/data/CreativeType;

    .line 224
    .line 225
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CreativeOms;->skipPosition:Lcom/p1/mobile/putong/data/SkipPosition;

    .line 226
    .line 227
    if-nez p1, :cond_f

    .line 228
    .line 229
    if-eqz v2, :cond_f

    .line 230
    .line 231
    sget-object p1, Lcom/p1/mobile/putong/data/SkipPosition;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 232
    .line 233
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 234
    .line 235
    .line 236
    move-result v1

    .line 237
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    check-cast p1, Lcom/p1/mobile/putong/data/SkipPosition;

    .line 242
    .line 243
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CreativeOms;->skipPosition:Lcom/p1/mobile/putong/data/SkipPosition;

    .line 244
    .line 245
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CreativeOms;->creativeType:Lcom/p1/mobile/putong/data/CreativeType;

    .line 246
    .line 247
    if-nez p1, :cond_10

    .line 248
    .line 249
    sget-object p1, Lcom/p1/mobile/putong/data/CreativeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 250
    .line 251
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    check-cast p1, Lcom/p1/mobile/putong/data/CreativeType;

    .line 256
    .line 257
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CreativeOms;->creativeType:Lcom/p1/mobile/putong/data/CreativeType;

    .line 258
    .line 259
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CreativeOms;->url:Ljava/lang/String;

    .line 260
    .line 261
    if-nez p1, :cond_11

    .line 262
    .line 263
    iput-object v4, p0, Lcom/p1/mobile/putong/data/CreativeOms;->url:Ljava/lang/String;

    .line 264
    .line 265
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CreativeOms;->logoRatio:Ljava/lang/String;

    .line 266
    .line 267
    if-nez p1, :cond_12

    .line 268
    .line 269
    iput-object v4, p0, Lcom/p1/mobile/putong/data/CreativeOms;->logoRatio:Ljava/lang/String;

    .line 270
    .line 271
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CreativeOms;->skipPosition:Lcom/p1/mobile/putong/data/SkipPosition;

    .line 272
    .line 273
    if-nez p1, :cond_13

    .line 274
    .line 275
    sget-object p1, Lcom/p1/mobile/putong/data/SkipPosition;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 276
    .line 277
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 278
    .line 279
    .line 280
    move-result-object p1

    .line 281
    check-cast p1, Lcom/p1/mobile/putong/data/SkipPosition;

    .line 282
    .line 283
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CreativeOms;->skipPosition:Lcom/p1/mobile/putong/data/SkipPosition;

    .line 284
    .line 285
    :cond_13
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 286
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/CreativeOms$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/CreativeOms;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/CreativeOms;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CreativeOms;->creativeType:Lcom/p1/mobile/putong/data/CreativeType;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CreativeOms;->url:Ljava/lang/String;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CreativeOms;->logoRatio:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    const/4 p0, 0x4

    .line 30
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/CreativeOms;->logoAreaClickable:Z

    .line 31
    .line 32
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CreativeOms;->skipPosition:Lcom/p1/mobile/putong/data/SkipPosition;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    const/4 v0, 0x5

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 45
    .line 46
    .line 47
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CreativeOms;->creativeType:Lcom/p1/mobile/putong/data/CreativeType;

    .line 48
    .line 49
    if-eqz p0, :cond_4

    .line 50
    .line 51
    const/4 v0, 0x6

    .line 52
    sget-object v1, Lcom/p1/mobile/putong/data/CreativeType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 53
    .line 54
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 55
    .line 56
    .line 57
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CreativeOms;->skipPosition:Lcom/p1/mobile/putong/data/SkipPosition;

    .line 58
    .line 59
    if-eqz p0, :cond_5

    .line 60
    .line 61
    const/4 v0, 0x7

    .line 62
    sget-object v1, Lcom/p1/mobile/putong/data/SkipPosition;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 63
    .line 64
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 65
    .line 66
    .line 67
    :cond_5
    const/16 p0, 0x8

    .line 68
    .line 69
    iget p1, p1, Lcom/p1/mobile/putong/data/CreativeOms;->processMethod:I

    .line 70
    .line 71
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 72
    .line 73
    .line 74
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
    check-cast p1, Lcom/p1/mobile/putong/data/CreativeOms;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/CreativeOms$1;->serialize(Lcom/p1/mobile/putong/data/CreativeOms;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
