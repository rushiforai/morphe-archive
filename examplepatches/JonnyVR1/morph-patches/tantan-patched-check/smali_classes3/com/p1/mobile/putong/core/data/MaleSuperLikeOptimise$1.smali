.class Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->enabled:Z

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
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->useSuggestRank:Z

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    const/4 v0, 0x3

    .line 17
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->useCommercialRank:Z

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->highScale:Lcom/p1/mobile/putong/core/data/SwipeThreshold;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    const/4 v1, 0x4

    .line 29
    sget-object v2, Lcom/p1/mobile/putong/core/data/SwipeThreshold;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 30
    .line 31
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->midScale:Lcom/p1/mobile/putong/core/data/SwipeThreshold;

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    const/4 v1, 0x5

    .line 41
    sget-object v2, Lcom/p1/mobile/putong/core/data/SwipeThreshold;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 42
    .line 43
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    :cond_1
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 49
    .line 50
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 51
    check-cast p1, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;-><init>()V

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
    if-eqz v0, :cond_6

    .line 11
    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    if-eq v0, v1, :cond_5

    .line 15
    .line 16
    const/16 v1, 0x10

    .line 17
    .line 18
    if-eq v0, v1, :cond_4

    .line 19
    .line 20
    const/16 v1, 0x18

    .line 21
    .line 22
    if-eq v0, v1, :cond_3

    .line 23
    .line 24
    const/16 v1, 0x22

    .line 25
    .line 26
    if-eq v0, v1, :cond_2

    .line 27
    .line 28
    const/16 v1, 0x2a

    .line 29
    .line 30
    if-eq v0, v1, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->highScale:Lcom/p1/mobile/putong/core/data/SwipeThreshold;

    .line 33
    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SwipeThreshold;->new_()Lcom/p1/mobile/putong/core/data/SwipeThreshold;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->highScale:Lcom/p1/mobile/putong/core/data/SwipeThreshold;

    .line 41
    .line 42
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->midScale:Lcom/p1/mobile/putong/core/data/SwipeThreshold;

    .line 43
    .line 44
    if-nez p1, :cond_8

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SwipeThreshold;->new_()Lcom/p1/mobile/putong/core/data/SwipeThreshold;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->midScale:Lcom/p1/mobile/putong/core/data/SwipeThreshold;

    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeThreshold;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lcom/p1/mobile/putong/core/data/SwipeThreshold;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->midScale:Lcom/p1/mobile/putong/core/data/SwipeThreshold;

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeThreshold;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Lcom/p1/mobile/putong/core/data/SwipeThreshold;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->highScale:Lcom/p1/mobile/putong/core/data/SwipeThreshold;

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->useCommercialRank:Z

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->useSuggestRank:Z

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->enabled:Z

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->highScale:Lcom/p1/mobile/putong/core/data/SwipeThreshold;

    .line 97
    .line 98
    if-nez p1, :cond_7

    .line 99
    .line 100
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SwipeThreshold;->new_()Lcom/p1/mobile/putong/core/data/SwipeThreshold;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->highScale:Lcom/p1/mobile/putong/core/data/SwipeThreshold;

    .line 105
    .line 106
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->midScale:Lcom/p1/mobile/putong/core/data/SwipeThreshold;

    .line 107
    .line 108
    if-nez p1, :cond_8

    .line 109
    .line 110
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SwipeThreshold;->new_()Lcom/p1/mobile/putong/core/data/SwipeThreshold;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->midScale:Lcom/p1/mobile/putong/core/data/SwipeThreshold;

    .line 115
    .line 116
    :cond_8
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 117
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->enabled:Z

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->useSuggestRank:Z

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->useCommercialRank:Z

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->highScale:Lcom/p1/mobile/putong/core/data/SwipeThreshold;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x4

    .line 24
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeThreshold;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 25
    .line 26
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;->midScale:Lcom/p1/mobile/putong/core/data/SwipeThreshold;

    .line 30
    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    const/4 p1, 0x5

    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeThreshold;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 35
    .line 36
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 37
    .line 38
    .line 39
    :cond_1
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
    check-cast p1, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise$1;->serialize(Lcom/p1/mobile/putong/core/data/MaleSuperLikeOptimise;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
