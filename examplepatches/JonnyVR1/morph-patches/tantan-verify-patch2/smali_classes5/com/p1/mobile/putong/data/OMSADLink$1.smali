.class Lcom/p1/mobile/putong/data/OMSADLink$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/OMSADLink;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/OMSADLink;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSADLink;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSADLink;->url:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSADLink;->fallbackLink:Lcom/p1/mobile/putong/data/OMSFallbackLink;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/data/OMSFallbackLink;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSADLink;->deeplinkReport:Lcom/p1/mobile/putong/data/DeeplinkReport;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x4

    .line 43
    sget-object v2, Lcom/p1/mobile/putong/data/DeeplinkReport;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x5

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/data/LinkAction;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSADLink;->path:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    const/4 v1, 0x6

    .line 67
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSADLink;->originalId:Ljava/lang/String;

    .line 73
    .line 74
    if-eqz v0, :cond_6

    .line 75
    .line 76
    const/4 v1, 0x7

    .line 77
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    add-int/2addr p0, v0

    .line 82
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSADLink;->appID:Ljava/lang/String;

    .line 83
    .line 84
    if-eqz v0, :cond_7

    .line 85
    .line 86
    const/16 v1, 0x8

    .line 87
    .line 88
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    add-int/2addr p0, v0

    .line 93
    :cond_7
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 94
    .line 95
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 96
    check-cast p1, Lcom/p1/mobile/putong/data/OMSADLink;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSADLink$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSADLink;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSADLink;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OMSADLink;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OMSADLink;-><init>()V

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
    const/16 v4, 0x1a

    .line 25
    .line 26
    if-eq v2, v4, :cond_b

    .line 27
    .line 28
    const/16 v4, 0x22

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
    const/16 v4, 0x32

    .line 37
    .line 38
    if-eq v2, v4, :cond_8

    .line 39
    .line 40
    const/16 v4, 0x3a

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 49
    .line 50
    if-nez p1, :cond_0

    .line 51
    .line 52
    if-eqz v1, :cond_0

    .line 53
    .line 54
    sget-object p1, Lcom/p1/mobile/putong/data/LinkAction;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Lcom/p1/mobile/putong/data/LinkAction;

    .line 65
    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 67
    .line 68
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 69
    .line 70
    if-nez p1, :cond_1

    .line 71
    .line 72
    sget-object p1, Lcom/p1/mobile/putong/data/LinkAction;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    check-cast p1, Lcom/p1/mobile/putong/data/LinkAction;

    .line 79
    .line 80
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 81
    .line 82
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSADLink;->url:Ljava/lang/String;

    .line 83
    .line 84
    if-nez p1, :cond_2

    .line 85
    .line 86
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSADLink;->url:Ljava/lang/String;

    .line 87
    .line 88
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSADLink;->deeplinkReport:Lcom/p1/mobile/putong/data/DeeplinkReport;

    .line 89
    .line 90
    if-nez p1, :cond_3

    .line 91
    .line 92
    invoke-static {}, Lcom/p1/mobile/putong/data/DeeplinkReport;->new_()Lcom/p1/mobile/putong/data/DeeplinkReport;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSADLink;->deeplinkReport:Lcom/p1/mobile/putong/data/DeeplinkReport;

    .line 97
    .line 98
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSADLink;->path:Ljava/lang/String;

    .line 99
    .line 100
    if-nez p1, :cond_4

    .line 101
    .line 102
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSADLink;->path:Ljava/lang/String;

    .line 103
    .line 104
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSADLink;->originalId:Ljava/lang/String;

    .line 105
    .line 106
    if-nez p1, :cond_5

    .line 107
    .line 108
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSADLink;->originalId:Ljava/lang/String;

    .line 109
    .line 110
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSADLink;->appID:Ljava/lang/String;

    .line 111
    .line 112
    if-nez p1, :cond_15

    .line 113
    .line 114
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSADLink;->appID:Ljava/lang/String;

    .line 115
    .line 116
    return-object p0

    .line 117
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSADLink;->appID:Ljava/lang/String;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSADLink;->originalId:Ljava/lang/String;

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSADLink;->path:Ljava/lang/String;

    .line 136
    .line 137
    goto/16 :goto_0

    .line 138
    .line 139
    :cond_9
    sget-object v2, Lcom/p1/mobile/putong/data/LinkAction;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 140
    .line 141
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    check-cast v2, Lcom/p1/mobile/putong/data/LinkAction;

    .line 146
    .line 147
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 148
    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :cond_a
    sget-object v2, Lcom/p1/mobile/putong/data/DeeplinkReport;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 152
    .line 153
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    check-cast v2, Lcom/p1/mobile/putong/data/DeeplinkReport;

    .line 158
    .line 159
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSADLink;->deeplinkReport:Lcom/p1/mobile/putong/data/DeeplinkReport;

    .line 160
    .line 161
    goto/16 :goto_0

    .line 162
    .line 163
    :cond_b
    sget-object v2, Lcom/p1/mobile/putong/data/OMSFallbackLink;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 164
    .line 165
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    check-cast v2, Lcom/p1/mobile/putong/data/OMSFallbackLink;

    .line 170
    .line 171
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSADLink;->fallbackLink:Lcom/p1/mobile/putong/data/OMSFallbackLink;

    .line 172
    .line 173
    goto/16 :goto_0

    .line 174
    .line 175
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSADLink;->url:Ljava/lang/String;

    .line 180
    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    goto/16 :goto_0

    .line 192
    .line 193
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 194
    .line 195
    if-nez p1, :cond_f

    .line 196
    .line 197
    if-eqz v1, :cond_f

    .line 198
    .line 199
    sget-object p1, Lcom/p1/mobile/putong/data/LinkAction;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 200
    .line 201
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    check-cast p1, Lcom/p1/mobile/putong/data/LinkAction;

    .line 210
    .line 211
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 212
    .line 213
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 214
    .line 215
    if-nez p1, :cond_10

    .line 216
    .line 217
    sget-object p1, Lcom/p1/mobile/putong/data/LinkAction;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 218
    .line 219
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    check-cast p1, Lcom/p1/mobile/putong/data/LinkAction;

    .line 224
    .line 225
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 226
    .line 227
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSADLink;->url:Ljava/lang/String;

    .line 228
    .line 229
    if-nez p1, :cond_11

    .line 230
    .line 231
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSADLink;->url:Ljava/lang/String;

    .line 232
    .line 233
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSADLink;->deeplinkReport:Lcom/p1/mobile/putong/data/DeeplinkReport;

    .line 234
    .line 235
    if-nez p1, :cond_12

    .line 236
    .line 237
    invoke-static {}, Lcom/p1/mobile/putong/data/DeeplinkReport;->new_()Lcom/p1/mobile/putong/data/DeeplinkReport;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSADLink;->deeplinkReport:Lcom/p1/mobile/putong/data/DeeplinkReport;

    .line 242
    .line 243
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSADLink;->path:Ljava/lang/String;

    .line 244
    .line 245
    if-nez p1, :cond_13

    .line 246
    .line 247
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSADLink;->path:Ljava/lang/String;

    .line 248
    .line 249
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSADLink;->originalId:Ljava/lang/String;

    .line 250
    .line 251
    if-nez p1, :cond_14

    .line 252
    .line 253
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSADLink;->originalId:Ljava/lang/String;

    .line 254
    .line 255
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSADLink;->appID:Ljava/lang/String;

    .line 256
    .line 257
    if-nez p1, :cond_15

    .line 258
    .line 259
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSADLink;->appID:Ljava/lang/String;

    .line 260
    .line 261
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

    .line 262
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSADLink$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSADLink;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/OMSADLink;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSADLink;->url:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSADLink;->fallbackLink:Lcom/p1/mobile/putong/data/OMSFallbackLink;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/data/OMSFallbackLink;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSADLink;->deeplinkReport:Lcom/p1/mobile/putong/data/DeeplinkReport;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/data/DeeplinkReport;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 37
    .line 38
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 42
    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    const/4 v0, 0x5

    .line 46
    sget-object v1, Lcom/p1/mobile/putong/data/LinkAction;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 47
    .line 48
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 49
    .line 50
    .line 51
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSADLink;->path:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz p0, :cond_5

    .line 54
    .line 55
    const/4 v0, 0x6

    .line 56
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSADLink;->originalId:Ljava/lang/String;

    .line 60
    .line 61
    if-eqz p0, :cond_6

    .line 62
    .line 63
    const/4 v0, 0x7

    .line 64
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSADLink;->appID:Ljava/lang/String;

    .line 68
    .line 69
    if-eqz p0, :cond_7

    .line 70
    .line 71
    const/16 p1, 0x8

    .line 72
    .line 73
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 74
    .line 75
    .line 76
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

    .line 77
    check-cast p1, Lcom/p1/mobile/putong/data/OMSADLink;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/OMSADLink$1;->serialize(Lcom/p1/mobile/putong/data/OMSADLink;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
