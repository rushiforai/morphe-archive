.class public Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum$a;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;",
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
.method public a(Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;)I
    .locals 1

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;->memberNum:I

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

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

.method public b(Ll/nc5;)Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;-><init>()V

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
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;->memberNum:I

    .line 20
    .line 21
    goto :goto_0
.end method

.method public c(Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;->memberNum:I

    .line 3
    .line 4
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum$a;->a(Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum$a;->b(Ll/nc5;)Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum$a;->c(Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
