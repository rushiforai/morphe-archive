.class Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->subChannel:Lcom/p1/mobile/putong/core/data/ConversationSubChannel;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->initiator:Ljava/lang/String;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->subChannel:Lcom/p1/mobile/putong/core/data/ConversationSubChannel;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationSubChannel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 32
    .line 33
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    :cond_2
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 39
    .line 40
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 41
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const-string v3, ""

    .line 13
    .line 14
    if-eqz v2, :cond_5

    .line 15
    .line 16
    const/16 v4, 0x8

    .line 17
    .line 18
    if-eq v2, v4, :cond_4

    .line 19
    .line 20
    const/16 v4, 0x12

    .line 21
    .line 22
    if-eq v2, v4, :cond_3

    .line 23
    .line 24
    const/16 v4, 0x1a

    .line 25
    .line 26
    if-eq v2, v4, :cond_2

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->subChannel:Lcom/p1/mobile/putong/core/data/ConversationSubChannel;

    .line 29
    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    sget-object p1, Lcom/p1/mobile/putong/core/data/ConversationSubChannel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationSubChannel;

    .line 45
    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->subChannel:Lcom/p1/mobile/putong/core/data/ConversationSubChannel;

    .line 47
    .line 48
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->subChannel:Lcom/p1/mobile/putong/core/data/ConversationSubChannel;

    .line 49
    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    sget-object p1, Lcom/p1/mobile/putong/core/data/ConversationSubChannel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationSubChannel;

    .line 59
    .line 60
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->subChannel:Lcom/p1/mobile/putong/core/data/ConversationSubChannel;

    .line 61
    .line 62
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->initiator:Ljava/lang/String;

    .line 63
    .line 64
    if-nez p1, :cond_8

    .line 65
    .line 66
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->initiator:Ljava/lang/String;

    .line 67
    .line 68
    return-object p0

    .line 69
    :cond_2
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationSubChannel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 70
    .line 71
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    check-cast v2, Lcom/p1/mobile/putong/core/data/ConversationSubChannel;

    .line 76
    .line 77
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->subChannel:Lcom/p1/mobile/putong/core/data/ConversationSubChannel;

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->initiator:Ljava/lang/String;

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    goto :goto_0

    .line 96
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->subChannel:Lcom/p1/mobile/putong/core/data/ConversationSubChannel;

    .line 97
    .line 98
    if-nez p1, :cond_6

    .line 99
    .line 100
    if-eqz v1, :cond_6

    .line 101
    .line 102
    sget-object p1, Lcom/p1/mobile/putong/core/data/ConversationSubChannel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 103
    .line 104
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationSubChannel;

    .line 113
    .line 114
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->subChannel:Lcom/p1/mobile/putong/core/data/ConversationSubChannel;

    .line 115
    .line 116
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->subChannel:Lcom/p1/mobile/putong/core/data/ConversationSubChannel;

    .line 117
    .line 118
    if-nez p1, :cond_7

    .line 119
    .line 120
    sget-object p1, Lcom/p1/mobile/putong/core/data/ConversationSubChannel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 121
    .line 122
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationSubChannel;

    .line 127
    .line 128
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->subChannel:Lcom/p1/mobile/putong/core/data/ConversationSubChannel;

    .line 129
    .line 130
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->initiator:Ljava/lang/String;

    .line 131
    .line 132
    if-nez p1, :cond_8

    .line 133
    .line 134
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->initiator:Ljava/lang/String;

    .line 135
    .line 136
    :cond_8
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 137
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->subChannel:Lcom/p1/mobile/putong/core/data/ConversationSubChannel;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->initiator:Ljava/lang/String;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->subChannel:Lcom/p1/mobile/putong/core/data/ConversationSubChannel;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 p1, 0x3

    .line 26
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationSubChannel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
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

    .line 32
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide$1;->serialize(Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
