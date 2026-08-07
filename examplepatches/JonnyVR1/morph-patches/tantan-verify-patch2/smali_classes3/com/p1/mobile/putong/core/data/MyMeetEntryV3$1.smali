.class Lcom/p1/mobile/putong/core/data/MyMeetEntryV3$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->seeReminder:Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->oDiamondFeed:Lcom/p1/mobile/putong/core/data/ODiamondFeed;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x4

    .line 43
    sget-object v2, Lcom/p1/mobile/putong/core/data/ODiamondFeed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 44
    .line 45
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->nearby:Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x5

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 56
    .line 57
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_4
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 63
    .line 64
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 65
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;-><init>()V

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
    if-eqz v0, :cond_6

    .line 11
    .line 12
    const/16 v1, 0xa

    .line 13
    .line 14
    if-eq v0, v1, :cond_5

    .line 15
    .line 16
    const/16 v1, 0x12

    .line 17
    .line 18
    if-eq v0, v1, :cond_4

    .line 19
    .line 20
    const/16 v1, 0x1a

    .line 21
    .line 22
    if-eq v0, v1, :cond_3

    .line 23
    .line 24
    const/16 v1, 0x22

    .line 25
    .line 26
    if-eq v0, v1, :cond_2

    .line 27
    .line 28
    const/16 v1, 0x2a

    .line 29
    .line 30
    if-eq v0, v1, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 33
    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;->new_()Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 41
    .line 42
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 43
    .line 44
    if-nez p1, :cond_8

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->new_()Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->nearby:Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/ODiamondFeed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Lcom/p1/mobile/putong/core/data/ODiamondFeed;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->oDiamondFeed:Lcom/p1/mobile/putong/core/data/ODiamondFeed;

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 76
    .line 77
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;

    .line 82
    .line 83
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->seeReminder:Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 87
    .line 88
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    check-cast v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 93
    .line 94
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 98
    .line 99
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 104
    .line 105
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 109
    .line 110
    if-nez p1, :cond_7

    .line 111
    .line 112
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;->new_()Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 117
    .line 118
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 119
    .line 120
    if-nez p1, :cond_8

    .line 121
    .line 122
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->new_()Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 127
    .line 128
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

    .line 129
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->seeReminder:Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->oDiamondFeed:Lcom/p1/mobile/putong/core/data/ODiamondFeed;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/core/data/ODiamondFeed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 37
    .line 38
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->nearby:Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;

    .line 42
    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    const/4 p1, 0x5

    .line 46
    sget-object v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 49
    .line 50
    .line 51
    :cond_4
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
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3$1;->serialize(Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
