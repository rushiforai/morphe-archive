.class Lcom/p1/mobile/putong/core/data/Prices$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Prices;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/Prices;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Prices;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Prices;->currencyCode:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

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
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 24
    .line 25
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    const/4 v0, 0x4

    .line 31
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Prices;->unitPrice:D

    .line 32
    .line 33
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    const/4 v0, 0x5

    .line 39
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Prices;->originalPrice:D

    .line 40
    .line 41
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    const/4 v0, 0x6

    .line 47
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Prices;->originalUnitPrice:D

    .line 48
    .line 49
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    const/4 v0, 0x7

    .line 55
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Prices;->noneRenewalPrice:D

    .line 56
    .line 57
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    const/16 v0, 0x8

    .line 63
    .line 64
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Prices;->noneRenewalUnitPrice:D

    .line 65
    .line 66
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    add-int/2addr p0, v0

    .line 71
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 72
    .line 73
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 74
    check-cast p1, Lcom/p1/mobile/putong/core/data/Prices;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Prices$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Prices;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Prices;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/Prices;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/Prices;-><init>()V

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
    if-eqz v0, :cond_9

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_8

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_7

    .line 21
    .line 22
    const/16 v2, 0x19

    .line 23
    .line 24
    if-eq v0, v2, :cond_6

    .line 25
    .line 26
    const/16 v2, 0x21

    .line 27
    .line 28
    if-eq v0, v2, :cond_5

    .line 29
    .line 30
    const/16 v2, 0x29

    .line 31
    .line 32
    if-eq v0, v2, :cond_4

    .line 33
    .line 34
    const/16 v2, 0x31

    .line 35
    .line 36
    if-eq v0, v2, :cond_3

    .line 37
    .line 38
    const/16 v2, 0x39

    .line 39
    .line 40
    if-eq v0, v2, :cond_2

    .line 41
    .line 42
    const/16 v2, 0x41

    .line 43
    .line 44
    if-eq v0, v2, :cond_1

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Prices;->currencyCode:Ljava/lang/String;

    .line 47
    .line 48
    if-nez p1, :cond_0

    .line 49
    .line 50
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Prices;->currencyCode:Ljava/lang/String;

    .line 51
    .line 52
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    .line 53
    .line 54
    if-nez p1, :cond_b

    .line 55
    .line 56
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    .line 57
    .line 58
    return-object p0

    .line 59
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 60
    .line 61
    .line 62
    move-result-wide v0

    .line 63
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/Prices;->noneRenewalUnitPrice:D

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 67
    .line 68
    .line 69
    move-result-wide v0

    .line 70
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/Prices;->noneRenewalPrice:D

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 74
    .line 75
    .line 76
    move-result-wide v0

    .line 77
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/Prices;->originalUnitPrice:D

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 81
    .line 82
    .line 83
    move-result-wide v0

    .line 84
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/Prices;->originalPrice:D

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 88
    .line 89
    .line 90
    move-result-wide v0

    .line 91
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/Prices;->unitPrice:D

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 95
    .line 96
    .line 97
    move-result-wide v0

    .line 98
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Prices;->currencyCode:Ljava/lang/String;

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Prices;->currencyCode:Ljava/lang/String;

    .line 116
    .line 117
    if-nez p1, :cond_a

    .line 118
    .line 119
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Prices;->currencyCode:Ljava/lang/String;

    .line 120
    .line 121
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    .line 122
    .line 123
    if-nez p1, :cond_b

    .line 124
    .line 125
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    .line 126
    .line 127
    :cond_b
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 128
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Prices$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Prices;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/Prices;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Prices;->currencyCode:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

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
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 19
    .line 20
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x4

    .line 24
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Prices;->unitPrice:D

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x5

    .line 30
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Prices;->originalPrice:D

    .line 31
    .line 32
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x6

    .line 36
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Prices;->originalUnitPrice:D

    .line 37
    .line 38
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x7

    .line 42
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Prices;->noneRenewalPrice:D

    .line 43
    .line 44
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 45
    .line 46
    .line 47
    const/16 p0, 0x8

    .line 48
    .line 49
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Prices;->noneRenewalUnitPrice:D

    .line 50
    .line 51
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 55
    check-cast p1, Lcom/p1/mobile/putong/core/data/Prices;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Prices$1;->serialize(Lcom/p1/mobile/putong/core/data/Prices;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
