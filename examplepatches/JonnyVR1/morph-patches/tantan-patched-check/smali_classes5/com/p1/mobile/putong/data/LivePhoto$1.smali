.class Lcom/p1/mobile/putong/data/LivePhoto$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/LivePhoto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/LivePhoto;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/LivePhoto;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LivePhoto;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x33

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/data/Dimension;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 8
    .line 9
    invoke-static {v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LivePhoto;->mediaType:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    const/16 v1, 0x34

    .line 20
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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LivePhoto;->url:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/16 v1, 0x35

    .line 31
    .line 32
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    add-int/2addr p0, v0

    .line 37
    :cond_2
    const/16 v0, 0x36

    .line 38
    .line 39
    iget v1, p1, Lcom/p1/mobile/putong/data/LivePhoto;->duration:F

    .line 40
    .line 41
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 47
    .line 48
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 49
    check-cast p1, Lcom/p1/mobile/putong/data/LivePhoto;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/LivePhoto$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/LivePhoto;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/LivePhoto;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/LivePhoto;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/LivePhoto;-><init>()V

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
    if-eqz v0, :cond_6

    .line 13
    .line 14
    const/16 v2, 0x19a

    .line 15
    .line 16
    if-eq v0, v2, :cond_5

    .line 17
    .line 18
    const/16 v2, 0x1a2

    .line 19
    .line 20
    if-eq v0, v2, :cond_4

    .line 21
    .line 22
    const/16 v2, 0x1aa

    .line 23
    .line 24
    if-eq v0, v2, :cond_3

    .line 25
    .line 26
    const/16 v2, 0x1b5

    .line 27
    .line 28
    if-eq v0, v2, :cond_2

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LivePhoto;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/data/Dimension;->new_()Lcom/p1/mobile/putong/data/Dimension;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LivePhoto;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 39
    .line 40
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LivePhoto;->mediaType:Ljava/lang/String;

    .line 41
    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LivePhoto;->mediaType:Ljava/lang/String;

    .line 45
    .line 46
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LivePhoto;->url:Ljava/lang/String;

    .line 47
    .line 48
    if-nez p1, :cond_9

    .line 49
    .line 50
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LivePhoto;->url:Ljava/lang/String;

    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->i()F

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iput v0, p0, Lcom/p1/mobile/putong/data/LivePhoto;->duration:F

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LivePhoto;->url:Ljava/lang/String;

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LivePhoto;->mediaType:Ljava/lang/String;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/data/Dimension;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lcom/p1/mobile/putong/data/Dimension;

    .line 81
    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LivePhoto;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LivePhoto;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 86
    .line 87
    if-nez p1, :cond_7

    .line 88
    .line 89
    invoke-static {}, Lcom/p1/mobile/putong/data/Dimension;->new_()Lcom/p1/mobile/putong/data/Dimension;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LivePhoto;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 94
    .line 95
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LivePhoto;->mediaType:Ljava/lang/String;

    .line 96
    .line 97
    if-nez p1, :cond_8

    .line 98
    .line 99
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LivePhoto;->mediaType:Ljava/lang/String;

    .line 100
    .line 101
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LivePhoto;->url:Ljava/lang/String;

    .line 102
    .line 103
    if-nez p1, :cond_9

    .line 104
    .line 105
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LivePhoto;->url:Ljava/lang/String;

    .line 106
    .line 107
    :cond_9
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 108
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/LivePhoto$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/LivePhoto;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/LivePhoto;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LivePhoto;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x33

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/data/Dimension;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 8
    .line 9
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LivePhoto;->mediaType:Ljava/lang/String;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    const/16 v0, 0x34

    .line 17
    .line 18
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LivePhoto;->url:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/16 v0, 0x35

    .line 26
    .line 27
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_2
    const/16 p0, 0x36

    .line 31
    .line 32
    iget p1, p1, Lcom/p1/mobile/putong/data/LivePhoto;->duration:F

    .line 33
    .line 34
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 38
    check-cast p1, Lcom/p1/mobile/putong/data/LivePhoto;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/LivePhoto$1;->serialize(Lcom/p1/mobile/putong/data/LivePhoto;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
