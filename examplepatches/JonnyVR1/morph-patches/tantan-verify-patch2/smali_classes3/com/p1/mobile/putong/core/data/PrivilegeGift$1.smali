.class Lcom/p1/mobile/putong/core/data/PrivilegeGift$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/PrivilegeGift;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/PrivilegeGift;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/PrivilegeGift;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->remaining:I

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->privilegeType:Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    sget-object v2, Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->id:Ljava/lang/String;

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
    const/4 v0, 0x4

    .line 31
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->highProbabilityBuyUser:Z

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 39
    .line 40
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 41
    check-cast p1, Lcom/p1/mobile/putong/core/data/PrivilegeGift;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/PrivilegeGift$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/PrivilegeGift;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/PrivilegeGift;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/PrivilegeGift;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/PrivilegeGift;-><init>()V

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
    if-eqz v0, :cond_5

    .line 13
    .line 14
    const/16 v2, 0x8

    .line 15
    .line 16
    if-eq v0, v2, :cond_4

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_3

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_2

    .line 25
    .line 26
    const/16 v2, 0x20

    .line 27
    .line 28
    if-eq v0, v2, :cond_1

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->privilegeType:Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;

    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    sget-object p1, Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;

    .line 41
    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->privilegeType:Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;

    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->id:Ljava/lang/String;

    .line 45
    .line 46
    if-nez p1, :cond_7

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->id:Ljava/lang/String;

    .line 49
    .line 50
    return-object p0

    .line 51
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->highProbabilityBuyUser:Z

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->id:Ljava/lang/String;

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 66
    .line 67
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->privilegeType:Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iput v0, p0, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->remaining:I

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->privilegeType:Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;

    .line 84
    .line 85
    if-nez p1, :cond_6

    .line 86
    .line 87
    sget-object p1, Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    check-cast p1, Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;

    .line 94
    .line 95
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->privilegeType:Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;

    .line 96
    .line 97
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->id:Ljava/lang/String;

    .line 98
    .line 99
    if-nez p1, :cond_7

    .line 100
    .line 101
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->id:Ljava/lang/String;

    .line 102
    .line 103
    :cond_7
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 104
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/PrivilegeGift$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/PrivilegeGift;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/PrivilegeGift;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->remaining:I

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->privilegeType:Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    sget-object v1, Lcom/p1/mobile/putong/core/data/PrivilegeGiftType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 13
    .line 14
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->id:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    const/4 p0, 0x4

    .line 26
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->highProbabilityBuyUser:Z

    .line 27
    .line 28
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 32
    check-cast p1, Lcom/p1/mobile/putong/core/data/PrivilegeGift;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/PrivilegeGift$1;->serialize(Lcom/p1/mobile/putong/core/data/PrivilegeGift;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
