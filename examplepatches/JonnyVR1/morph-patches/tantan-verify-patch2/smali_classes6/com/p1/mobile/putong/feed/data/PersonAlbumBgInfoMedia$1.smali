.class Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->name:Ljava/lang/String;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    add-int/2addr p0, v0

    .line 22
    :cond_1
    const/4 v0, 0x3

    .line 23
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->duration:F

    .line 24
    .line 25
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->mediaType:Ljava/lang/String;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x4

    .line 35
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    const/4 v1, 0x5

    .line 45
    sget-object v2, Lcom/p1/mobile/putong/data/Dimension;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->attachments:Ljava/util/List;

    .line 53
    .line 54
    if-eqz v0, :cond_4

    .line 55
    .line 56
    sget-object v1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->url:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz v0, :cond_5

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
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 79
    .line 80
    if-eqz v0, :cond_6

    .line 81
    .line 82
    const/16 v1, 0x8

    .line 83
    .line 84
    sget-object v2, Lcom/p1/mobile/putong/data/AudioMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 85
    .line 86
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    add-int/2addr p0, v0

    .line 91
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 92
    .line 93
    if-eqz v0, :cond_7

    .line 94
    .line 95
    const/16 v1, 0x9

    .line 96
    .line 97
    sget-object v2, Lcom/p1/mobile/putong/data/GifMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 98
    .line 99
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    add-int/2addr p0, v0

    .line 104
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->music:Lcom/p1/mobile/putong/data/Music;

    .line 105
    .line 106
    if-eqz v0, :cond_8

    .line 107
    .line 108
    const/16 v1, 0xa

    .line 109
    .line 110
    sget-object v2, Lcom/p1/mobile/putong/data/Music;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 111
    .line 112
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    add-int/2addr p0, v0

    .line 117
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 118
    .line 119
    if-eqz v0, :cond_9

    .line 120
    .line 121
    const/16 v1, 0xb

    .line 122
    .line 123
    sget-object v2, Lcom/p1/mobile/putong/data/AIPosition;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 124
    .line 125
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    add-int/2addr p0, v0

    .line 130
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 131
    .line 132
    if-eqz v0, :cond_a

    .line 133
    .line 134
    const/16 v1, 0xc

    .line 135
    .line 136
    sget-object v2, Lcom/p1/mobile/putong/data/GaussianBlurParameters;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 137
    .line 138
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    add-int/2addr p0, v0

    .line 143
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->status:Ljava/lang/String;

    .line 144
    .line 145
    if-eqz v0, :cond_b

    .line 146
    .line 147
    const/16 v1, 0xd

    .line 148
    .line 149
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    add-int/2addr p0, v0

    .line 154
    :cond_b
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 155
    .line 156
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 157
    check-cast p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->id:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->id:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->mediaType:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->mediaType:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/data/Dimension;->new_()Lcom/p1/mobile/putong/data/Dimension;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 36
    .line 37
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->url:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_3

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->url:Ljava/lang/String;

    .line 42
    .line 43
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 44
    .line 45
    if-nez p1, :cond_4

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/data/AIPosition;->new_()Lcom/p1/mobile/putong/data/AIPosition;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 52
    .line 53
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->status:Ljava/lang/String;

    .line 54
    .line 55
    if-nez p1, :cond_a

    .line 56
    .line 57
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->status:Ljava/lang/String;

    .line 58
    .line 59
    return-object p0

    .line 60
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->status:Ljava/lang/String;

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/data/GaussianBlurParameters;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 68
    .line 69
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 74
    .line 75
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/data/AIPosition;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Lcom/p1/mobile/putong/data/AIPosition;

    .line 85
    .line 86
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/data/Music;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 90
    .line 91
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    check-cast v0, Lcom/p1/mobile/putong/data/Music;

    .line 96
    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->music:Lcom/p1/mobile/putong/data/Music;

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :sswitch_4
    sget-object v0, Lcom/p1/mobile/putong/data/GifMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    check-cast v0, Lcom/p1/mobile/putong/data/GifMedia;

    .line 107
    .line 108
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :sswitch_5
    sget-object v0, Lcom/p1/mobile/putong/data/AudioMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Lcom/p1/mobile/putong/data/AudioMedia;

    .line 118
    .line 119
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->url:Ljava/lang/String;

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :sswitch_7
    sget-object v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 130
    .line 131
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    check-cast v0, Ljava/util/List;

    .line 140
    .line 141
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->attachments:Ljava/util/List;

    .line 142
    .line 143
    goto/16 :goto_0

    .line 144
    .line 145
    :sswitch_8
    sget-object v0, Lcom/p1/mobile/putong/data/Dimension;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 146
    .line 147
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    check-cast v0, Lcom/p1/mobile/putong/data/Dimension;

    .line 152
    .line 153
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 154
    .line 155
    goto/16 :goto_0

    .line 156
    .line 157
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->mediaType:Ljava/lang/String;

    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->i()F

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->duration:F

    .line 170
    .line 171
    goto/16 :goto_0

    .line 172
    .line 173
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->name:Ljava/lang/String;

    .line 178
    .line 179
    goto/16 :goto_0

    .line 180
    .line 181
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->id:Ljava/lang/String;

    .line 186
    .line 187
    goto/16 :goto_0

    .line 188
    .line 189
    :sswitch_d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->id:Ljava/lang/String;

    .line 190
    .line 191
    if-nez p1, :cond_5

    .line 192
    .line 193
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->id:Ljava/lang/String;

    .line 194
    .line 195
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->mediaType:Ljava/lang/String;

    .line 196
    .line 197
    if-nez p1, :cond_6

    .line 198
    .line 199
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->mediaType:Ljava/lang/String;

    .line 200
    .line 201
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 202
    .line 203
    if-nez p1, :cond_7

    .line 204
    .line 205
    invoke-static {}, Lcom/p1/mobile/putong/data/Dimension;->new_()Lcom/p1/mobile/putong/data/Dimension;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 210
    .line 211
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->url:Ljava/lang/String;

    .line 212
    .line 213
    if-nez p1, :cond_8

    .line 214
    .line 215
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->url:Ljava/lang/String;

    .line 216
    .line 217
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 218
    .line 219
    if-nez p1, :cond_9

    .line 220
    .line 221
    invoke-static {}, Lcom/p1/mobile/putong/data/AIPosition;->new_()Lcom/p1/mobile/putong/data/AIPosition;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 226
    .line 227
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->status:Ljava/lang/String;

    .line 228
    .line 229
    if-nez p1, :cond_a

    .line 230
    .line 231
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->status:Ljava/lang/String;

    .line 232
    .line 233
    :cond_a
    return-object p0

    .line 234
    nop

    .line 235
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_d
        0xa -> :sswitch_c
        0x12 -> :sswitch_b
        0x1d -> :sswitch_a
        0x22 -> :sswitch_9
        0x2a -> :sswitch_8
        0x32 -> :sswitch_7
        0x3a -> :sswitch_6
        0x42 -> :sswitch_5
        0x4a -> :sswitch_4
        0x52 -> :sswitch_3
        0x5a -> :sswitch_2
        0x62 -> :sswitch_1
        0x6a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 235
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->name:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    const/4 p0, 0x3

    .line 18
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->duration:F

    .line 19
    .line 20
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->mediaType:Ljava/lang/String;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x4

    .line 28
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x5

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/data/Dimension;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 37
    .line 38
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->attachments:Ljava/util/List;

    .line 42
    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->url:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz p0, :cond_5

    .line 58
    .line 59
    const/4 v0, 0x7

    .line 60
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 64
    .line 65
    if-eqz p0, :cond_6

    .line 66
    .line 67
    const/16 v0, 0x8

    .line 68
    .line 69
    sget-object v1, Lcom/p1/mobile/putong/data/AudioMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 70
    .line 71
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 72
    .line 73
    .line 74
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 75
    .line 76
    if-eqz p0, :cond_7

    .line 77
    .line 78
    const/16 v0, 0x9

    .line 79
    .line 80
    sget-object v1, Lcom/p1/mobile/putong/data/GifMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 81
    .line 82
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 83
    .line 84
    .line 85
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->music:Lcom/p1/mobile/putong/data/Music;

    .line 86
    .line 87
    if-eqz p0, :cond_8

    .line 88
    .line 89
    const/16 v0, 0xa

    .line 90
    .line 91
    sget-object v1, Lcom/p1/mobile/putong/data/Music;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 92
    .line 93
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 94
    .line 95
    .line 96
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 97
    .line 98
    if-eqz p0, :cond_9

    .line 99
    .line 100
    const/16 v0, 0xb

    .line 101
    .line 102
    sget-object v1, Lcom/p1/mobile/putong/data/AIPosition;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 103
    .line 104
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 105
    .line 106
    .line 107
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 108
    .line 109
    if-eqz p0, :cond_a

    .line 110
    .line 111
    const/16 v0, 0xc

    .line 112
    .line 113
    sget-object v1, Lcom/p1/mobile/putong/data/GaussianBlurParameters;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 114
    .line 115
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 116
    .line 117
    .line 118
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->status:Ljava/lang/String;

    .line 119
    .line 120
    if-eqz p0, :cond_b

    .line 121
    .line 122
    const/16 p1, 0xd

    .line 123
    .line 124
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 125
    .line 126
    .line 127
    :cond_b
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 128
    check-cast p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia$1;->serialize(Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
