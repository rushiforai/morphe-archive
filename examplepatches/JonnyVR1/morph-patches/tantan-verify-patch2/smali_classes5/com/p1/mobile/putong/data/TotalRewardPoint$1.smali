.class Lcom/p1/mobile/putong/data/TotalRewardPoint$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/TotalRewardPoint;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/TotalRewardPoint;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/TotalRewardPoint;)I
    .locals 2

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/TotalRewardPoint;->amount:D

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 9
    .line 10
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/data/TotalRewardPoint;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/TotalRewardPoint$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/TotalRewardPoint;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/TotalRewardPoint;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/TotalRewardPoint;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/TotalRewardPoint;-><init>()V

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
    const/16 v1, 0x9

    .line 11
    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/TotalRewardPoint;->amount:D

    .line 20
    .line 21
    goto :goto_0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/TotalRewardPoint$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/TotalRewardPoint;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/TotalRewardPoint;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/TotalRewardPoint;->amount:D

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8
    check-cast p1, Lcom/p1/mobile/putong/data/TotalRewardPoint;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/TotalRewardPoint$1;->serialize(Lcom/p1/mobile/putong/data/TotalRewardPoint;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
