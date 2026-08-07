.class Lcom/p1/mobile/putong/core/data/ActionToast$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ActionToast;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/ActionToast;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ActionToast;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionToast;->mainImg:Ljava/lang/String;

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
    const/4 v0, 0x2

    .line 13
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/ActionToast;->loveImg:Z

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/2addr p0, v0

    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionToast;->message:Ljava/lang/String;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionToast;->option:Lcom/p1/mobile/putong/core/data/CardOption;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x4

    .line 35
    sget-object v2, Lcom/p1/mobile/putong/core/data/CardOption;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 36
    .line 37
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_2
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 43
    .line 44
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 45
    check-cast p1, Lcom/p1/mobile/putong/core/data/ActionToast;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ActionToast$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ActionToast;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ActionToast;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ActionToast;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ActionToast;-><init>()V

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
    if-eqz v0, :cond_6

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_5

    .line 17
    .line 18
    const/16 v2, 0x10

    .line 19
    .line 20
    if-eq v0, v2, :cond_4

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_3

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_2

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToast;->mainImg:Ljava/lang/String;

    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionToast;->mainImg:Ljava/lang/String;

    .line 35
    .line 36
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToast;->message:Ljava/lang/String;

    .line 37
    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionToast;->message:Ljava/lang/String;

    .line 41
    .line 42
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToast;->option:Lcom/p1/mobile/putong/core/data/CardOption;

    .line 43
    .line 44
    if-nez p1, :cond_9

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CardOption;->new_()Lcom/p1/mobile/putong/core/data/CardOption;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToast;->option:Lcom/p1/mobile/putong/core/data/CardOption;

    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardOption;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lcom/p1/mobile/putong/core/data/CardOption;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionToast;->option:Lcom/p1/mobile/putong/core/data/CardOption;

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionToast;->message:Ljava/lang/String;

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/ActionToast;->loveImg:Z

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionToast;->mainImg:Ljava/lang/String;

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToast;->mainImg:Ljava/lang/String;

    .line 86
    .line 87
    if-nez p1, :cond_7

    .line 88
    .line 89
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionToast;->mainImg:Ljava/lang/String;

    .line 90
    .line 91
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToast;->message:Ljava/lang/String;

    .line 92
    .line 93
    if-nez p1, :cond_8

    .line 94
    .line 95
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionToast;->message:Ljava/lang/String;

    .line 96
    .line 97
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToast;->option:Lcom/p1/mobile/putong/core/data/CardOption;

    .line 98
    .line 99
    if-nez p1, :cond_9

    .line 100
    .line 101
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CardOption;->new_()Lcom/p1/mobile/putong/core/data/CardOption;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToast;->option:Lcom/p1/mobile/putong/core/data/CardOption;

    .line 106
    .line 107
    :cond_9
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 108
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ActionToast$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ActionToast;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/ActionToast;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionToast;->mainImg:Ljava/lang/String;

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
    const/4 p0, 0x2

    .line 10
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/ActionToast;->loveImg:Z

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionToast;->message:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionToast;->option:Lcom/p1/mobile/putong/core/data/CardOption;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 p1, 0x4

    .line 28
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardOption;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 29
    .line 30
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 31
    .line 32
    .line 33
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

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/core/data/ActionToast;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ActionToast$1;->serialize(Lcom/p1/mobile/putong/core/data/ActionToast;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
