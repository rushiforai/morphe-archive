.class Lcom/p1/mobile/putong/core/data/SogouGifPicture$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/SogouGifPicture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/SogouGifPicture;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/SogouGifPicture;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->name:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->url:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    sget-object v2, Lcom/p1/mobile/putong/data/Dimension;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    const/4 v0, 0x4

    .line 35
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->duration:J

    .line 36
    .line 37
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->mediaType:Ljava/lang/String;

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
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 53
    .line 54
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 55
    check-cast p1, Lcom/p1/mobile/putong/core/data/SogouGifPicture;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/SogouGifPicture$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/SogouGifPicture;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/SogouGifPicture;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/SogouGifPicture;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/SogouGifPicture;-><init>()V

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
    if-eqz v0, :cond_8

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_7

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_6

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_5

    .line 25
    .line 26
    const/16 v2, 0x20

    .line 27
    .line 28
    if-eq v0, v2, :cond_4

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_3

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->name:Ljava/lang/String;

    .line 35
    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->name:Ljava/lang/String;

    .line 39
    .line 40
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->url:Ljava/lang/String;

    .line 41
    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->url:Ljava/lang/String;

    .line 45
    .line 46
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 47
    .line 48
    if-nez p1, :cond_2

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/data/Dimension;->new_()Lcom/p1/mobile/putong/data/Dimension;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 55
    .line 56
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->mediaType:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_c

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->mediaType:Ljava/lang/String;

    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->mediaType:Ljava/lang/String;

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 71
    .line 72
    .line 73
    move-result-wide v0

    .line 74
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->duration:J

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/data/Dimension;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Lcom/p1/mobile/putong/data/Dimension;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->url:Ljava/lang/String;

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->name:Ljava/lang/String;

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->name:Ljava/lang/String;

    .line 103
    .line 104
    if-nez p1, :cond_9

    .line 105
    .line 106
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->name:Ljava/lang/String;

    .line 107
    .line 108
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->url:Ljava/lang/String;

    .line 109
    .line 110
    if-nez p1, :cond_a

    .line 111
    .line 112
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->url:Ljava/lang/String;

    .line 113
    .line 114
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 115
    .line 116
    if-nez p1, :cond_b

    .line 117
    .line 118
    invoke-static {}, Lcom/p1/mobile/putong/data/Dimension;->new_()Lcom/p1/mobile/putong/data/Dimension;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 123
    .line 124
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->mediaType:Ljava/lang/String;

    .line 125
    .line 126
    if-nez p1, :cond_c

    .line 127
    .line 128
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->mediaType:Ljava/lang/String;

    .line 129
    .line 130
    :cond_c
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 131
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/SogouGifPicture$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/SogouGifPicture;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/SogouGifPicture;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->name:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->url:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/data/Dimension;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 23
    .line 24
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 25
    .line 26
    .line 27
    :cond_2
    const/4 p0, 0x4

    .line 28
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->duration:J

    .line 29
    .line 30
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SogouGifPicture;->mediaType:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    const/4 p1, 0x5

    .line 38
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 42
    check-cast p1, Lcom/p1/mobile/putong/core/data/SogouGifPicture;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/SogouGifPicture$1;->serialize(Lcom/p1/mobile/putong/core/data/SogouGifPicture;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
