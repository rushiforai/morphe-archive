.class Lcom/p1/mobile/putong/data/SearchRadius$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/SearchRadius;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/SearchRadius;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/SearchRadius;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SearchRadius;->value:Ljava/lang/Integer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SearchRadius;->allowedMaximum:Ljava/lang/Integer;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SearchRadius;->allowedMinimum:Ljava/lang/Integer;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x3

    .line 35
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_2
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 45
    .line 46
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 47
    check-cast p1, Lcom/p1/mobile/putong/data/SearchRadius;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/SearchRadius$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/SearchRadius;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/SearchRadius;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    new-instance v0, Lcom/p1/mobile/putong/data/SearchRadius;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SearchRadius;-><init>()V

    .line 9
    .line 10
    .line 11
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_5

    .line 16
    .line 17
    const/16 v2, 0x8

    .line 18
    .line 19
    if-eq v1, v2, :cond_4

    .line 20
    .line 21
    const/16 v2, 0x10

    .line 22
    .line 23
    if-eq v1, v2, :cond_3

    .line 24
    .line 25
    const/16 v2, 0x18

    .line 26
    .line 27
    if-eq v1, v2, :cond_2

    .line 28
    .line 29
    iget-object p1, v0, Lcom/p1/mobile/putong/data/SearchRadius;->value:Ljava/lang/Integer;

    .line 30
    .line 31
    if-nez p1, :cond_0

    .line 32
    .line 33
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SearchRadius;->value:Ljava/lang/Integer;

    .line 34
    .line 35
    :cond_0
    iget-object p1, v0, Lcom/p1/mobile/putong/data/SearchRadius;->allowedMaximum:Ljava/lang/Integer;

    .line 36
    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SearchRadius;->allowedMaximum:Ljava/lang/Integer;

    .line 40
    .line 41
    :cond_1
    iget-object p1, v0, Lcom/p1/mobile/putong/data/SearchRadius;->allowedMinimum:Ljava/lang/Integer;

    .line 42
    .line 43
    if-nez p1, :cond_8

    .line 44
    .line 45
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SearchRadius;->allowedMinimum:Ljava/lang/Integer;

    .line 46
    .line 47
    return-object v0

    .line 48
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SearchRadius;->allowedMinimum:Ljava/lang/Integer;

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SearchRadius;->allowedMaximum:Ljava/lang/Integer;

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SearchRadius;->value:Ljava/lang/Integer;

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_5
    iget-object p1, v0, Lcom/p1/mobile/putong/data/SearchRadius;->value:Ljava/lang/Integer;

    .line 82
    .line 83
    if-nez p1, :cond_6

    .line 84
    .line 85
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SearchRadius;->value:Ljava/lang/Integer;

    .line 86
    .line 87
    :cond_6
    iget-object p1, v0, Lcom/p1/mobile/putong/data/SearchRadius;->allowedMaximum:Ljava/lang/Integer;

    .line 88
    .line 89
    if-nez p1, :cond_7

    .line 90
    .line 91
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SearchRadius;->allowedMaximum:Ljava/lang/Integer;

    .line 92
    .line 93
    :cond_7
    iget-object p1, v0, Lcom/p1/mobile/putong/data/SearchRadius;->allowedMinimum:Ljava/lang/Integer;

    .line 94
    .line 95
    if-nez p1, :cond_8

    .line 96
    .line 97
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SearchRadius;->allowedMinimum:Ljava/lang/Integer;

    .line 98
    .line 99
    :cond_8
    return-object v0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 100
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/SearchRadius$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/SearchRadius;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/SearchRadius;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SearchRadius;->value:Ljava/lang/Integer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SearchRadius;->allowedMaximum:Ljava/lang/Integer;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SearchRadius;->allowedMinimum:Ljava/lang/Integer;

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    const/4 p1, 0x3

    .line 30
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 35
    .line 36
    .line 37
    :cond_2
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
    check-cast p1, Lcom/p1/mobile/putong/data/SearchRadius;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/SearchRadius$1;->serialize(Lcom/p1/mobile/putong/data/SearchRadius;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
