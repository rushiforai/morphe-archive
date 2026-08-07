.class Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;)I
    .locals 2

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isOnTop:Z

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isShow:Z

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    const/4 v0, 0x3

    .line 17
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isRemoved:Z

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    const/4 v0, 0x4

    .line 25
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isDissolved:Z

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    const/4 v0, 0x5

    .line 33
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isRemind:Z

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->dissolveReason:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    const/4 v1, 0x6

    .line 45
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_0
    const/4 v0, 0x7

    .line 51
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isGuest:Z

    .line 52
    .line 53
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    const/16 v0, 0x8

    .line 59
    .line 60
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isEntrance:Z

    .line 61
    .line 62
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    add-int/2addr p0, v0

    .line 67
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 68
    .line 69
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 70
    check-cast p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;-><init>()V

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
    const/16 v2, 0x18

    .line 23
    .line 24
    if-eq v0, v2, :cond_5

    .line 25
    .line 26
    const/16 v2, 0x20

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
    const/16 v2, 0x38

    .line 39
    .line 40
    if-eq v0, v2, :cond_1

    .line 41
    .line 42
    const/16 v2, 0x40

    .line 43
    .line 44
    if-eq v0, v2, :cond_0

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->dissolveReason:Ljava/lang/String;

    .line 47
    .line 48
    if-nez p1, :cond_9

    .line 49
    .line 50
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->dissolveReason:Ljava/lang/String;

    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_0
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isEntrance:Z

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isGuest:Z

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->dissolveReason:Ljava/lang/String;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isRemind:Z

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isDissolved:Z

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isRemoved:Z

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isShow:Z

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isOnTop:Z

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->dissolveReason:Ljava/lang/String;

    .line 110
    .line 111
    if-nez p1, :cond_9

    .line 112
    .line 113
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->dissolveReason:Ljava/lang/String;

    .line 114
    .line 115
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

    .line 116
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isOnTop:Z

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isShow:Z

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isRemoved:Z

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x4

    .line 20
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isDissolved:Z

    .line 21
    .line 22
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x5

    .line 26
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isRemind:Z

    .line 27
    .line 28
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->dissolveReason:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    const/4 v0, 0x6

    .line 36
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    const/4 p0, 0x7

    .line 40
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isGuest:Z

    .line 41
    .line 42
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 43
    .line 44
    .line 45
    const/16 p0, 0x8

    .line 46
    .line 47
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isEntrance:Z

    .line 48
    .line 49
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 53
    check-cast p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo$1;->serialize(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
