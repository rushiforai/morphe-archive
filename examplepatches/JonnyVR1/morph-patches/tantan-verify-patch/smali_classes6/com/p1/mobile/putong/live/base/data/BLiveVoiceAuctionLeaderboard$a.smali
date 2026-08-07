.class public Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard$a;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;",
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
.method public a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->rank:J

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->auctionId:Ljava/lang/String;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/2addr p0, v0

    .line 18
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->userId:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/4 v1, 0x3

    .line 23
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    :cond_1
    const/4 v0, 0x4

    .line 29
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->amount:J

    .line 30
    .line 31
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceRoomId:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    const/4 v1, 0x5

    .line 41
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceLiveId:Ljava/lang/String;

    .line 47
    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    const/4 v1, 0x6

    .line 51
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_3
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 57
    .line 58
    return p0
.end method

.method public b(Ll/nc5;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;-><init>()V

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
    if-eqz v0, :cond_9

    .line 13
    .line 14
    const/16 v2, 0x8

    .line 15
    .line 16
    if-eq v0, v2, :cond_8

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_7

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_6

    .line 25
    .line 26
    const/16 v2, 0x20

    .line 27
    .line 28
    if-eq v0, v2, :cond_5

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_4

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_3

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->auctionId:Ljava/lang/String;

    .line 39
    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->auctionId:Ljava/lang/String;

    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->userId:Ljava/lang/String;

    .line 45
    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->userId:Ljava/lang/String;

    .line 49
    .line 50
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceRoomId:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_2

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceRoomId:Ljava/lang/String;

    .line 55
    .line 56
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceLiveId:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_d

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceLiveId:Ljava/lang/String;

    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceLiveId:Ljava/lang/String;

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceRoomId:Ljava/lang/String;

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 78
    .line 79
    .line 80
    move-result-wide v0

    .line 81
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->amount:J

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->userId:Ljava/lang/String;

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->auctionId:Ljava/lang/String;

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 99
    .line 100
    .line 101
    move-result-wide v0

    .line 102
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->rank:J

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->auctionId:Ljava/lang/String;

    .line 106
    .line 107
    if-nez p1, :cond_a

    .line 108
    .line 109
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->auctionId:Ljava/lang/String;

    .line 110
    .line 111
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->userId:Ljava/lang/String;

    .line 112
    .line 113
    if-nez p1, :cond_b

    .line 114
    .line 115
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->userId:Ljava/lang/String;

    .line 116
    .line 117
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceRoomId:Ljava/lang/String;

    .line 118
    .line 119
    if-nez p1, :cond_c

    .line 120
    .line 121
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceRoomId:Ljava/lang/String;

    .line 122
    .line 123
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceLiveId:Ljava/lang/String;

    .line 124
    .line 125
    if-nez p1, :cond_d

    .line 126
    .line 127
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceLiveId:Ljava/lang/String;

    .line 128
    .line 129
    :cond_d
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->rank:J

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->auctionId:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->userId:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    const/4 p0, 0x4

    .line 24
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->amount:J

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceRoomId:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    const/4 v0, 0x5

    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceLiveId:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    const/4 p1, 0x6

    .line 42
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_3
    return-void
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard$a;->a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard$a;->b(Ll/nc5;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard$a;->c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
