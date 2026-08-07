.class Lcom/p1/mobile/putong/core/data/Question$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Question;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/Question;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Question;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Question;->answers:Ljava/util/List;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    sget-object v1, Lcom/p1/mobile/putong/data/Answer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const/16 v2, 0x33

    .line 29
    .line 30
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    add-int/2addr p0, v0

    .line 35
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    const/16 v1, 0x34

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    const/16 v1, 0x35

    .line 55
    .line 56
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    add-int/2addr p0, v0

    .line 61
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Question;->title:Ljava/lang/String;

    .line 62
    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    const/16 v1, 0x36

    .line 66
    .line 67
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 73
    .line 74
    if-eqz v0, :cond_5

    .line 75
    .line 76
    const/16 v1, 0x37

    .line 77
    .line 78
    sget-object v2, Lcom/p1/mobile/putong/core/data/QuestionEditable;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 79
    .line 80
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    add-int/2addr p0, v0

    .line 85
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 86
    .line 87
    if-eqz v0, :cond_6

    .line 88
    .line 89
    const/16 v1, 0x38

    .line 90
    .line 91
    sget-object v2, Lcom/p1/mobile/putong/core/data/QuestionCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 92
    .line 93
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    add-int/2addr p0, v0

    .line 98
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Question;->source:Ljava/lang/String;

    .line 99
    .line 100
    if-eqz v0, :cond_7

    .line 101
    .line 102
    const/16 v1, 0x39

    .line 103
    .line 104
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    add-int/2addr p0, v0

    .line 109
    :cond_7
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 110
    .line 111
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 112
    check-cast p1, Lcom/p1/mobile/putong/core/data/Question;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Question$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Question;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Question;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/Question;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/Question;-><init>()V

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
    const/16 v4, 0x8

    .line 17
    .line 18
    if-eq v2, v4, :cond_d

    .line 19
    .line 20
    const/16 v4, 0x12

    .line 21
    .line 22
    if-eq v2, v4, :cond_c

    .line 23
    .line 24
    const/16 v4, 0x19a

    .line 25
    .line 26
    if-eq v2, v4, :cond_b

    .line 27
    .line 28
    const/16 v4, 0x1a0

    .line 29
    .line 30
    if-eq v2, v4, :cond_a

    .line 31
    .line 32
    const/16 v4, 0x1aa

    .line 33
    .line 34
    if-eq v2, v4, :cond_9

    .line 35
    .line 36
    const/16 v4, 0x1b2

    .line 37
    .line 38
    if-eq v2, v4, :cond_8

    .line 39
    .line 40
    const/16 v4, 0x1ba

    .line 41
    .line 42
    if-eq v2, v4, :cond_7

    .line 43
    .line 44
    const/16 v4, 0x1c2

    .line 45
    .line 46
    if-eq v2, v4, :cond_6

    .line 47
    .line 48
    const/16 v4, 0x1ca

    .line 49
    .line 50
    if-eq v2, v4, :cond_5

    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 53
    .line 54
    if-nez p1, :cond_0

    .line 55
    .line 56
    if-eqz v1, :cond_0

    .line 57
    .line 58
    sget-object p1, Lcom/p1/mobile/putong/core/data/QuestionCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 69
    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 71
    .line 72
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 73
    .line 74
    if-nez p1, :cond_1

    .line 75
    .line 76
    sget-object p1, Lcom/p1/mobile/putong/core/data/QuestionCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    check-cast p1, Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 83
    .line 84
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 85
    .line 86
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 87
    .line 88
    if-nez p1, :cond_2

    .line 89
    .line 90
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 91
    .line 92
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->title:Ljava/lang/String;

    .line 93
    .line 94
    if-nez p1, :cond_3

    .line 95
    .line 96
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/Question;->title:Ljava/lang/String;

    .line 97
    .line 98
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 99
    .line 100
    if-nez p1, :cond_4

    .line 101
    .line 102
    invoke-static {}, Lcom/p1/mobile/putong/core/data/QuestionEditable;->new_()Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 107
    .line 108
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->source:Ljava/lang/String;

    .line 109
    .line 110
    if-nez p1, :cond_14

    .line 111
    .line 112
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/Question;->source:Ljava/lang/String;

    .line 113
    .line 114
    return-object p0

    .line 115
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/Question;->source:Ljava/lang/String;

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_6
    sget-object v2, Lcom/p1/mobile/putong/core/data/QuestionCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 123
    .line 124
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    check-cast v2, Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 129
    .line 130
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_7
    sget-object v2, Lcom/p1/mobile/putong/core/data/QuestionEditable;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 134
    .line 135
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    check-cast v2, Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 140
    .line 141
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 142
    .line 143
    goto/16 :goto_0

    .line 144
    .line 145
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/Question;->title:Ljava/lang/String;

    .line 150
    .line 151
    goto/16 :goto_0

    .line 152
    .line 153
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    goto/16 :goto_0

    .line 170
    .line 171
    :cond_b
    sget-object v2, Lcom/p1/mobile/putong/data/Answer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 172
    .line 173
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 174
    .line 175
    .line 176
    move-result-object v2

    .line 177
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    check-cast v2, Ljava/util/List;

    .line 182
    .line 183
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/Question;->answers:Ljava/util/List;

    .line 184
    .line 185
    goto/16 :goto_0

    .line 186
    .line 187
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    iput-object v2, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 192
    .line 193
    goto/16 :goto_0

    .line 194
    .line 195
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 196
    .line 197
    .line 198
    move-result-wide v2

    .line 199
    iput-wide v2, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 200
    .line 201
    goto/16 :goto_0

    .line 202
    .line 203
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 204
    .line 205
    if-nez p1, :cond_f

    .line 206
    .line 207
    if-eqz v1, :cond_f

    .line 208
    .line 209
    sget-object p1, Lcom/p1/mobile/putong/core/data/QuestionCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 210
    .line 211
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    check-cast p1, Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 220
    .line 221
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 222
    .line 223
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 224
    .line 225
    if-nez p1, :cond_10

    .line 226
    .line 227
    sget-object p1, Lcom/p1/mobile/putong/core/data/QuestionCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 228
    .line 229
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    check-cast p1, Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 234
    .line 235
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 236
    .line 237
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 238
    .line 239
    if-nez p1, :cond_11

    .line 240
    .line 241
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 242
    .line 243
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->title:Ljava/lang/String;

    .line 244
    .line 245
    if-nez p1, :cond_12

    .line 246
    .line 247
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/Question;->title:Ljava/lang/String;

    .line 248
    .line 249
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 250
    .line 251
    if-nez p1, :cond_13

    .line 252
    .line 253
    invoke-static {}, Lcom/p1/mobile/putong/core/data/QuestionEditable;->new_()Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 258
    .line 259
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->source:Ljava/lang/String;

    .line 260
    .line 261
    if-nez p1, :cond_14

    .line 262
    .line 263
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/Question;->source:Ljava/lang/String;

    .line 264
    .line 265
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

    .line 266
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Question$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Question;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/Question;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Question;->answers:Ljava/util/List;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/data/Answer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/16 v1, 0x33

    .line 26
    .line 27
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 31
    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    const/16 v0, 0x34

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 41
    .line 42
    .line 43
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 44
    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    const/16 v0, 0x35

    .line 48
    .line 49
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Question;->title:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz p0, :cond_4

    .line 55
    .line 56
    const/16 v0, 0x36

    .line 57
    .line 58
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 62
    .line 63
    if-eqz p0, :cond_5

    .line 64
    .line 65
    const/16 v0, 0x37

    .line 66
    .line 67
    sget-object v1, Lcom/p1/mobile/putong/core/data/QuestionEditable;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 68
    .line 69
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 70
    .line 71
    .line 72
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 73
    .line 74
    if-eqz p0, :cond_6

    .line 75
    .line 76
    const/16 v0, 0x38

    .line 77
    .line 78
    sget-object v1, Lcom/p1/mobile/putong/core/data/QuestionCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 79
    .line 80
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 81
    .line 82
    .line 83
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Question;->source:Ljava/lang/String;

    .line 84
    .line 85
    if-eqz p0, :cond_7

    .line 86
    .line 87
    const/16 p1, 0x39

    .line 88
    .line 89
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 90
    .line 91
    .line 92
    :cond_7
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 93
    check-cast p1, Lcom/p1/mobile/putong/core/data/Question;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Question$1;->serialize(Lcom/p1/mobile/putong/core/data/Question;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
