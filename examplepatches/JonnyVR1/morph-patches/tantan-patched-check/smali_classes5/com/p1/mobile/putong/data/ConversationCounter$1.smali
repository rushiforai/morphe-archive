.class Lcom/p1/mobile/putong/data/ConversationCounter$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/ConversationCounter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/ConversationCounter;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/ConversationCounter;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/ConversationCounter;->conversations:Lcom/p1/mobile/putong/data/CounterConversations;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/CounterConversations;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/ConversationCounter;->messages:Lcom/p1/mobile/putong/data/CounterMessages;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/data/CounterMessages;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    const/4 v0, 0x3

    .line 27
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/ConversationCounter;->updatedTime:D

    .line 28
    .line 29
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    iget-object v0, p1, Lcom/p1/mobile/putong/data/ConversationCounter;->groupMessages:Lcom/p1/mobile/putong/data/CounterMessages;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    const/4 v1, 0x4

    .line 39
    sget-object v2, Lcom/p1/mobile/putong/data/CounterMessages;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 40
    .line 41
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/ConversationCounter;->groupConversations:Lcom/p1/mobile/putong/data/CounterConversations;

    .line 47
    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    const/4 v1, 0x5

    .line 51
    sget-object v2, Lcom/p1/mobile/putong/data/CounterConversations;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 52
    .line 53
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_3
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 59
    .line 60
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 61
    check-cast p1, Lcom/p1/mobile/putong/data/ConversationCounter;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/ConversationCounter$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/ConversationCounter;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/ConversationCounter;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/ConversationCounter;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/ConversationCounter;-><init>()V

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
    if-eqz v0, :cond_8

    .line 11
    .line 12
    const/16 v1, 0xa

    .line 13
    .line 14
    if-eq v0, v1, :cond_7

    .line 15
    .line 16
    const/16 v1, 0x12

    .line 17
    .line 18
    if-eq v0, v1, :cond_6

    .line 19
    .line 20
    const/16 v1, 0x19

    .line 21
    .line 22
    if-eq v0, v1, :cond_5

    .line 23
    .line 24
    const/16 v1, 0x22

    .line 25
    .line 26
    if-eq v0, v1, :cond_4

    .line 27
    .line 28
    const/16 v1, 0x2a

    .line 29
    .line 30
    if-eq v0, v1, :cond_3

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/data/ConversationCounter;->conversations:Lcom/p1/mobile/putong/data/CounterConversations;

    .line 33
    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterConversations;->new_()Lcom/p1/mobile/putong/data/CounterConversations;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/data/ConversationCounter;->conversations:Lcom/p1/mobile/putong/data/CounterConversations;

    .line 41
    .line 42
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/ConversationCounter;->messages:Lcom/p1/mobile/putong/data/CounterMessages;

    .line 43
    .line 44
    if-nez p1, :cond_1

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterMessages;->new_()Lcom/p1/mobile/putong/data/CounterMessages;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, p0, Lcom/p1/mobile/putong/data/ConversationCounter;->messages:Lcom/p1/mobile/putong/data/CounterMessages;

    .line 51
    .line 52
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/ConversationCounter;->groupMessages:Lcom/p1/mobile/putong/data/CounterMessages;

    .line 53
    .line 54
    if-nez p1, :cond_2

    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterMessages;->new_()Lcom/p1/mobile/putong/data/CounterMessages;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iput-object p1, p0, Lcom/p1/mobile/putong/data/ConversationCounter;->groupMessages:Lcom/p1/mobile/putong/data/CounterMessages;

    .line 61
    .line 62
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/ConversationCounter;->groupConversations:Lcom/p1/mobile/putong/data/CounterConversations;

    .line 63
    .line 64
    if-nez p1, :cond_c

    .line 65
    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterConversations;->new_()Lcom/p1/mobile/putong/data/CounterConversations;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/data/ConversationCounter;->groupConversations:Lcom/p1/mobile/putong/data/CounterConversations;

    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/data/CounterConversations;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Lcom/p1/mobile/putong/data/CounterConversations;

    .line 80
    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/data/ConversationCounter;->groupConversations:Lcom/p1/mobile/putong/data/CounterConversations;

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/data/CounterMessages;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 85
    .line 86
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Lcom/p1/mobile/putong/data/CounterMessages;

    .line 91
    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/data/ConversationCounter;->groupMessages:Lcom/p1/mobile/putong/data/CounterMessages;

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 96
    .line 97
    .line 98
    move-result-wide v0

    .line 99
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/ConversationCounter;->updatedTime:D

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/data/CounterMessages;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 103
    .line 104
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    check-cast v0, Lcom/p1/mobile/putong/data/CounterMessages;

    .line 109
    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/data/ConversationCounter;->messages:Lcom/p1/mobile/putong/data/CounterMessages;

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/data/CounterConversations;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 114
    .line 115
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    check-cast v0, Lcom/p1/mobile/putong/data/CounterConversations;

    .line 120
    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/data/ConversationCounter;->conversations:Lcom/p1/mobile/putong/data/CounterConversations;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/ConversationCounter;->conversations:Lcom/p1/mobile/putong/data/CounterConversations;

    .line 125
    .line 126
    if-nez p1, :cond_9

    .line 127
    .line 128
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterConversations;->new_()Lcom/p1/mobile/putong/data/CounterConversations;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    iput-object p1, p0, Lcom/p1/mobile/putong/data/ConversationCounter;->conversations:Lcom/p1/mobile/putong/data/CounterConversations;

    .line 133
    .line 134
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/ConversationCounter;->messages:Lcom/p1/mobile/putong/data/CounterMessages;

    .line 135
    .line 136
    if-nez p1, :cond_a

    .line 137
    .line 138
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterMessages;->new_()Lcom/p1/mobile/putong/data/CounterMessages;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    iput-object p1, p0, Lcom/p1/mobile/putong/data/ConversationCounter;->messages:Lcom/p1/mobile/putong/data/CounterMessages;

    .line 143
    .line 144
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/ConversationCounter;->groupMessages:Lcom/p1/mobile/putong/data/CounterMessages;

    .line 145
    .line 146
    if-nez p1, :cond_b

    .line 147
    .line 148
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterMessages;->new_()Lcom/p1/mobile/putong/data/CounterMessages;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    iput-object p1, p0, Lcom/p1/mobile/putong/data/ConversationCounter;->groupMessages:Lcom/p1/mobile/putong/data/CounterMessages;

    .line 153
    .line 154
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/ConversationCounter;->groupConversations:Lcom/p1/mobile/putong/data/CounterConversations;

    .line 155
    .line 156
    if-nez p1, :cond_c

    .line 157
    .line 158
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterConversations;->new_()Lcom/p1/mobile/putong/data/CounterConversations;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    iput-object p1, p0, Lcom/p1/mobile/putong/data/ConversationCounter;->groupConversations:Lcom/p1/mobile/putong/data/CounterConversations;

    .line 163
    .line 164
    :cond_c
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 165
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/ConversationCounter$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/ConversationCounter;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/ConversationCounter;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/ConversationCounter;->conversations:Lcom/p1/mobile/putong/data/CounterConversations;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/CounterConversations;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/ConversationCounter;->messages:Lcom/p1/mobile/putong/data/CounterMessages;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/data/CounterMessages;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    const/4 p0, 0x3

    .line 22
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/ConversationCounter;->updatedTime:D

    .line 23
    .line 24
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p1, Lcom/p1/mobile/putong/data/ConversationCounter;->groupMessages:Lcom/p1/mobile/putong/data/CounterMessages;

    .line 28
    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const/4 v0, 0x4

    .line 32
    sget-object v1, Lcom/p1/mobile/putong/data/CounterMessages;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 33
    .line 34
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/ConversationCounter;->groupConversations:Lcom/p1/mobile/putong/data/CounterConversations;

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    const/4 p1, 0x5

    .line 42
    sget-object v0, Lcom/p1/mobile/putong/data/CounterConversations;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 43
    .line 44
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 45
    .line 46
    .line 47
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

    .line 48
    check-cast p1, Lcom/p1/mobile/putong/data/ConversationCounter;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/ConversationCounter$1;->serialize(Lcom/p1/mobile/putong/data/ConversationCounter;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
