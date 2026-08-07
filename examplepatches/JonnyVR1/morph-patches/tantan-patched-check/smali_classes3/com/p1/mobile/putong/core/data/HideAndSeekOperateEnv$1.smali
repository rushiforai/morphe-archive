.class Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/Meta;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;->data:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 20
    .line 21
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_1
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 27
    .line 28
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 29
    check-cast p1, Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;-><init>()V

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
    const/16 v1, 0xa

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 21
    .line 22
    if-nez p1, :cond_3

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/data/Meta;->new_()Lcom/p1/mobile/putong/data/Meta;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;->data:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/data/Meta;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lcom/p1/mobile/putong/data/Meta;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 54
    .line 55
    if-nez p1, :cond_3

    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/data/Meta;->new_()Lcom/p1/mobile/putong/data/Meta;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 62
    .line 63
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

    .line 64
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/Meta;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;->data:Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 p1, 0x2

    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
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

    .line 22
    check-cast p1, Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv$1;->serialize(Lcom/p1/mobile/putong/core/data/HideAndSeekOperateEnv;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
