.class Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->unreadedCount:I

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    iget v1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSeq:I

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSenderName:Ljava/lang/String;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    const/4 v1, 0x3

    .line 21
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentMsg:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    const/4 v1, 0x4

    .line 31
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_1
    const/4 v0, 0x5

    .line 37
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentTime:J

    .line 38
    .line 39
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->commonMsg:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    const/4 v1, 0x6

    .line 49
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    :cond_2
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 55
    .line 56
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 57
    check-cast p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;-><init>()V

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
    if-eqz v0, :cond_8

    .line 13
    .line 14
    const/16 v2, 0x8

    .line 15
    .line 16
    if-eq v0, v2, :cond_7

    .line 17
    .line 18
    const/16 v2, 0x10

    .line 19
    .line 20
    if-eq v0, v2, :cond_6

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_5

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_4

    .line 29
    .line 30
    const/16 v2, 0x28

    .line 31
    .line 32
    if-eq v0, v2, :cond_3

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_2

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSenderName:Ljava/lang/String;

    .line 39
    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSenderName:Ljava/lang/String;

    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentMsg:Ljava/lang/String;

    .line 45
    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentMsg:Ljava/lang/String;

    .line 49
    .line 50
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->commonMsg:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_b

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->commonMsg:Ljava/lang/String;

    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->commonMsg:Ljava/lang/String;

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 65
    .line 66
    .line 67
    move-result-wide v0

    .line 68
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentTime:J

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentMsg:Ljava/lang/String;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSenderName:Ljava/lang/String;

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    iput v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSeq:I

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    iput v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->unreadedCount:I

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSenderName:Ljava/lang/String;

    .line 100
    .line 101
    if-nez p1, :cond_9

    .line 102
    .line 103
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSenderName:Ljava/lang/String;

    .line 104
    .line 105
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentMsg:Ljava/lang/String;

    .line 106
    .line 107
    if-nez p1, :cond_a

    .line 108
    .line 109
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentMsg:Ljava/lang/String;

    .line 110
    .line 111
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->commonMsg:Ljava/lang/String;

    .line 112
    .line 113
    if-nez p1, :cond_b

    .line 114
    .line 115
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->commonMsg:Ljava/lang/String;

    .line 116
    .line 117
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

    .line 118
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->unreadedCount:I

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSeq:I

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentSenderName:Ljava/lang/String;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x3

    .line 18
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentMsg:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x4

    .line 26
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    const/4 p0, 0x5

    .line 30
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentTime:J

    .line 31
    .line 32
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->commonMsg:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    const/4 p1, 0x6

    .line 40
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 41
    .line 42
    .line 43
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

    .line 44
    check-cast p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat$1;->serialize(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
