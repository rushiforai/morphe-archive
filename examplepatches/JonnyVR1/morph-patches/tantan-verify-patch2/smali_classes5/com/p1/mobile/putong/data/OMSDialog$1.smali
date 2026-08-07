.class Lcom/p1/mobile/putong/data/OMSDialog$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/OMSDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/OMSDialog;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSDialog;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    sget-object v2, Lcom/p1/mobile/putong/data/OMSBaseStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->content:Ljava/util/List;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    sget-object v1, Lcom/p1/mobile/putong/data/OMSResourceContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const/4 v2, 0x3

    .line 39
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->src:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x4

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->image:Ljava/lang/String;

    .line 55
    .line 56
    if-eqz v0, :cond_4

    .line 57
    .line 58
    const/4 v1, 0x5

    .line 59
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->bgImage:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz v0, :cond_5

    .line 67
    .line 68
    const/4 v1, 0x6

    .line 69
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->foreImage:Ljava/lang/String;

    .line 75
    .line 76
    if-eqz v0, :cond_6

    .line 77
    .line 78
    const/4 v1, 0x7

    .line 79
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    add-int/2addr p0, v0

    .line 84
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->child:Ljava/lang/String;

    .line 85
    .line 86
    if-eqz v0, :cond_7

    .line 87
    .line 88
    const/16 v1, 0x8

    .line 89
    .line 90
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    add-int/2addr p0, v0

    .line 95
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->nodes:Ljava/lang/String;

    .line 96
    .line 97
    if-eqz v0, :cond_8

    .line 98
    .line 99
    const/16 v1, 0x9

    .line 100
    .line 101
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    add-int/2addr p0, v0

    .line 106
    :cond_8
    const/16 v0, 0xa

    .line 107
    .line 108
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSDialog;->needApplyChild:Z

    .line 109
    .line 110
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    add-int/2addr p0, v0

    .line 115
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 116
    .line 117
    if-eqz v0, :cond_9

    .line 118
    .line 119
    const/16 v1, 0xb

    .line 120
    .line 121
    sget-object v2, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 122
    .line 123
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    add-int/2addr p0, v0

    .line 128
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 129
    .line 130
    if-eqz v0, :cond_a

    .line 131
    .line 132
    sget-object v1, Lcom/p1/mobile/putong/data/OMSAction;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 133
    .line 134
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    const/16 v2, 0xc

    .line 139
    .line 140
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    add-int/2addr p0, v0

    .line 145
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 146
    .line 147
    if-eqz v0, :cond_b

    .line 148
    .line 149
    const/16 v1, 0xd

    .line 150
    .line 151
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    add-int/2addr p0, v0

    .line 160
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->languageContent:Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 161
    .line 162
    if-eqz v0, :cond_c

    .line 163
    .line 164
    const/16 v1, 0xe

    .line 165
    .line 166
    sget-object v2, Lcom/p1/mobile/putong/data/OMSLanguageContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 167
    .line 168
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    add-int/2addr p0, v0

    .line 173
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->childJson:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 174
    .line 175
    if-eqz v0, :cond_d

    .line 176
    .line 177
    const/16 v1, 0xf

    .line 178
    .line 179
    sget-object v2, Lcom/p1/mobile/putong/data/OMSDialog;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 180
    .line 181
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    add-int/2addr p0, v0

    .line 186
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->nodesJson:Ljava/util/List;

    .line 187
    .line 188
    if-eqz v0, :cond_e

    .line 189
    .line 190
    sget-object v1, Lcom/p1/mobile/putong/data/OMSDialog;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 191
    .line 192
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    const/16 v2, 0x10

    .line 197
    .line 198
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    add-int/2addr p0, v0

    .line 203
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 204
    .line 205
    if-eqz v0, :cond_f

    .line 206
    .line 207
    const/16 v1, 0x11

    .line 208
    .line 209
    sget-object v2, Lcom/p1/mobile/putong/data/OMSTemplateModeType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 210
    .line 211
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    add-int/2addr p0, v0

    .line 216
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 217
    .line 218
    if-eqz v0, :cond_10

    .line 219
    .line 220
    const/16 v1, 0x12

    .line 221
    .line 222
    sget-object v2, Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 223
    .line 224
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    add-int/2addr p0, v0

    .line 229
    :cond_10
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 230
    .line 231
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 232
    check-cast p1, Lcom/p1/mobile/putong/data/OMSDialog;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSDialog$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSDialog;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSDialog;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OMSDialog;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OMSDialog;-><init>()V

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
    sparse-switch v3, :sswitch_data_0

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    sget-object p1, Lcom/p1/mobile/putong/data/OMSTemplateModeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 37
    .line 38
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 39
    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    sget-object p1, Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

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
    check-cast p1, Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    sget-object p1, Lcom/p1/mobile/putong/data/OMSTemplateModeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 69
    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 71
    .line 72
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 73
    .line 74
    if-nez p1, :cond_3

    .line 75
    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSBaseStyle;->new_()Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 81
    .line 82
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->content:Ljava/util/List;

    .line 83
    .line 84
    if-nez p1, :cond_4

    .line 85
    .line 86
    new-instance p1, Ljava/util/ArrayList;

    .line 87
    .line 88
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 89
    .line 90
    .line 91
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->content:Ljava/util/List;

    .line 92
    .line 93
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->src:Ljava/lang/String;

    .line 94
    .line 95
    if-nez p1, :cond_5

    .line 96
    .line 97
    iput-object v4, p0, Lcom/p1/mobile/putong/data/OMSDialog;->src:Ljava/lang/String;

    .line 98
    .line 99
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->image:Ljava/lang/String;

    .line 100
    .line 101
    if-nez p1, :cond_6

    .line 102
    .line 103
    iput-object v4, p0, Lcom/p1/mobile/putong/data/OMSDialog;->image:Ljava/lang/String;

    .line 104
    .line 105
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->bgImage:Ljava/lang/String;

    .line 106
    .line 107
    if-nez p1, :cond_7

    .line 108
    .line 109
    iput-object v4, p0, Lcom/p1/mobile/putong/data/OMSDialog;->bgImage:Ljava/lang/String;

    .line 110
    .line 111
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->foreImage:Ljava/lang/String;

    .line 112
    .line 113
    if-nez p1, :cond_8

    .line 114
    .line 115
    iput-object v4, p0, Lcom/p1/mobile/putong/data/OMSDialog;->foreImage:Ljava/lang/String;

    .line 116
    .line 117
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->child:Ljava/lang/String;

    .line 118
    .line 119
    if-nez p1, :cond_9

    .line 120
    .line 121
    iput-object v4, p0, Lcom/p1/mobile/putong/data/OMSDialog;->child:Ljava/lang/String;

    .line 122
    .line 123
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->nodes:Ljava/lang/String;

    .line 124
    .line 125
    if-nez p1, :cond_a

    .line 126
    .line 127
    iput-object v4, p0, Lcom/p1/mobile/putong/data/OMSDialog;->nodes:Ljava/lang/String;

    .line 128
    .line 129
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 130
    .line 131
    if-nez p1, :cond_b

    .line 132
    .line 133
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->new_()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 138
    .line 139
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 140
    .line 141
    if-nez p1, :cond_c

    .line 142
    .line 143
    new-instance p1, Ljava/util/ArrayList;

    .line 144
    .line 145
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 146
    .line 147
    .line 148
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 149
    .line 150
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 151
    .line 152
    if-nez p1, :cond_d

    .line 153
    .line 154
    sget-object p1, Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 155
    .line 156
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    check-cast p1, Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 161
    .line 162
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 163
    .line 164
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->languageContent:Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 165
    .line 166
    if-nez p1, :cond_1c

    .line 167
    .line 168
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSLanguageContent;->new_()Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->languageContent:Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 173
    .line 174
    return-object p0

    .line 175
    :sswitch_0
    sget-object v3, Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 176
    .line 177
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v3

    .line 181
    check-cast v3, Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 182
    .line 183
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSDialog;->baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 184
    .line 185
    goto/16 :goto_0

    .line 186
    .line 187
    :sswitch_1
    sget-object v3, Lcom/p1/mobile/putong/data/OMSTemplateModeType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 188
    .line 189
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    check-cast v3, Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 194
    .line 195
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 196
    .line 197
    goto/16 :goto_0

    .line 198
    .line 199
    :sswitch_2
    sget-object v3, Lcom/p1/mobile/putong/data/OMSDialog;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 200
    .line 201
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    check-cast v3, Ljava/util/List;

    .line 210
    .line 211
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSDialog;->nodesJson:Ljava/util/List;

    .line 212
    .line 213
    goto/16 :goto_0

    .line 214
    .line 215
    :sswitch_3
    sget-object v3, Lcom/p1/mobile/putong/data/OMSDialog;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 216
    .line 217
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object v3

    .line 221
    check-cast v3, Lcom/p1/mobile/putong/data/OMSDialog;

    .line 222
    .line 223
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSDialog;->childJson:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 224
    .line 225
    goto/16 :goto_0

    .line 226
    .line 227
    :sswitch_4
    sget-object v3, Lcom/p1/mobile/putong/data/OMSLanguageContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 228
    .line 229
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object v3

    .line 233
    check-cast v3, Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 234
    .line 235
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSDialog;->languageContent:Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 236
    .line 237
    goto/16 :goto_0

    .line 238
    .line 239
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 240
    .line 241
    .line 242
    move-result v2

    .line 243
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 244
    .line 245
    .line 246
    move-result-object v2

    .line 247
    goto/16 :goto_0

    .line 248
    .line 249
    :sswitch_6
    sget-object v3, Lcom/p1/mobile/putong/data/OMSAction;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 250
    .line 251
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 252
    .line 253
    .line 254
    move-result-object v3

    .line 255
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object v3

    .line 259
    check-cast v3, Ljava/util/List;

    .line 260
    .line 261
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 262
    .line 263
    goto/16 :goto_0

    .line 264
    .line 265
    :sswitch_7
    sget-object v3, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 266
    .line 267
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object v3

    .line 271
    check-cast v3, Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 272
    .line 273
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSDialog;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 274
    .line 275
    goto/16 :goto_0

    .line 276
    .line 277
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 278
    .line 279
    .line 280
    move-result v3

    .line 281
    iput-boolean v3, p0, Lcom/p1/mobile/putong/data/OMSDialog;->needApplyChild:Z

    .line 282
    .line 283
    goto/16 :goto_0

    .line 284
    .line 285
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v3

    .line 289
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSDialog;->nodes:Ljava/lang/String;

    .line 290
    .line 291
    goto/16 :goto_0

    .line 292
    .line 293
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v3

    .line 297
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSDialog;->child:Ljava/lang/String;

    .line 298
    .line 299
    goto/16 :goto_0

    .line 300
    .line 301
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v3

    .line 305
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSDialog;->foreImage:Ljava/lang/String;

    .line 306
    .line 307
    goto/16 :goto_0

    .line 308
    .line 309
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object v3

    .line 313
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSDialog;->bgImage:Ljava/lang/String;

    .line 314
    .line 315
    goto/16 :goto_0

    .line 316
    .line 317
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object v3

    .line 321
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSDialog;->image:Ljava/lang/String;

    .line 322
    .line 323
    goto/16 :goto_0

    .line 324
    .line 325
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object v3

    .line 329
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSDialog;->src:Ljava/lang/String;

    .line 330
    .line 331
    goto/16 :goto_0

    .line 332
    .line 333
    :sswitch_f
    sget-object v3, Lcom/p1/mobile/putong/data/OMSResourceContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 334
    .line 335
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 336
    .line 337
    .line 338
    move-result-object v3

    .line 339
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 340
    .line 341
    .line 342
    move-result-object v3

    .line 343
    check-cast v3, Ljava/util/List;

    .line 344
    .line 345
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSDialog;->content:Ljava/util/List;

    .line 346
    .line 347
    goto/16 :goto_0

    .line 348
    .line 349
    :sswitch_10
    sget-object v3, Lcom/p1/mobile/putong/data/OMSBaseStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 350
    .line 351
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 352
    .line 353
    .line 354
    move-result-object v3

    .line 355
    check-cast v3, Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 356
    .line 357
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 358
    .line 359
    goto/16 :goto_0

    .line 360
    .line 361
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 362
    .line 363
    .line 364
    move-result v1

    .line 365
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 366
    .line 367
    .line 368
    move-result-object v1

    .line 369
    goto/16 :goto_0

    .line 370
    .line 371
    :sswitch_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 372
    .line 373
    if-nez p1, :cond_e

    .line 374
    .line 375
    if-eqz v1, :cond_e

    .line 376
    .line 377
    sget-object p1, Lcom/p1/mobile/putong/data/OMSTemplateModeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 378
    .line 379
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 380
    .line 381
    .line 382
    move-result v1

    .line 383
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 384
    .line 385
    .line 386
    move-result-object p1

    .line 387
    check-cast p1, Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 388
    .line 389
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 390
    .line 391
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 392
    .line 393
    if-nez p1, :cond_f

    .line 394
    .line 395
    if-eqz v2, :cond_f

    .line 396
    .line 397
    sget-object p1, Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 398
    .line 399
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 400
    .line 401
    .line 402
    move-result v1

    .line 403
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 404
    .line 405
    .line 406
    move-result-object p1

    .line 407
    check-cast p1, Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 408
    .line 409
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 410
    .line 411
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 412
    .line 413
    if-nez p1, :cond_10

    .line 414
    .line 415
    sget-object p1, Lcom/p1/mobile/putong/data/OMSTemplateModeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 416
    .line 417
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 418
    .line 419
    .line 420
    move-result-object p1

    .line 421
    check-cast p1, Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 422
    .line 423
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 424
    .line 425
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 426
    .line 427
    if-nez p1, :cond_11

    .line 428
    .line 429
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSBaseStyle;->new_()Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 430
    .line 431
    .line 432
    move-result-object p1

    .line 433
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 434
    .line 435
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->content:Ljava/util/List;

    .line 436
    .line 437
    if-nez p1, :cond_12

    .line 438
    .line 439
    new-instance p1, Ljava/util/ArrayList;

    .line 440
    .line 441
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 442
    .line 443
    .line 444
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->content:Ljava/util/List;

    .line 445
    .line 446
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->src:Ljava/lang/String;

    .line 447
    .line 448
    if-nez p1, :cond_13

    .line 449
    .line 450
    iput-object v4, p0, Lcom/p1/mobile/putong/data/OMSDialog;->src:Ljava/lang/String;

    .line 451
    .line 452
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->image:Ljava/lang/String;

    .line 453
    .line 454
    if-nez p1, :cond_14

    .line 455
    .line 456
    iput-object v4, p0, Lcom/p1/mobile/putong/data/OMSDialog;->image:Ljava/lang/String;

    .line 457
    .line 458
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->bgImage:Ljava/lang/String;

    .line 459
    .line 460
    if-nez p1, :cond_15

    .line 461
    .line 462
    iput-object v4, p0, Lcom/p1/mobile/putong/data/OMSDialog;->bgImage:Ljava/lang/String;

    .line 463
    .line 464
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->foreImage:Ljava/lang/String;

    .line 465
    .line 466
    if-nez p1, :cond_16

    .line 467
    .line 468
    iput-object v4, p0, Lcom/p1/mobile/putong/data/OMSDialog;->foreImage:Ljava/lang/String;

    .line 469
    .line 470
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->child:Ljava/lang/String;

    .line 471
    .line 472
    if-nez p1, :cond_17

    .line 473
    .line 474
    iput-object v4, p0, Lcom/p1/mobile/putong/data/OMSDialog;->child:Ljava/lang/String;

    .line 475
    .line 476
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->nodes:Ljava/lang/String;

    .line 477
    .line 478
    if-nez p1, :cond_18

    .line 479
    .line 480
    iput-object v4, p0, Lcom/p1/mobile/putong/data/OMSDialog;->nodes:Ljava/lang/String;

    .line 481
    .line 482
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 483
    .line 484
    if-nez p1, :cond_19

    .line 485
    .line 486
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->new_()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 487
    .line 488
    .line 489
    move-result-object p1

    .line 490
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 491
    .line 492
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 493
    .line 494
    if-nez p1, :cond_1a

    .line 495
    .line 496
    new-instance p1, Ljava/util/ArrayList;

    .line 497
    .line 498
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 499
    .line 500
    .line 501
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 502
    .line 503
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 504
    .line 505
    if-nez p1, :cond_1b

    .line 506
    .line 507
    sget-object p1, Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 508
    .line 509
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 510
    .line 511
    .line 512
    move-result-object p1

    .line 513
    check-cast p1, Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 514
    .line 515
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 516
    .line 517
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->languageContent:Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 518
    .line 519
    if-nez p1, :cond_1c

    .line 520
    .line 521
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSLanguageContent;->new_()Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 522
    .line 523
    .line 524
    move-result-object p1

    .line 525
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->languageContent:Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 526
    .line 527
    :cond_1c
    return-object p0

    .line 528
    nop

    .line 529
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_12
        0x8 -> :sswitch_11
        0x12 -> :sswitch_10
        0x1a -> :sswitch_f
        0x22 -> :sswitch_e
        0x2a -> :sswitch_d
        0x32 -> :sswitch_c
        0x3a -> :sswitch_b
        0x42 -> :sswitch_a
        0x4a -> :sswitch_9
        0x50 -> :sswitch_8
        0x5a -> :sswitch_7
        0x62 -> :sswitch_6
        0x68 -> :sswitch_5
        0x72 -> :sswitch_4
        0x7a -> :sswitch_3
        0x82 -> :sswitch_2
        0x8a -> :sswitch_1
        0x92 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 529
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSDialog$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSDialog;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/OMSDialog;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    sget-object v1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 19
    .line 20
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->content:Ljava/util/List;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/data/OMSResourceContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v1, 0x3

    .line 34
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->src:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    const/4 v0, 0x4

    .line 42
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->image:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const/4 v0, 0x5

    .line 50
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->bgImage:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz p0, :cond_5

    .line 56
    .line 57
    const/4 v0, 0x6

    .line 58
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->foreImage:Ljava/lang/String;

    .line 62
    .line 63
    if-eqz p0, :cond_6

    .line 64
    .line 65
    const/4 v0, 0x7

    .line 66
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->child:Ljava/lang/String;

    .line 70
    .line 71
    if-eqz p0, :cond_7

    .line 72
    .line 73
    const/16 v0, 0x8

    .line 74
    .line 75
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->nodes:Ljava/lang/String;

    .line 79
    .line 80
    if-eqz p0, :cond_8

    .line 81
    .line 82
    const/16 v0, 0x9

    .line 83
    .line 84
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :cond_8
    const/16 p0, 0xa

    .line 88
    .line 89
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->needApplyChild:Z

    .line 90
    .line 91
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 92
    .line 93
    .line 94
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 95
    .line 96
    if-eqz p0, :cond_9

    .line 97
    .line 98
    const/16 v0, 0xb

    .line 99
    .line 100
    sget-object v1, Lcom/p1/mobile/putong/data/OmsMerCuryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 101
    .line 102
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 103
    .line 104
    .line 105
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 106
    .line 107
    if-eqz p0, :cond_a

    .line 108
    .line 109
    sget-object v0, Lcom/p1/mobile/putong/data/OMSAction;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 110
    .line 111
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    const/16 v1, 0xc

    .line 116
    .line 117
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 118
    .line 119
    .line 120
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 121
    .line 122
    if-eqz p0, :cond_b

    .line 123
    .line 124
    const/16 v0, 0xd

    .line 125
    .line 126
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 131
    .line 132
    .line 133
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->languageContent:Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 134
    .line 135
    if-eqz p0, :cond_c

    .line 136
    .line 137
    const/16 v0, 0xe

    .line 138
    .line 139
    sget-object v1, Lcom/p1/mobile/putong/data/OMSLanguageContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 140
    .line 141
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 142
    .line 143
    .line 144
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->childJson:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 145
    .line 146
    if-eqz p0, :cond_d

    .line 147
    .line 148
    const/16 v0, 0xf

    .line 149
    .line 150
    sget-object v1, Lcom/p1/mobile/putong/data/OMSDialog;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 151
    .line 152
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 153
    .line 154
    .line 155
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->nodesJson:Ljava/util/List;

    .line 156
    .line 157
    if-eqz p0, :cond_e

    .line 158
    .line 159
    sget-object v0, Lcom/p1/mobile/putong/data/OMSDialog;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 160
    .line 161
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    const/16 v1, 0x10

    .line 166
    .line 167
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 168
    .line 169
    .line 170
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 171
    .line 172
    if-eqz p0, :cond_f

    .line 173
    .line 174
    const/16 v0, 0x11

    .line 175
    .line 176
    sget-object v1, Lcom/p1/mobile/putong/data/OMSTemplateModeType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 177
    .line 178
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 179
    .line 180
    .line 181
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 182
    .line 183
    if-eqz p0, :cond_10

    .line 184
    .line 185
    const/16 p1, 0x12

    .line 186
    .line 187
    sget-object v0, Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 188
    .line 189
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 190
    .line 191
    .line 192
    :cond_10
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 193
    check-cast p1, Lcom/p1/mobile/putong/data/OMSDialog;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/OMSDialog$1;->serialize(Lcom/p1/mobile/putong/data/OMSDialog;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
