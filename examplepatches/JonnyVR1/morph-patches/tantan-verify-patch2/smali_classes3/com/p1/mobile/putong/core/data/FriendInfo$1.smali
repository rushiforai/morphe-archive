.class Lcom/p1/mobile/putong/core/data/FriendInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/FriendInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/FriendInfo;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/FriendInfo;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FriendInfo;->userId:Ljava/lang/String;

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
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/FriendInfo;->lastActivity:D

    .line 14
    .line 15
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/2addr p0, v0

    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FriendInfo;->suggest:Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    sget-object v2, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 26
    .line 27
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    :cond_1
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 33
    .line 34
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 35
    check-cast p1, Lcom/p1/mobile/putong/core/data/FriendInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/FriendInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/FriendInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/FriendInfo;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/FriendInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/FriendInfo;-><init>()V

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
    if-eqz v0, :cond_4

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_3

    .line 17
    .line 18
    const/16 v2, 0x11

    .line 19
    .line 20
    if-eq v0, v2, :cond_2

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendInfo;->userId:Ljava/lang/String;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/FriendInfo;->userId:Ljava/lang/String;

    .line 31
    .line 32
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendInfo;->suggest:Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;

    .line 33
    .line 34
    if-nez p1, :cond_6

    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->new_()Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendInfo;->suggest:Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;

    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/FriendInfo;->suggest:Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 55
    .line 56
    .line 57
    move-result-wide v0

    .line 58
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/FriendInfo;->lastActivity:D

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/FriendInfo;->userId:Ljava/lang/String;

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendInfo;->userId:Ljava/lang/String;

    .line 69
    .line 70
    if-nez p1, :cond_5

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/FriendInfo;->userId:Ljava/lang/String;

    .line 73
    .line 74
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendInfo;->suggest:Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;

    .line 75
    .line 76
    if-nez p1, :cond_6

    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->new_()Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendInfo;->suggest:Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;

    .line 83
    .line 84
    :cond_6
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 85
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/FriendInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/FriendInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/FriendInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FriendInfo;->userId:Ljava/lang/String;

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
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/FriendInfo;->lastActivity:D

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FriendInfo;->suggest:Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 p1, 0x3

    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 21
    .line 22
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 23
    .line 24
    .line 25
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

    .line 26
    check-cast p1, Lcom/p1/mobile/putong/core/data/FriendInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/FriendInfo$1;->serialize(Lcom/p1/mobile/putong/core/data/FriendInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
