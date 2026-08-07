.class Lcom/p1/mobile/putong/data/VisitPlace$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/VisitPlace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/VisitPlace;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/VisitPlace;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VisitPlace;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VisitPlace;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/data/Owner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 18
    .line 19
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VisitPlace;->placeName:Ljava/lang/String;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const/4 v1, 0x3

    .line 29
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

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
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/VisitPlace;->latitude:D

    .line 36
    .line 37
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    const/4 v0, 0x5

    .line 43
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/VisitPlace;->longitude:D

    .line 44
    .line 45
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 51
    .line 52
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 53
    check-cast p1, Lcom/p1/mobile/putong/data/VisitPlace;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VisitPlace$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/VisitPlace;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VisitPlace;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/VisitPlace;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/VisitPlace;-><init>()V

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
    if-eqz v0, :cond_7

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_6

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_5

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_4

    .line 25
    .line 26
    const/16 v2, 0x21

    .line 27
    .line 28
    if-eq v0, v2, :cond_3

    .line 29
    .line 30
    const/16 v2, 0x29

    .line 31
    .line 32
    if-eq v0, v2, :cond_2

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VisitPlace;->id:Ljava/lang/String;

    .line 35
    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VisitPlace;->id:Ljava/lang/String;

    .line 39
    .line 40
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VisitPlace;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 41
    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/data/Owner;->new_()Lcom/p1/mobile/putong/data/Owner;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VisitPlace;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 49
    .line 50
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VisitPlace;->placeName:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_a

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VisitPlace;->placeName:Ljava/lang/String;

    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 58
    .line 59
    .line 60
    move-result-wide v0

    .line 61
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/VisitPlace;->longitude:D

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 65
    .line 66
    .line 67
    move-result-wide v0

    .line 68
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/VisitPlace;->latitude:D

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VisitPlace;->placeName:Ljava/lang/String;

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/data/Owner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Lcom/p1/mobile/putong/data/Owner;

    .line 85
    .line 86
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VisitPlace;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VisitPlace;->id:Ljava/lang/String;

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VisitPlace;->id:Ljava/lang/String;

    .line 97
    .line 98
    if-nez p1, :cond_8

    .line 99
    .line 100
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VisitPlace;->id:Ljava/lang/String;

    .line 101
    .line 102
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VisitPlace;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 103
    .line 104
    if-nez p1, :cond_9

    .line 105
    .line 106
    invoke-static {}, Lcom/p1/mobile/putong/data/Owner;->new_()Lcom/p1/mobile/putong/data/Owner;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VisitPlace;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 111
    .line 112
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VisitPlace;->placeName:Ljava/lang/String;

    .line 113
    .line 114
    if-nez p1, :cond_a

    .line 115
    .line 116
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VisitPlace;->placeName:Ljava/lang/String;

    .line 117
    .line 118
    :cond_a
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 119
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VisitPlace$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VisitPlace;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/VisitPlace;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VisitPlace;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VisitPlace;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/data/Owner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VisitPlace;->placeName:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_2
    const/4 p0, 0x4

    .line 28
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/VisitPlace;->latitude:D

    .line 29
    .line 30
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x5

    .line 34
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/VisitPlace;->longitude:D

    .line 35
    .line 36
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/data/VisitPlace;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/VisitPlace$1;->serialize(Lcom/p1/mobile/putong/data/VisitPlace;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
