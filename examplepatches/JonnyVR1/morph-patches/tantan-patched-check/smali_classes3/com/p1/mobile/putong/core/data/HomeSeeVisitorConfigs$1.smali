.class Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;)I
    .locals 2

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->homeShow:Z

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    iget v1, p1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->showNewTimes:I

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    const/4 v0, 0x3

    .line 17
    iget v1, p1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->showNewDurationSecond:I

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    const/4 v0, 0x4

    .line 25
    iget v1, p1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->basicSwipeNum:I

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    const/4 v0, 0x5

    .line 33
    iget v1, p1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->basicMatchNum:I

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    const/4 v0, 0x6

    .line 41
    iget v1, p1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->pullSwipeRandMaxNum:I

    .line 42
    .line 43
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 49
    .line 50
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 51
    check-cast p1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;-><init>()V

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
    const/16 v1, 0x8

    .line 11
    .line 12
    if-eq v0, v1, :cond_5

    .line 13
    .line 14
    const/16 v1, 0x10

    .line 15
    .line 16
    if-eq v0, v1, :cond_4

    .line 17
    .line 18
    const/16 v1, 0x18

    .line 19
    .line 20
    if-eq v0, v1, :cond_3

    .line 21
    .line 22
    const/16 v1, 0x20

    .line 23
    .line 24
    if-eq v0, v1, :cond_2

    .line 25
    .line 26
    const/16 v1, 0x28

    .line 27
    .line 28
    if-eq v0, v1, :cond_1

    .line 29
    .line 30
    const/16 v1, 0x30

    .line 31
    .line 32
    if-eq v0, v1, :cond_0

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_0
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput v0, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->pullSwipeRandMaxNum:I

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iput v0, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->basicMatchNum:I

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iput v0, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->basicSwipeNum:I

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iput v0, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->showNewDurationSecond:I

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    iput v0, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->showNewTimes:I

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->homeShow:Z

    .line 75
    .line 76
    goto :goto_0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 77
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->homeShow:Z

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget v0, p1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->showNewTimes:I

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    iget v0, p1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->showNewDurationSecond:I

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x4

    .line 20
    iget v0, p1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->basicSwipeNum:I

    .line 21
    .line 22
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x5

    .line 26
    iget v0, p1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->basicMatchNum:I

    .line 27
    .line 28
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x6

    .line 32
    iget p1, p1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->pullSwipeRandMaxNum:I

    .line 33
    .line 34
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs$1;->serialize(Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
