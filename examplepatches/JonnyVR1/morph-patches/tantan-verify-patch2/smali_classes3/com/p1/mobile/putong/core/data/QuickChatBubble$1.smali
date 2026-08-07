.class Lcom/p1/mobile/putong/core/data/QuickChatBubble$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/QuickChatBubble;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/QuickChatBubble;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/QuickChatBubble;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->biz:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->stage:Ljava/lang/String;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    add-int/2addr p0, v0

    .line 22
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->type:Ljava/lang/String;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    sget-object v2, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 38
    .line 39
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_3
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 45
    .line 46
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 47
    check-cast p1, Lcom/p1/mobile/putong/core/data/QuickChatBubble;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/QuickChatBubble$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/QuickChatBubble;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/QuickChatBubble;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/QuickChatBubble;-><init>()V

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
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_5

    .line 21
    .line 22
    const/16 v2, 0x1a

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->biz:Ljava/lang/String;

    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->biz:Ljava/lang/String;

    .line 35
    .line 36
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->stage:Ljava/lang/String;

    .line 37
    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->stage:Ljava/lang/String;

    .line 41
    .line 42
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->type:Ljava/lang/String;

    .line 43
    .line 44
    if-nez p1, :cond_2

    .line 45
    .line 46
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->type:Ljava/lang/String;

    .line 47
    .line 48
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 49
    .line 50
    if-nez p1, :cond_b

    .line 51
    .line 52
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 59
    .line 60
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 70
    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->type:Ljava/lang/String;

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->stage:Ljava/lang/String;

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->biz:Ljava/lang/String;

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->biz:Ljava/lang/String;

    .line 96
    .line 97
    if-nez p1, :cond_8

    .line 98
    .line 99
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->biz:Ljava/lang/String;

    .line 100
    .line 101
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->stage:Ljava/lang/String;

    .line 102
    .line 103
    if-nez p1, :cond_9

    .line 104
    .line 105
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->stage:Ljava/lang/String;

    .line 106
    .line 107
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->type:Ljava/lang/String;

    .line 108
    .line 109
    if-nez p1, :cond_a

    .line 110
    .line 111
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->type:Ljava/lang/String;

    .line 112
    .line 113
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 114
    .line 115
    if-nez p1, :cond_b

    .line 116
    .line 117
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 118
    .line 119
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 124
    .line 125
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 126
    .line 127
    :cond_b
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 128
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/QuickChatBubble$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/QuickChatBubble;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/QuickChatBubble;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->biz:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->stage:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->type:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatBubble;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/4 p1, 0x4

    .line 30
    sget-object v0, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 31
    .line 32
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 33
    .line 34
    .line 35
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

    .line 36
    check-cast p1, Lcom/p1/mobile/putong/core/data/QuickChatBubble;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/QuickChatBubble$1;->serialize(Lcom/p1/mobile/putong/core/data/QuickChatBubble;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
