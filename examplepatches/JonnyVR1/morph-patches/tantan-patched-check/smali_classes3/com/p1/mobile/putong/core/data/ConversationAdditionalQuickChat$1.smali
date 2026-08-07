.class Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->avatarBlurred:Z

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    sget-object v2, Lcom/p1/mobile/putong/core/data/QuickChatBell;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    const/4 v0, 0x3

    .line 21
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->expire:D

    .line 22
    .line 23
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    const/4 v0, 0x4

    .line 29
    iget v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->progress:I

    .line 30
    .line 31
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    const/4 v0, 0x5

    .line 37
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->guideFakeToGood:Z

    .line 38
    .line 39
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 45
    .line 46
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 47
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;-><init>()V

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
    if-eqz v0, :cond_5

    .line 11
    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    if-eq v0, v1, :cond_4

    .line 15
    .line 16
    const/16 v1, 0x12

    .line 17
    .line 18
    if-eq v0, v1, :cond_3

    .line 19
    .line 20
    const/16 v1, 0x19

    .line 21
    .line 22
    if-eq v0, v1, :cond_2

    .line 23
    .line 24
    const/16 v1, 0x20

    .line 25
    .line 26
    if-eq v0, v1, :cond_1

    .line 27
    .line 28
    const/16 v1, 0x28

    .line 29
    .line 30
    if-eq v0, v1, :cond_0

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 33
    .line 34
    if-nez p1, :cond_6

    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/core/data/QuickChatBell;->new_()Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_0
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->guideFakeToGood:Z

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    iput v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->progress:I

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 58
    .line 59
    .line 60
    move-result-wide v0

    .line 61
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->expire:D

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/QuickChatBell;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->avatarBlurred:Z

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 83
    .line 84
    if-nez p1, :cond_6

    .line 85
    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/core/data/QuickChatBell;->new_()Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 91
    .line 92
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

    .line 93
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->avatarBlurred:Z

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    sget-object v1, Lcom/p1/mobile/putong/core/data/QuickChatBell;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 13
    .line 14
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    const/4 p0, 0x3

    .line 18
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->expire:D

    .line 19
    .line 20
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x4

    .line 24
    iget v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->progress:I

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x5

    .line 30
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->guideFakeToGood:Z

    .line 31
    .line 32
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 33
    .line 34
    .line 35
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
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat$1;->serialize(Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
