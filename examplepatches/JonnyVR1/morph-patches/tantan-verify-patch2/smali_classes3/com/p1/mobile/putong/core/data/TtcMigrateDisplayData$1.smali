.class Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;->open:Z

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;->userList:Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayUserListData;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    sget-object v2, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayUserListData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 21
    .line 22
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 23
    check-cast p1, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;-><init>()V

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
    if-eqz v0, :cond_2

    .line 11
    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    if-eq v0, v1, :cond_1

    .line 15
    .line 16
    const/16 v1, 0x12

    .line 17
    .line 18
    if-eq v0, v1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;->userList:Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayUserListData;

    .line 21
    .line 22
    if-nez p1, :cond_3

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayUserListData;->new_()Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayUserListData;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;->userList:Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayUserListData;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayUserListData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayUserListData;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;->userList:Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayUserListData;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;->open:Z

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;->userList:Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayUserListData;

    .line 50
    .line 51
    if-nez p1, :cond_3

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayUserListData;->new_()Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayUserListData;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;->userList:Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayUserListData;

    .line 58
    .line 59
    :cond_3
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 60
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;->open:Z

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;->userList:Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayUserListData;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x2

    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayUserListData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 13
    .line 14
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 15
    .line 16
    .line 17
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

    .line 18
    check-cast p1, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData$1;->serialize(Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
