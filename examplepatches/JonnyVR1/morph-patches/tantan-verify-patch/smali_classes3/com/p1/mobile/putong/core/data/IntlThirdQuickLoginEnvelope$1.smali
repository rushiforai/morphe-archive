.class Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;->meta:Lcom/p1/mobile/putong/data/Meta;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginData;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;-><init>()V

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
    if-eqz v0, :cond_3

    .line 11
    .line 12
    const/16 v1, 0xa

    .line 13
    .line 14
    if-eq v0, v1, :cond_2

    .line 15
    .line 16
    const/16 v1, 0x12

    .line 17
    .line 18
    if-eq v0, v1, :cond_1

    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 21
    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/data/Meta;->new_()Lcom/p1/mobile/putong/data/Meta;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 29
    .line 30
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginData;

    .line 31
    .line 32
    if-nez p1, :cond_5

    .line 33
    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginData;->new_()Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginData;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginData;

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginData;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginData;

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/data/Meta;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lcom/p1/mobile/putong/data/Meta;

    .line 59
    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 64
    .line 65
    if-nez p1, :cond_4

    .line 66
    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/data/Meta;->new_()Lcom/p1/mobile/putong/data/Meta;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 72
    .line 73
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginData;

    .line 74
    .line 75
    if-nez p1, :cond_5

    .line 76
    .line 77
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginData;->new_()Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginData;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginData;

    .line 82
    .line 83
    :cond_5
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 84
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;->meta:Lcom/p1/mobile/putong/data/Meta;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginData;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 p1, 0x2

    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope$1;->serialize(Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
