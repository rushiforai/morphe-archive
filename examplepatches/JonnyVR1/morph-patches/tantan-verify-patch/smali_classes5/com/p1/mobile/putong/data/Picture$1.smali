.class Lcom/p1/mobile/putong/data/Picture$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Picture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/Picture;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/Picture;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->urlKey:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->name:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 47
    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    const/4 v1, 0x5

    .line 51
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 57
    .line 58
    if-eqz v0, :cond_5

    .line 59
    .line 60
    const/4 v1, 0x6

    .line 61
    sget-object v2, Lcom/p1/mobile/putong/data/MediaMeta;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz v0, :cond_6

    .line 71
    .line 72
    const/4 v1, 0x7

    .line 73
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    add-int/2addr p0, v0

    .line 78
    :cond_6
    const/16 v0, 0x9

    .line 79
    .line 80
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/Media;->isPortrait:Z

    .line 81
    .line 82
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    add-int/2addr p0, v0

    .line 87
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 88
    .line 89
    if-eqz v0, :cond_7

    .line 90
    .line 91
    sget-object v1, Lcom/p1/mobile/putong/data/MediaLabel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 92
    .line 93
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    const/16 v2, 0xa

    .line 98
    .line 99
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    add-int/2addr p0, v0

    .line 104
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 105
    .line 106
    if-eqz v0, :cond_8

    .line 107
    .line 108
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 109
    .line 110
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    const/16 v2, 0xb

    .line 115
    .line 116
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    add-int/2addr p0, v0

    .line 121
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->tagIdealInfo:Ljava/util/List;

    .line 122
    .line 123
    if-eqz v0, :cond_9

    .line 124
    .line 125
    sget-object v1, Lcom/p1/mobile/putong/data/IdealTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 126
    .line 127
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    const/16 v2, 0xc

    .line 132
    .line 133
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    add-int/2addr p0, v0

    .line 138
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 139
    .line 140
    if-eqz v0, :cond_a

    .line 141
    .line 142
    const/16 v1, 0x33

    .line 143
    .line 144
    sget-object v2, Lcom/p1/mobile/putong/data/Dimension;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 145
    .line 146
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    add-int/2addr p0, v0

    .line 151
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Picture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 152
    .line 153
    if-eqz v0, :cond_b

    .line 154
    .line 155
    const/16 v1, 0x34

    .line 156
    .line 157
    sget-object v2, Lcom/p1/mobile/putong/data/AIPosition;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 158
    .line 159
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    add-int/2addr p0, v0

    .line 164
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 165
    .line 166
    if-eqz v0, :cond_c

    .line 167
    .line 168
    sget-object v1, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 169
    .line 170
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    const/16 v2, 0x35

    .line 175
    .line 176
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    add-int/2addr p0, v0

    .line 181
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Picture;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 182
    .line 183
    if-eqz v0, :cond_d

    .line 184
    .line 185
    const/16 v1, 0x36

    .line 186
    .line 187
    sget-object v2, Lcom/p1/mobile/putong/data/GaussianBlurParameters;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 188
    .line 189
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    add-int/2addr p0, v0

    .line 194
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 195
    .line 196
    if-eqz v0, :cond_e

    .line 197
    .line 198
    const/16 v1, 0x37

    .line 199
    .line 200
    sget-object v2, Lcom/p1/mobile/putong/data/MediaLocalStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 201
    .line 202
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    add-int/2addr p0, v0

    .line 207
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Picture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 208
    .line 209
    if-eqz v0, :cond_f

    .line 210
    .line 211
    const/16 v1, 0x38

    .line 212
    .line 213
    sget-object v2, Lcom/p1/mobile/putong/data/LivePhoto;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 214
    .line 215
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 216
    .line 217
    .line 218
    move-result v0

    .line 219
    add-int/2addr p0, v0

    .line 220
    :cond_f
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 221
    .line 222
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 223
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Picture$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/Picture;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Picture;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

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
    sparse-switch v2, :sswitch_data_0

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/data/MediaLocalStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    sget-object p1, Lcom/p1/mobile/putong/data/MediaLocalStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 48
    .line 49
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 50
    .line 51
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 52
    .line 53
    if-nez p1, :cond_2

    .line 54
    .line 55
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 56
    .line 57
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Media;->urlKey:Ljava/lang/String;

    .line 58
    .line 59
    if-nez p1, :cond_3

    .line 60
    .line 61
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Media;->urlKey:Ljava/lang/String;

    .line 62
    .line 63
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 64
    .line 65
    if-nez p1, :cond_4

    .line 66
    .line 67
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 68
    .line 69
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 70
    .line 71
    if-nez p1, :cond_5

    .line 72
    .line 73
    new-instance p1, Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 76
    .line 77
    .line 78
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 79
    .line 80
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 81
    .line 82
    if-nez p1, :cond_6

    .line 83
    .line 84
    invoke-static {}, Lcom/p1/mobile/putong/data/Dimension;->new_()Lcom/p1/mobile/putong/data/Dimension;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 89
    .line 90
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Picture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 91
    .line 92
    if-nez p1, :cond_e

    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/data/AIPosition;->new_()Lcom/p1/mobile/putong/data/AIPosition;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Picture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 99
    .line 100
    return-object p0

    .line 101
    :sswitch_0
    sget-object v2, Lcom/p1/mobile/putong/data/LivePhoto;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 102
    .line 103
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    check-cast v2, Lcom/p1/mobile/putong/data/LivePhoto;

    .line 108
    .line 109
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Picture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :sswitch_1
    sget-object v2, Lcom/p1/mobile/putong/data/MediaLocalStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 113
    .line 114
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    check-cast v2, Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 119
    .line 120
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :sswitch_2
    sget-object v2, Lcom/p1/mobile/putong/data/GaussianBlurParameters;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 124
    .line 125
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    check-cast v2, Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 130
    .line 131
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Picture;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :sswitch_3
    sget-object v2, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 135
    .line 136
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    check-cast v2, Ljava/util/List;

    .line 145
    .line 146
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :sswitch_4
    sget-object v2, Lcom/p1/mobile/putong/data/AIPosition;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 151
    .line 152
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    check-cast v2, Lcom/p1/mobile/putong/data/AIPosition;

    .line 157
    .line 158
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Picture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 159
    .line 160
    goto/16 :goto_0

    .line 161
    .line 162
    :sswitch_5
    sget-object v2, Lcom/p1/mobile/putong/data/Dimension;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 163
    .line 164
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    check-cast v2, Lcom/p1/mobile/putong/data/Dimension;

    .line 169
    .line 170
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 171
    .line 172
    goto/16 :goto_0

    .line 173
    .line 174
    :sswitch_6
    sget-object v2, Lcom/p1/mobile/putong/data/IdealTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 175
    .line 176
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    check-cast v2, Ljava/util/List;

    .line 185
    .line 186
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Media;->tagIdealInfo:Ljava/util/List;

    .line 187
    .line 188
    goto/16 :goto_0

    .line 189
    .line 190
    :sswitch_7
    sget-object v2, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 191
    .line 192
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    check-cast v2, Ljava/util/List;

    .line 201
    .line 202
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 203
    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :sswitch_8
    sget-object v2, Lcom/p1/mobile/putong/data/MediaLabel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 207
    .line 208
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 209
    .line 210
    .line 211
    move-result-object v2

    .line 212
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object v2

    .line 216
    check-cast v2, Ljava/util/List;

    .line 217
    .line 218
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 219
    .line 220
    goto/16 :goto_0

    .line 221
    .line 222
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/Media;->isPortrait:Z

    .line 227
    .line 228
    goto/16 :goto_0

    .line 229
    .line 230
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 235
    .line 236
    goto/16 :goto_0

    .line 237
    .line 238
    :sswitch_b
    sget-object v2, Lcom/p1/mobile/putong/data/MediaMeta;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 239
    .line 240
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    move-result-object v2

    .line 244
    check-cast v2, Lcom/p1/mobile/putong/data/MediaMeta;

    .line 245
    .line 246
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 247
    .line 248
    goto/16 :goto_0

    .line 249
    .line 250
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 255
    .line 256
    goto/16 :goto_0

    .line 257
    .line 258
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Media;->name:Ljava/lang/String;

    .line 263
    .line 264
    goto/16 :goto_0

    .line 265
    .line 266
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Media;->urlKey:Ljava/lang/String;

    .line 271
    .line 272
    goto/16 :goto_0

    .line 273
    .line 274
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v2

    .line 278
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 279
    .line 280
    goto/16 :goto_0

    .line 281
    .line 282
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 283
    .line 284
    .line 285
    move-result v1

    .line 286
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 287
    .line 288
    .line 289
    move-result-object v1

    .line 290
    goto/16 :goto_0

    .line 291
    .line 292
    :sswitch_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 293
    .line 294
    if-nez p1, :cond_7

    .line 295
    .line 296
    if-eqz v1, :cond_7

    .line 297
    .line 298
    sget-object p1, Lcom/p1/mobile/putong/data/MediaLocalStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 299
    .line 300
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 301
    .line 302
    .line 303
    move-result v1

    .line 304
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 305
    .line 306
    .line 307
    move-result-object p1

    .line 308
    check-cast p1, Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 309
    .line 310
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 311
    .line 312
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 313
    .line 314
    if-nez p1, :cond_8

    .line 315
    .line 316
    sget-object p1, Lcom/p1/mobile/putong/data/MediaLocalStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 317
    .line 318
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 319
    .line 320
    .line 321
    move-result-object p1

    .line 322
    check-cast p1, Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 323
    .line 324
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 325
    .line 326
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 327
    .line 328
    if-nez p1, :cond_9

    .line 329
    .line 330
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 331
    .line 332
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Media;->urlKey:Ljava/lang/String;

    .line 333
    .line 334
    if-nez p1, :cond_a

    .line 335
    .line 336
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Media;->urlKey:Ljava/lang/String;

    .line 337
    .line 338
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 339
    .line 340
    if-nez p1, :cond_b

    .line 341
    .line 342
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 343
    .line 344
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 345
    .line 346
    if-nez p1, :cond_c

    .line 347
    .line 348
    new-instance p1, Ljava/util/ArrayList;

    .line 349
    .line 350
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 351
    .line 352
    .line 353
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 354
    .line 355
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 356
    .line 357
    if-nez p1, :cond_d

    .line 358
    .line 359
    invoke-static {}, Lcom/p1/mobile/putong/data/Dimension;->new_()Lcom/p1/mobile/putong/data/Dimension;

    .line 360
    .line 361
    .line 362
    move-result-object p1

    .line 363
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 364
    .line 365
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Picture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 366
    .line 367
    if-nez p1, :cond_e

    .line 368
    .line 369
    invoke-static {}, Lcom/p1/mobile/putong/data/AIPosition;->new_()Lcom/p1/mobile/putong/data/AIPosition;

    .line 370
    .line 371
    .line 372
    move-result-object p1

    .line 373
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Picture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 374
    .line 375
    :cond_e
    return-object p0

    .line 376
    nop

    .line 377
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_11
        0x8 -> :sswitch_10
        0x12 -> :sswitch_f
        0x1a -> :sswitch_e
        0x22 -> :sswitch_d
        0x2a -> :sswitch_c
        0x32 -> :sswitch_b
        0x3a -> :sswitch_a
        0x48 -> :sswitch_9
        0x52 -> :sswitch_8
        0x5a -> :sswitch_7
        0x62 -> :sswitch_6
        0x19a -> :sswitch_5
        0x1a2 -> :sswitch_4
        0x1aa -> :sswitch_3
        0x1b2 -> :sswitch_2
        0x1ba -> :sswitch_1
        0x1c2 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 377
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Picture$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Picture;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/Picture;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->urlKey:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->name:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    const/4 v0, 0x4

    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    const/4 v0, 0x5

    .line 42
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 46
    .line 47
    if-eqz p0, :cond_5

    .line 48
    .line 49
    const/4 v0, 0x6

    .line 50
    sget-object v1, Lcom/p1/mobile/putong/data/MediaMeta;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 51
    .line 52
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 53
    .line 54
    .line 55
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz p0, :cond_6

    .line 58
    .line 59
    const/4 v0, 0x7

    .line 60
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_6
    const/16 p0, 0x9

    .line 64
    .line 65
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/Media;->isPortrait:Z

    .line 66
    .line 67
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 71
    .line 72
    if-eqz p0, :cond_7

    .line 73
    .line 74
    sget-object v0, Lcom/p1/mobile/putong/data/MediaLabel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const/16 v1, 0xa

    .line 81
    .line 82
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 83
    .line 84
    .line 85
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 86
    .line 87
    if-eqz p0, :cond_8

    .line 88
    .line 89
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    const/16 v1, 0xb

    .line 96
    .line 97
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 98
    .line 99
    .line 100
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->tagIdealInfo:Ljava/util/List;

    .line 101
    .line 102
    if-eqz p0, :cond_9

    .line 103
    .line 104
    sget-object v0, Lcom/p1/mobile/putong/data/IdealTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    const/16 v1, 0xc

    .line 111
    .line 112
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 113
    .line 114
    .line 115
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 116
    .line 117
    if-eqz p0, :cond_a

    .line 118
    .line 119
    const/16 v0, 0x33

    .line 120
    .line 121
    sget-object v1, Lcom/p1/mobile/putong/data/Dimension;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 122
    .line 123
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 124
    .line 125
    .line 126
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Picture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 127
    .line 128
    if-eqz p0, :cond_b

    .line 129
    .line 130
    const/16 v0, 0x34

    .line 131
    .line 132
    sget-object v1, Lcom/p1/mobile/putong/data/AIPosition;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 133
    .line 134
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 135
    .line 136
    .line 137
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 138
    .line 139
    if-eqz p0, :cond_c

    .line 140
    .line 141
    sget-object v0, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 142
    .line 143
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    const/16 v1, 0x35

    .line 148
    .line 149
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 150
    .line 151
    .line 152
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Picture;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 153
    .line 154
    if-eqz p0, :cond_d

    .line 155
    .line 156
    const/16 v0, 0x36

    .line 157
    .line 158
    sget-object v1, Lcom/p1/mobile/putong/data/GaussianBlurParameters;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 159
    .line 160
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 161
    .line 162
    .line 163
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 164
    .line 165
    if-eqz p0, :cond_e

    .line 166
    .line 167
    const/16 v0, 0x37

    .line 168
    .line 169
    sget-object v1, Lcom/p1/mobile/putong/data/MediaLocalStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 170
    .line 171
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 172
    .line 173
    .line 174
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Picture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 175
    .line 176
    if-eqz p0, :cond_f

    .line 177
    .line 178
    const/16 p1, 0x38

    .line 179
    .line 180
    sget-object v0, Lcom/p1/mobile/putong/data/LivePhoto;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 181
    .line 182
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 183
    .line 184
    .line 185
    :cond_f
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 186
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Picture$1;->serialize(Lcom/p1/mobile/putong/data/Picture;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
