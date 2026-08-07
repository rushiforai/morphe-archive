.class Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;->status:Lcom/p1/mobile/putong/core/data/BoostStatus;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/BoostStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-static {v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 15
    .line 16
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 17
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;-><init>()V

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
    if-eqz v0, :cond_1

    .line 11
    .line 12
    const/16 v1, 0xa

    .line 13
    .line 14
    if-eq v0, v1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;->status:Lcom/p1/mobile/putong/core/data/BoostStatus;

    .line 17
    .line 18
    if-nez p1, :cond_2

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BoostStatus;->new_()Lcom/p1/mobile/putong/core/data/BoostStatus;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;->status:Lcom/p1/mobile/putong/core/data/BoostStatus;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/BoostStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/p1/mobile/putong/core/data/BoostStatus;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;->status:Lcom/p1/mobile/putong/core/data/BoostStatus;

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;->status:Lcom/p1/mobile/putong/core/data/BoostStatus;

    .line 39
    .line 40
    if-nez p1, :cond_2

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BoostStatus;->new_()Lcom/p1/mobile/putong/core/data/BoostStatus;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;->status:Lcom/p1/mobile/putong/core/data/BoostStatus;

    .line 47
    .line 48
    :cond_2
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 49
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;->status:Lcom/p1/mobile/putong/core/data/BoostStatus;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/data/BoostStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost$1;->serialize(Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
