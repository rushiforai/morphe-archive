.class Lcom/p1/mobile/putong/core/data/IntlInsertCardData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/IntlInsertCardData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/IntlInsertCardData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/IntlInsertCardData;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->id:Ljava/lang/String;

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
    iget v1, p1, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->cardType:I

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/2addr p0, v0

    .line 20
    const/4 v0, 0x3

    .line 21
    iget v1, p1, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->showType:I

    .line 22
    .line 23
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->buzzUser:Lcom/p1/mobile/putong/core/data/BuzzUser;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    const/4 v1, 0x4

    .line 33
    sget-object v2, Lcom/p1/mobile/putong/core/data/BuzzUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 34
    .line 35
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->floatUserCardData:Lcom/p1/mobile/putong/core/data/FloatUserCardData;

    .line 41
    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    const/4 v1, 0x5

    .line 45
    sget-object v2, Lcom/p1/mobile/putong/core/data/FloatUserCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 46
    .line 47
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->recallMembership:Lcom/p1/mobile/putong/core/data/RecallMembershipData;

    .line 53
    .line 54
    if-eqz v0, :cond_3

    .line 55
    .line 56
    const/4 v1, 0x6

    .line 57
    sget-object v2, Lcom/p1/mobile/putong/core/data/RecallMembershipData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 58
    .line 59
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    :cond_3
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 65
    .line 66
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 67
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/IntlInsertCardData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/IntlInsertCardData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/IntlInsertCardData;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;-><init>()V

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
    if-eqz v0, :cond_7

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_6

    .line 17
    .line 18
    const/16 v2, 0x10

    .line 19
    .line 20
    if-eq v0, v2, :cond_5

    .line 21
    .line 22
    const/16 v2, 0x18

    .line 23
    .line 24
    if-eq v0, v2, :cond_4

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_3

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_2

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_1

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->id:Ljava/lang/String;

    .line 39
    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->id:Ljava/lang/String;

    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->floatUserCardData:Lcom/p1/mobile/putong/core/data/FloatUserCardData;

    .line 45
    .line 46
    if-nez p1, :cond_9

    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/core/data/FloatUserCardData;->new_()Lcom/p1/mobile/putong/core/data/FloatUserCardData;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->floatUserCardData:Lcom/p1/mobile/putong/core/data/FloatUserCardData;

    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/RecallMembershipData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Lcom/p1/mobile/putong/core/data/RecallMembershipData;

    .line 62
    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->recallMembership:Lcom/p1/mobile/putong/core/data/RecallMembershipData;

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/FloatUserCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Lcom/p1/mobile/putong/core/data/FloatUserCardData;

    .line 73
    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->floatUserCardData:Lcom/p1/mobile/putong/core/data/FloatUserCardData;

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/BuzzUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Lcom/p1/mobile/putong/core/data/BuzzUser;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->buzzUser:Lcom/p1/mobile/putong/core/data/BuzzUser;

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iput v0, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->showType:I

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    iput v0, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->cardType:I

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->id:Ljava/lang/String;

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->id:Ljava/lang/String;

    .line 110
    .line 111
    if-nez p1, :cond_8

    .line 112
    .line 113
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->id:Ljava/lang/String;

    .line 114
    .line 115
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->floatUserCardData:Lcom/p1/mobile/putong/core/data/FloatUserCardData;

    .line 116
    .line 117
    if-nez p1, :cond_9

    .line 118
    .line 119
    invoke-static {}, Lcom/p1/mobile/putong/core/data/FloatUserCardData;->new_()Lcom/p1/mobile/putong/core/data/FloatUserCardData;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->floatUserCardData:Lcom/p1/mobile/putong/core/data/FloatUserCardData;

    .line 124
    .line 125
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

    .line 126
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/IntlInsertCardData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/IntlInsertCardData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->id:Ljava/lang/String;

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
    iget v0, p1, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->cardType:I

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x3

    .line 16
    iget v0, p1, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->showType:I

    .line 17
    .line 18
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->buzzUser:Lcom/p1/mobile/putong/core/data/BuzzUser;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x4

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/data/BuzzUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->floatUserCardData:Lcom/p1/mobile/putong/core/data/FloatUserCardData;

    .line 32
    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    const/4 v0, 0x5

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/core/data/FloatUserCardData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 37
    .line 38
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 39
    .line 40
    .line 41
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->recallMembership:Lcom/p1/mobile/putong/core/data/RecallMembershipData;

    .line 42
    .line 43
    if-eqz p0, :cond_3

    .line 44
    .line 45
    const/4 p1, 0x6

    .line 46
    sget-object v0, Lcom/p1/mobile/putong/core/data/RecallMembershipData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 49
    .line 50
    .line 51
    :cond_3
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 52
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/IntlInsertCardData$1;->serialize(Lcom/p1/mobile/putong/core/data/IntlInsertCardData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
