.class Lcom/p1/mobile/putong/core/data/NewGiftWall$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/NewGiftWall;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/NewGiftWall;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/NewGiftWall;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/core/data/NewGiftWall;->count:I

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NewGiftWall;->giftInfo:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    sget-object v2, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 14
    .line 15
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/2addr p0, v0

    .line 20
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NewGiftWall;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NewGiftWall;->totalPrice:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NewGiftWall;->unitPrice:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    const/4 v1, 0x5

    .line 45
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_3
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 51
    .line 52
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 53
    check-cast p1, Lcom/p1/mobile/putong/core/data/NewGiftWall;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/NewGiftWall$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/NewGiftWall;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/NewGiftWall;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/NewGiftWall;-><init>()V

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
    const/16 v2, 0x8

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
    const/16 v2, 0x22

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->giftInfo:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 35
    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->new_()Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->giftInfo:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->id:Ljava/lang/String;

    .line 45
    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->id:Ljava/lang/String;

    .line 49
    .line 50
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->totalPrice:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_2

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->totalPrice:Ljava/lang/String;

    .line 55
    .line 56
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->unitPrice:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_c

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->unitPrice:Ljava/lang/String;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->unitPrice:Ljava/lang/String;

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->totalPrice:Ljava/lang/String;

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->id:Ljava/lang/String;

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 85
    .line 86
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 91
    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->giftInfo:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    iput v0, p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->count:I

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->giftInfo:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 103
    .line 104
    if-nez p1, :cond_9

    .line 105
    .line 106
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->new_()Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->giftInfo:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 111
    .line 112
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->id:Ljava/lang/String;

    .line 113
    .line 114
    if-nez p1, :cond_a

    .line 115
    .line 116
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->id:Ljava/lang/String;

    .line 117
    .line 118
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->totalPrice:Ljava/lang/String;

    .line 119
    .line 120
    if-nez p1, :cond_b

    .line 121
    .line 122
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->totalPrice:Ljava/lang/String;

    .line 123
    .line 124
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->unitPrice:Ljava/lang/String;

    .line 125
    .line 126
    if-nez p1, :cond_c

    .line 127
    .line 128
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewGiftWall;->unitPrice:Ljava/lang/String;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/NewGiftWall$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/NewGiftWall;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/NewGiftWall;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/core/data/NewGiftWall;->count:I

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NewGiftWall;->giftInfo:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 13
    .line 14
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NewGiftWall;->id:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NewGiftWall;->totalPrice:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NewGiftWall;->unitPrice:Ljava/lang/String;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/NewGiftWall;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/NewGiftWall$1;->serialize(Lcom/p1/mobile/putong/core/data/NewGiftWall;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
