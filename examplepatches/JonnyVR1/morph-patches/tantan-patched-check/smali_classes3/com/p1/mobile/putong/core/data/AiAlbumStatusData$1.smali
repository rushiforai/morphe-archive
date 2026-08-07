.class Lcom/p1/mobile/putong/core/data/AiAlbumStatusData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->albumId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->status:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->checking:Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    sget-object v2, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 28
    .line 29
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->processing:Lcom/p1/mobile/putong/core/data/AiAlbumProcessingData;

    .line 35
    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    const/4 v1, 0x4

    .line 39
    sget-object v2, Lcom/p1/mobile/putong/core/data/AiAlbumProcessingData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 40
    .line 41
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->finished:Lcom/p1/mobile/putong/core/data/AiAlbumFinishedData;

    .line 47
    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    const/4 v1, 0x5

    .line 51
    sget-object v2, Lcom/p1/mobile/putong/core/data/AiAlbumFinishedData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 52
    .line 53
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->templateId:Ljava/lang/String;

    .line 59
    .line 60
    if-eqz v0, :cond_5

    .line 61
    .line 62
    const/4 v1, 0x6

    .line 63
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    :cond_5
    const/4 v0, 0x7

    .line 69
    iget v1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->availableTimes:I

    .line 70
    .line 71
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int/2addr p0, v0

    .line 76
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 77
    .line 78
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 79
    check-cast p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;-><init>()V

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
    if-eqz v0, :cond_c

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_b

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_a

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_9

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_8

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_7

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_6

    .line 37
    .line 38
    const/16 v2, 0x38

    .line 39
    .line 40
    if-eq v0, v2, :cond_5

    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->albumId:Ljava/lang/String;

    .line 43
    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->albumId:Ljava/lang/String;

    .line 47
    .line 48
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->status:Ljava/lang/String;

    .line 49
    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->status:Ljava/lang/String;

    .line 53
    .line 54
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->checking:Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;

    .line 55
    .line 56
    if-nez p1, :cond_2

    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->new_()Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->checking:Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;

    .line 63
    .line 64
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->processing:Lcom/p1/mobile/putong/core/data/AiAlbumProcessingData;

    .line 65
    .line 66
    if-nez p1, :cond_3

    .line 67
    .line 68
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AiAlbumProcessingData;->new_()Lcom/p1/mobile/putong/core/data/AiAlbumProcessingData;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->processing:Lcom/p1/mobile/putong/core/data/AiAlbumProcessingData;

    .line 73
    .line 74
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->finished:Lcom/p1/mobile/putong/core/data/AiAlbumFinishedData;

    .line 75
    .line 76
    if-nez p1, :cond_4

    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AiAlbumFinishedData;->new_()Lcom/p1/mobile/putong/core/data/AiAlbumFinishedData;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->finished:Lcom/p1/mobile/putong/core/data/AiAlbumFinishedData;

    .line 83
    .line 84
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->templateId:Ljava/lang/String;

    .line 85
    .line 86
    if-nez p1, :cond_12

    .line 87
    .line 88
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->templateId:Ljava/lang/String;

    .line 89
    .line 90
    return-object p0

    .line 91
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    iput v0, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->availableTimes:I

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->templateId:Ljava/lang/String;

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/core/data/AiAlbumFinishedData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 106
    .line 107
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    check-cast v0, Lcom/p1/mobile/putong/core/data/AiAlbumFinishedData;

    .line 112
    .line 113
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->finished:Lcom/p1/mobile/putong/core/data/AiAlbumFinishedData;

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/core/data/AiAlbumProcessingData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 117
    .line 118
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    check-cast v0, Lcom/p1/mobile/putong/core/data/AiAlbumProcessingData;

    .line 123
    .line 124
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->processing:Lcom/p1/mobile/putong/core/data/AiAlbumProcessingData;

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 128
    .line 129
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    check-cast v0, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;

    .line 134
    .line 135
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->checking:Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;

    .line 136
    .line 137
    goto/16 :goto_0

    .line 138
    .line 139
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->status:Ljava/lang/String;

    .line 144
    .line 145
    goto/16 :goto_0

    .line 146
    .line 147
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->albumId:Ljava/lang/String;

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->albumId:Ljava/lang/String;

    .line 156
    .line 157
    if-nez p1, :cond_d

    .line 158
    .line 159
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->albumId:Ljava/lang/String;

    .line 160
    .line 161
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->status:Ljava/lang/String;

    .line 162
    .line 163
    if-nez p1, :cond_e

    .line 164
    .line 165
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->status:Ljava/lang/String;

    .line 166
    .line 167
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->checking:Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;

    .line 168
    .line 169
    if-nez p1, :cond_f

    .line 170
    .line 171
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->new_()Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->checking:Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;

    .line 176
    .line 177
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->processing:Lcom/p1/mobile/putong/core/data/AiAlbumProcessingData;

    .line 178
    .line 179
    if-nez p1, :cond_10

    .line 180
    .line 181
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AiAlbumProcessingData;->new_()Lcom/p1/mobile/putong/core/data/AiAlbumProcessingData;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->processing:Lcom/p1/mobile/putong/core/data/AiAlbumProcessingData;

    .line 186
    .line 187
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->finished:Lcom/p1/mobile/putong/core/data/AiAlbumFinishedData;

    .line 188
    .line 189
    if-nez p1, :cond_11

    .line 190
    .line 191
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AiAlbumFinishedData;->new_()Lcom/p1/mobile/putong/core/data/AiAlbumFinishedData;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->finished:Lcom/p1/mobile/putong/core/data/AiAlbumFinishedData;

    .line 196
    .line 197
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->templateId:Ljava/lang/String;

    .line 198
    .line 199
    if-nez p1, :cond_12

    .line 200
    .line 201
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->templateId:Ljava/lang/String;

    .line 202
    .line 203
    :cond_12
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 204
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->albumId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->status:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->checking:Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/data/AiAlbumCheckingData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 23
    .line 24
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 25
    .line 26
    .line 27
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->processing:Lcom/p1/mobile/putong/core/data/AiAlbumProcessingData;

    .line 28
    .line 29
    if-eqz p0, :cond_3

    .line 30
    .line 31
    const/4 v0, 0x4

    .line 32
    sget-object v1, Lcom/p1/mobile/putong/core/data/AiAlbumProcessingData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 33
    .line 34
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->finished:Lcom/p1/mobile/putong/core/data/AiAlbumFinishedData;

    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    const/4 v0, 0x5

    .line 42
    sget-object v1, Lcom/p1/mobile/putong/core/data/AiAlbumFinishedData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 43
    .line 44
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 45
    .line 46
    .line 47
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->templateId:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz p0, :cond_5

    .line 50
    .line 51
    const/4 v0, 0x6

    .line 52
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_5
    const/4 p0, 0x7

    .line 56
    iget p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;->availableTimes:I

    .line 57
    .line 58
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 59
    .line 60
    .line 61
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
    check-cast p1, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/AiAlbumStatusData$1;->serialize(Lcom/p1/mobile/putong/core/data/AiAlbumStatusData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
