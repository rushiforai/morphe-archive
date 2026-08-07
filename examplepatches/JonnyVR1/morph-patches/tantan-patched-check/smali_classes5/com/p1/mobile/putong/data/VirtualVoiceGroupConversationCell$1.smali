.class Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;-><init>()V

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
    const/16 v1, 0xa

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
    const/16 v1, 0x1a

    .line 21
    .line 22
    if-eq v0, v1, :cond_2

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 25
    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->new_()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 33
    .line 34
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 35
    .line 36
    if-nez p1, :cond_1

    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->new_()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 43
    .line 44
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 45
    .line 46
    if-nez p1, :cond_8

    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->new_()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 62
    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 73
    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 89
    .line 90
    if-nez p1, :cond_6

    .line 91
    .line 92
    invoke-static {}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->new_()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 97
    .line 98
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 99
    .line 100
    if-nez p1, :cond_7

    .line 101
    .line 102
    invoke-static {}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->new_()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 107
    .line 108
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 109
    .line 110
    if-nez p1, :cond_8

    .line 111
    .line 112
    invoke-static {}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->new_()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 117
    .line 118
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

    .line 119
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 p1, 0x3

    .line 26
    sget-object v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell$1;->serialize(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
