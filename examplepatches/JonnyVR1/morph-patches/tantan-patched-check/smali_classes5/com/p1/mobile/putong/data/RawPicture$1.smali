.class Lcom/p1/mobile/putong/data/RawPicture$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/RawPicture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/RawPicture;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/RawPicture;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RawPicture;->name:Ljava/lang/String;

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
    iget v1, p1, Lcom/p1/mobile/putong/data/RawPicture;->duration:F

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/2addr p0, v0

    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RawPicture;->mediaType:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RawPicture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x4

    .line 35
    sget-object v2, Lcom/p1/mobile/putong/data/Dimension;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 36
    .line 37
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RawPicture;->url:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    const/4 v1, 0x5

    .line 47
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RawPicture;->attachments:Ljava/util/List;

    .line 53
    .line 54
    if-eqz v0, :cond_4

    .line 55
    .line 56
    sget-object v1, Lcom/p1/mobile/putong/data/RawPicture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    const/4 v2, 0x6

    .line 63
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RawPicture;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 69
    .line 70
    if-eqz v0, :cond_5

    .line 71
    .line 72
    const/4 v1, 0x7

    .line 73
    sget-object v2, Lcom/p1/mobile/putong/data/AudioMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 74
    .line 75
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    add-int/2addr p0, v0

    .line 80
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RawPicture;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 81
    .line 82
    if-eqz v0, :cond_6

    .line 83
    .line 84
    const/16 v1, 0x8

    .line 85
    .line 86
    sget-object v2, Lcom/p1/mobile/putong/data/GifMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 87
    .line 88
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    add-int/2addr p0, v0

    .line 93
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RawPicture;->music:Lcom/p1/mobile/putong/data/Music;

    .line 94
    .line 95
    if-eqz v0, :cond_7

    .line 96
    .line 97
    const/16 v1, 0x9

    .line 98
    .line 99
    sget-object v2, Lcom/p1/mobile/putong/data/Music;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 100
    .line 101
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    add-int/2addr p0, v0

    .line 106
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RawPicture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 107
    .line 108
    if-eqz v0, :cond_8

    .line 109
    .line 110
    const/16 v1, 0xa

    .line 111
    .line 112
    sget-object v2, Lcom/p1/mobile/putong/data/AIPosition;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 113
    .line 114
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    add-int/2addr p0, v0

    .line 119
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RawPicture;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 120
    .line 121
    if-eqz v0, :cond_9

    .line 122
    .line 123
    const/16 v1, 0xb

    .line 124
    .line 125
    sget-object v2, Lcom/p1/mobile/putong/data/GaussianBlurParameters;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 126
    .line 127
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    add-int/2addr p0, v0

    .line 132
    :cond_9
    const/16 v0, 0xc

    .line 133
    .line 134
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/RawPicture;->isPortrait:Z

    .line 135
    .line 136
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    add-int/2addr p0, v0

    .line 141
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RawPicture;->labels:Ljava/util/List;

    .line 142
    .line 143
    if-eqz v0, :cond_a

    .line 144
    .line 145
    sget-object v1, Lcom/p1/mobile/putong/data/MediaLabel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 146
    .line 147
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    const/16 v2, 0xd

    .line 152
    .line 153
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    add-int/2addr p0, v0

    .line 158
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RawPicture;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 159
    .line 160
    if-eqz v0, :cond_b

    .line 161
    .line 162
    const/16 v1, 0xe

    .line 163
    .line 164
    sget-object v2, Lcom/p1/mobile/putong/data/MediaLocalStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 165
    .line 166
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    add-int/2addr p0, v0

    .line 171
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RawPicture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 172
    .line 173
    if-eqz v0, :cond_c

    .line 174
    .line 175
    const/16 v1, 0xf

    .line 176
    .line 177
    sget-object v2, Lcom/p1/mobile/putong/data/LivePhoto;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 178
    .line 179
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    add-int/2addr p0, v0

    .line 184
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RawPicture;->tags:Ljava/util/List;

    .line 185
    .line 186
    if-eqz v0, :cond_d

    .line 187
    .line 188
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 189
    .line 190
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    const/16 v2, 0x10

    .line 195
    .line 196
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    add-int/2addr p0, v0

    .line 201
    :cond_d
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 202
    .line 203
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 204
    check-cast p1, Lcom/p1/mobile/putong/data/RawPicture;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/RawPicture$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/RawPicture;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/RawPicture;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/RawPicture;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/RawPicture;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RawPicture;->mediaType:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->mediaType:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RawPicture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/data/Dimension;->new_()Lcom/p1/mobile/putong/data/Dimension;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/data/RawPicture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 30
    .line 31
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RawPicture;->url:Ljava/lang/String;

    .line 32
    .line 33
    if-nez p1, :cond_2

    .line 34
    .line 35
    iput-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->url:Ljava/lang/String;

    .line 36
    .line 37
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RawPicture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 38
    .line 39
    if-nez p1, :cond_3

    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/data/AIPosition;->new_()Lcom/p1/mobile/putong/data/AIPosition;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, p0, Lcom/p1/mobile/putong/data/RawPicture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 46
    .line 47
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RawPicture;->tags:Ljava/util/List;

    .line 48
    .line 49
    if-nez p1, :cond_8

    .line 50
    .line 51
    new-instance p1, Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/data/RawPicture;->tags:Ljava/util/List;

    .line 57
    .line 58
    return-object p0

    .line 59
    :sswitch_0
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Ljava/util/List;

    .line 70
    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->tags:Ljava/util/List;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/data/LivePhoto;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lcom/p1/mobile/putong/data/LivePhoto;

    .line 81
    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/data/MediaLocalStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    check-cast v0, Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 92
    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/data/MediaLabel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 97
    .line 98
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    check-cast v0, Ljava/util/List;

    .line 107
    .line 108
    iput-object v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->labels:Ljava/util/List;

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->isPortrait:Z

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :sswitch_5
    sget-object v0, Lcom/p1/mobile/putong/data/GaussianBlurParameters;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 119
    .line 120
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 125
    .line 126
    iput-object v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :sswitch_6
    sget-object v0, Lcom/p1/mobile/putong/data/AIPosition;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 130
    .line 131
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    check-cast v0, Lcom/p1/mobile/putong/data/AIPosition;

    .line 136
    .line 137
    iput-object v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_7
    sget-object v0, Lcom/p1/mobile/putong/data/Music;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 142
    .line 143
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    check-cast v0, Lcom/p1/mobile/putong/data/Music;

    .line 148
    .line 149
    iput-object v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->music:Lcom/p1/mobile/putong/data/Music;

    .line 150
    .line 151
    goto/16 :goto_0

    .line 152
    .line 153
    :sswitch_8
    sget-object v0, Lcom/p1/mobile/putong/data/GifMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 154
    .line 155
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    check-cast v0, Lcom/p1/mobile/putong/data/GifMedia;

    .line 160
    .line 161
    iput-object v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :sswitch_9
    sget-object v0, Lcom/p1/mobile/putong/data/AudioMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 166
    .line 167
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    check-cast v0, Lcom/p1/mobile/putong/data/AudioMedia;

    .line 172
    .line 173
    iput-object v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :sswitch_a
    sget-object v0, Lcom/p1/mobile/putong/data/RawPicture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 178
    .line 179
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    check-cast v0, Ljava/util/List;

    .line 188
    .line 189
    iput-object v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->attachments:Ljava/util/List;

    .line 190
    .line 191
    goto/16 :goto_0

    .line 192
    .line 193
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    iput-object v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->url:Ljava/lang/String;

    .line 198
    .line 199
    goto/16 :goto_0

    .line 200
    .line 201
    :sswitch_c
    sget-object v0, Lcom/p1/mobile/putong/data/Dimension;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 202
    .line 203
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    check-cast v0, Lcom/p1/mobile/putong/data/Dimension;

    .line 208
    .line 209
    iput-object v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 210
    .line 211
    goto/16 :goto_0

    .line 212
    .line 213
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    iput-object v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->mediaType:Ljava/lang/String;

    .line 218
    .line 219
    goto/16 :goto_0

    .line 220
    .line 221
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->i()F

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    iput v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->duration:F

    .line 226
    .line 227
    goto/16 :goto_0

    .line 228
    .line 229
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    iput-object v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->name:Ljava/lang/String;

    .line 234
    .line 235
    goto/16 :goto_0

    .line 236
    .line 237
    :sswitch_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RawPicture;->mediaType:Ljava/lang/String;

    .line 238
    .line 239
    if-nez p1, :cond_4

    .line 240
    .line 241
    iput-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->mediaType:Ljava/lang/String;

    .line 242
    .line 243
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RawPicture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 244
    .line 245
    if-nez p1, :cond_5

    .line 246
    .line 247
    invoke-static {}, Lcom/p1/mobile/putong/data/Dimension;->new_()Lcom/p1/mobile/putong/data/Dimension;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    iput-object p1, p0, Lcom/p1/mobile/putong/data/RawPicture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 252
    .line 253
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RawPicture;->url:Ljava/lang/String;

    .line 254
    .line 255
    if-nez p1, :cond_6

    .line 256
    .line 257
    iput-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->url:Ljava/lang/String;

    .line 258
    .line 259
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RawPicture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 260
    .line 261
    if-nez p1, :cond_7

    .line 262
    .line 263
    invoke-static {}, Lcom/p1/mobile/putong/data/AIPosition;->new_()Lcom/p1/mobile/putong/data/AIPosition;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    iput-object p1, p0, Lcom/p1/mobile/putong/data/RawPicture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 268
    .line 269
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RawPicture;->tags:Ljava/util/List;

    .line 270
    .line 271
    if-nez p1, :cond_8

    .line 272
    .line 273
    new-instance p1, Ljava/util/ArrayList;

    .line 274
    .line 275
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 276
    .line 277
    .line 278
    iput-object p1, p0, Lcom/p1/mobile/putong/data/RawPicture;->tags:Ljava/util/List;

    .line 279
    .line 280
    :cond_8
    return-object p0

    .line 281
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_10
        0xa -> :sswitch_f
        0x15 -> :sswitch_e
        0x1a -> :sswitch_d
        0x22 -> :sswitch_c
        0x2a -> :sswitch_b
        0x32 -> :sswitch_a
        0x3a -> :sswitch_9
        0x42 -> :sswitch_8
        0x4a -> :sswitch_7
        0x52 -> :sswitch_6
        0x5a -> :sswitch_5
        0x60 -> :sswitch_4
        0x6a -> :sswitch_3
        0x72 -> :sswitch_2
        0x7a -> :sswitch_1
        0x82 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 281
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/RawPicture$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/RawPicture;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/RawPicture;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RawPicture;->name:Ljava/lang/String;

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
    iget v0, p1, Lcom/p1/mobile/putong/data/RawPicture;->duration:F

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RawPicture;->mediaType:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RawPicture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x4

    .line 28
    sget-object v1, Lcom/p1/mobile/putong/data/Dimension;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 29
    .line 30
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RawPicture;->url:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RawPicture;->attachments:Ljava/util/List;

    .line 42
    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/data/RawPicture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const/4 v1, 0x6

    .line 52
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 53
    .line 54
    .line 55
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RawPicture;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 56
    .line 57
    if-eqz p0, :cond_5

    .line 58
    .line 59
    const/4 v0, 0x7

    .line 60
    sget-object v1, Lcom/p1/mobile/putong/data/AudioMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 61
    .line 62
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 63
    .line 64
    .line 65
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RawPicture;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 66
    .line 67
    if-eqz p0, :cond_6

    .line 68
    .line 69
    const/16 v0, 0x8

    .line 70
    .line 71
    sget-object v1, Lcom/p1/mobile/putong/data/GifMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 72
    .line 73
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 74
    .line 75
    .line 76
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RawPicture;->music:Lcom/p1/mobile/putong/data/Music;

    .line 77
    .line 78
    if-eqz p0, :cond_7

    .line 79
    .line 80
    const/16 v0, 0x9

    .line 81
    .line 82
    sget-object v1, Lcom/p1/mobile/putong/data/Music;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 83
    .line 84
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 85
    .line 86
    .line 87
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RawPicture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 88
    .line 89
    if-eqz p0, :cond_8

    .line 90
    .line 91
    const/16 v0, 0xa

    .line 92
    .line 93
    sget-object v1, Lcom/p1/mobile/putong/data/AIPosition;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 94
    .line 95
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 96
    .line 97
    .line 98
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RawPicture;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 99
    .line 100
    if-eqz p0, :cond_9

    .line 101
    .line 102
    const/16 v0, 0xb

    .line 103
    .line 104
    sget-object v1, Lcom/p1/mobile/putong/data/GaussianBlurParameters;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 105
    .line 106
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 107
    .line 108
    .line 109
    :cond_9
    const/16 p0, 0xc

    .line 110
    .line 111
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/RawPicture;->isPortrait:Z

    .line 112
    .line 113
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RawPicture;->labels:Ljava/util/List;

    .line 117
    .line 118
    if-eqz p0, :cond_a

    .line 119
    .line 120
    sget-object v0, Lcom/p1/mobile/putong/data/MediaLabel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 121
    .line 122
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    const/16 v1, 0xd

    .line 127
    .line 128
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 129
    .line 130
    .line 131
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RawPicture;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 132
    .line 133
    if-eqz p0, :cond_b

    .line 134
    .line 135
    const/16 v0, 0xe

    .line 136
    .line 137
    sget-object v1, Lcom/p1/mobile/putong/data/MediaLocalStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 138
    .line 139
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 140
    .line 141
    .line 142
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RawPicture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 143
    .line 144
    if-eqz p0, :cond_c

    .line 145
    .line 146
    const/16 v0, 0xf

    .line 147
    .line 148
    sget-object v1, Lcom/p1/mobile/putong/data/LivePhoto;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 149
    .line 150
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 151
    .line 152
    .line 153
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RawPicture;->tags:Ljava/util/List;

    .line 154
    .line 155
    if-eqz p0, :cond_d

    .line 156
    .line 157
    sget-object p1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 158
    .line 159
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    const/16 v0, 0x10

    .line 164
    .line 165
    invoke-virtual {p2, v0, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 166
    .line 167
    .line 168
    :cond_d
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 169
    check-cast p1, Lcom/p1/mobile/putong/data/RawPicture;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/RawPicture$1;->serialize(Lcom/p1/mobile/putong/data/RawPicture;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
