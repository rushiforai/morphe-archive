.class Lcom/p1/mobile/putong/data/OMSResourceContent$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/OMSResourceContent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/OMSResourceContent;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSResourceContent;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSResourceContent;->color:Ljava/lang/String;

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
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSResourceContent;->size:I

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSResourceContent;->value:Ljava/lang/String;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSResourceContent;->font:Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x4

    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSResourceContent;->bgColor:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x5

    .line 49
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    :cond_3
    const/4 v0, 0x6

    .line 55
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSResourceContent;->strikethrough:Z

    .line 56
    .line 57
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    const/4 v0, 0x7

    .line 63
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSResourceContent;->underline:Z

    .line 64
    .line 65
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSResourceContent;->url:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz v0, :cond_4

    .line 73
    .line 74
    const/16 v1, 0x8

    .line 75
    .line 76
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    add-int/2addr p0, v0

    .line 81
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSResourceContent;->font:Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 82
    .line 83
    if-eqz v0, :cond_5

    .line 84
    .line 85
    const/16 v1, 0x9

    .line 86
    .line 87
    sget-object v2, Lcom/p1/mobile/putong/data/OMSFontStyle;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 88
    .line 89
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    add-int/2addr p0, v0

    .line 94
    :cond_5
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 95
    .line 96
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 97
    check-cast p1, Lcom/p1/mobile/putong/data/OMSResourceContent;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSResourceContent$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSResourceContent;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSResourceContent;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OMSResourceContent;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OMSResourceContent;-><init>()V

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
    const-string v3, ""

    .line 13
    .line 14
    if-eqz v2, :cond_e

    .line 15
    .line 16
    const/16 v4, 0xa

    .line 17
    .line 18
    if-eq v2, v4, :cond_d

    .line 19
    .line 20
    const/16 v4, 0x10

    .line 21
    .line 22
    if-eq v2, v4, :cond_c

    .line 23
    .line 24
    const/16 v4, 0x1a

    .line 25
    .line 26
    if-eq v2, v4, :cond_b

    .line 27
    .line 28
    const/16 v4, 0x20

    .line 29
    .line 30
    if-eq v2, v4, :cond_a

    .line 31
    .line 32
    const/16 v4, 0x2a

    .line 33
    .line 34
    if-eq v2, v4, :cond_9

    .line 35
    .line 36
    const/16 v4, 0x30

    .line 37
    .line 38
    if-eq v2, v4, :cond_8

    .line 39
    .line 40
    const/16 v4, 0x38

    .line 41
    .line 42
    if-eq v2, v4, :cond_7

    .line 43
    .line 44
    const/16 v4, 0x42

    .line 45
    .line 46
    if-eq v2, v4, :cond_6

    .line 47
    .line 48
    const/16 v4, 0x4a

    .line 49
    .line 50
    if-eq v2, v4, :cond_5

    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->font:Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 53
    .line 54
    if-nez p1, :cond_0

    .line 55
    .line 56
    if-eqz v1, :cond_0

    .line 57
    .line 58
    sget-object p1, Lcom/p1/mobile/putong/data/OMSFontStyle;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 69
    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->font:Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 71
    .line 72
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->color:Ljava/lang/String;

    .line 73
    .line 74
    if-nez p1, :cond_1

    .line 75
    .line 76
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->color:Ljava/lang/String;

    .line 77
    .line 78
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->value:Ljava/lang/String;

    .line 79
    .line 80
    if-nez p1, :cond_2

    .line 81
    .line 82
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->value:Ljava/lang/String;

    .line 83
    .line 84
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->font:Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 85
    .line 86
    if-nez p1, :cond_3

    .line 87
    .line 88
    sget-object p1, Lcom/p1/mobile/putong/data/OMSFontStyle;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 89
    .line 90
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    check-cast p1, Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 95
    .line 96
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->font:Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 97
    .line 98
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->bgColor:Ljava/lang/String;

    .line 99
    .line 100
    if-nez p1, :cond_4

    .line 101
    .line 102
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->bgColor:Ljava/lang/String;

    .line 103
    .line 104
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->url:Ljava/lang/String;

    .line 105
    .line 106
    if-nez p1, :cond_14

    .line 107
    .line 108
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->url:Ljava/lang/String;

    .line 109
    .line 110
    return-object p0

    .line 111
    :cond_5
    sget-object v2, Lcom/p1/mobile/putong/data/OMSFontStyle;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 112
    .line 113
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    check-cast v2, Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 118
    .line 119
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->font:Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->url:Ljava/lang/String;

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->underline:Z

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->strikethrough:Z

    .line 141
    .line 142
    goto/16 :goto_0

    .line 143
    .line 144
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->bgColor:Ljava/lang/String;

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    goto/16 :goto_0

    .line 161
    .line 162
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->value:Ljava/lang/String;

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 171
    .line 172
    .line 173
    move-result v2

    .line 174
    iput v2, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->size:I

    .line 175
    .line 176
    goto/16 :goto_0

    .line 177
    .line 178
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->color:Ljava/lang/String;

    .line 183
    .line 184
    goto/16 :goto_0

    .line 185
    .line 186
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->font:Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 187
    .line 188
    if-nez p1, :cond_f

    .line 189
    .line 190
    if-eqz v1, :cond_f

    .line 191
    .line 192
    sget-object p1, Lcom/p1/mobile/putong/data/OMSFontStyle;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 193
    .line 194
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    check-cast p1, Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 203
    .line 204
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->font:Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 205
    .line 206
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->color:Ljava/lang/String;

    .line 207
    .line 208
    if-nez p1, :cond_10

    .line 209
    .line 210
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->color:Ljava/lang/String;

    .line 211
    .line 212
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->value:Ljava/lang/String;

    .line 213
    .line 214
    if-nez p1, :cond_11

    .line 215
    .line 216
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->value:Ljava/lang/String;

    .line 217
    .line 218
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->font:Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 219
    .line 220
    if-nez p1, :cond_12

    .line 221
    .line 222
    sget-object p1, Lcom/p1/mobile/putong/data/OMSFontStyle;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 223
    .line 224
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    check-cast p1, Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 229
    .line 230
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->font:Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 231
    .line 232
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->bgColor:Ljava/lang/String;

    .line 233
    .line 234
    if-nez p1, :cond_13

    .line 235
    .line 236
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->bgColor:Ljava/lang/String;

    .line 237
    .line 238
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->url:Ljava/lang/String;

    .line 239
    .line 240
    if-nez p1, :cond_14

    .line 241
    .line 242
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->url:Ljava/lang/String;

    .line 243
    .line 244
    :cond_14
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 245
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSResourceContent$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSResourceContent;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/OMSResourceContent;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSResourceContent;->color:Ljava/lang/String;

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
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSResourceContent;->size:I

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSResourceContent;->value:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSResourceContent;->font:Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x4

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSResourceContent;->bgColor:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    const/4 v0, 0x5

    .line 40
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_3
    const/4 p0, 0x6

    .line 44
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/OMSResourceContent;->strikethrough:Z

    .line 45
    .line 46
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x7

    .line 50
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/OMSResourceContent;->underline:Z

    .line 51
    .line 52
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSResourceContent;->url:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz p0, :cond_4

    .line 58
    .line 59
    const/16 v0, 0x8

    .line 60
    .line 61
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSResourceContent;->font:Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 65
    .line 66
    if-eqz p0, :cond_5

    .line 67
    .line 68
    const/16 p1, 0x9

    .line 69
    .line 70
    sget-object v0, Lcom/p1/mobile/putong/data/OMSFontStyle;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 71
    .line 72
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 73
    .line 74
    .line 75
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

    .line 76
    check-cast p1, Lcom/p1/mobile/putong/data/OMSResourceContent;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/OMSResourceContent$1;->serialize(Lcom/p1/mobile/putong/data/OMSResourceContent;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
