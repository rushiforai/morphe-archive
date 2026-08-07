.class Lcom/p1/mobile/putong/data/LiveSummary$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/LiveSummary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/LiveSummary;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/LiveSummary;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveSummary;->liveId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveSummary;->roomId:Ljava/lang/String;

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
    const/4 v0, 0x3

    .line 23
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveSummary;->liveOrder:J

    .line 24
    .line 25
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    const/4 v0, 0x4

    .line 31
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveSummary;->duration:J

    .line 32
    .line 33
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    const/4 v0, 0x5

    .line 39
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveSummary;->rewardPoint:D

    .line 40
    .line 41
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    const/4 v0, 0x6

    .line 47
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveSummary;->rewarderCount:D

    .line 48
    .line 49
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    const/4 v0, 0x7

    .line 55
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveSummary;->newFollowCount:D

    .line 56
    .line 57
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    const/16 v0, 0x8

    .line 63
    .line 64
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveSummary;->audienceCount:D

    .line 65
    .line 66
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    add-int/2addr p0, v0

    .line 71
    const/16 v0, 0x9

    .line 72
    .line 73
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveSummary;->startTime:D

    .line 74
    .line 75
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    add-int/2addr p0, v0

    .line 80
    const/16 v0, 0xa

    .line 81
    .line 82
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveSummary;->endTime:D

    .line 83
    .line 84
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    add-int/2addr p0, v0

    .line 89
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveSummary;->type:Ljava/lang/String;

    .line 90
    .line 91
    if-eqz v0, :cond_2

    .line 92
    .line 93
    const/16 v1, 0xb

    .line 94
    .line 95
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr p0, v0

    .line 100
    :cond_2
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 101
    .line 102
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 103
    check-cast p1, Lcom/p1/mobile/putong/data/LiveSummary;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/LiveSummary$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/LiveSummary;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/LiveSummary;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/LiveSummary;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/LiveSummary;-><init>()V

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
    sparse-switch v0, :sswitch_data_0

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveSummary;->liveId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveSummary;->liveId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveSummary;->roomId:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveSummary;->roomId:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveSummary;->type:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveSummary;->type:Ljava/lang/String;

    .line 32
    .line 33
    return-object p0

    .line 34
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveSummary;->type:Ljava/lang/String;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 42
    .line 43
    .line 44
    move-result-wide v0

    .line 45
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveSummary;->endTime:D

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 49
    .line 50
    .line 51
    move-result-wide v0

    .line 52
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveSummary;->startTime:D

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 56
    .line 57
    .line 58
    move-result-wide v0

    .line 59
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveSummary;->audienceCount:D

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 63
    .line 64
    .line 65
    move-result-wide v0

    .line 66
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveSummary;->newFollowCount:D

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 70
    .line 71
    .line 72
    move-result-wide v0

    .line 73
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveSummary;->rewarderCount:D

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 77
    .line 78
    .line 79
    move-result-wide v0

    .line 80
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveSummary;->rewardPoint:D

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 84
    .line 85
    .line 86
    move-result-wide v0

    .line 87
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveSummary;->duration:J

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 91
    .line 92
    .line 93
    move-result-wide v0

    .line 94
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveSummary;->liveOrder:J

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveSummary;->roomId:Ljava/lang/String;

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveSummary;->liveId:Ljava/lang/String;

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :sswitch_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveSummary;->liveId:Ljava/lang/String;

    .line 112
    .line 113
    if-nez p1, :cond_2

    .line 114
    .line 115
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveSummary;->liveId:Ljava/lang/String;

    .line 116
    .line 117
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveSummary;->roomId:Ljava/lang/String;

    .line 118
    .line 119
    if-nez p1, :cond_3

    .line 120
    .line 121
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveSummary;->roomId:Ljava/lang/String;

    .line 122
    .line 123
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveSummary;->type:Ljava/lang/String;

    .line 124
    .line 125
    if-nez p1, :cond_4

    .line 126
    .line 127
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveSummary;->type:Ljava/lang/String;

    .line 128
    .line 129
    :cond_4
    return-object p0

    .line 130
    nop

    .line 131
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_b
        0xa -> :sswitch_a
        0x12 -> :sswitch_9
        0x18 -> :sswitch_8
        0x20 -> :sswitch_7
        0x29 -> :sswitch_6
        0x31 -> :sswitch_5
        0x39 -> :sswitch_4
        0x41 -> :sswitch_3
        0x49 -> :sswitch_2
        0x51 -> :sswitch_1
        0x5a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 131
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/LiveSummary$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/LiveSummary;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/LiveSummary;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveSummary;->liveId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveSummary;->roomId:Ljava/lang/String;

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
    const/4 p0, 0x3

    .line 18
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveSummary;->liveOrder:J

    .line 19
    .line 20
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x4

    .line 24
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveSummary;->duration:J

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x5

    .line 30
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveSummary;->rewardPoint:D

    .line 31
    .line 32
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x6

    .line 36
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveSummary;->rewarderCount:D

    .line 37
    .line 38
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x7

    .line 42
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveSummary;->newFollowCount:D

    .line 43
    .line 44
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 45
    .line 46
    .line 47
    const/16 p0, 0x8

    .line 48
    .line 49
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveSummary;->audienceCount:D

    .line 50
    .line 51
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 52
    .line 53
    .line 54
    const/16 p0, 0x9

    .line 55
    .line 56
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveSummary;->startTime:D

    .line 57
    .line 58
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 59
    .line 60
    .line 61
    const/16 p0, 0xa

    .line 62
    .line 63
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveSummary;->endTime:D

    .line 64
    .line 65
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveSummary;->type:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz p0, :cond_2

    .line 71
    .line 72
    const/16 p1, 0xb

    .line 73
    .line 74
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 75
    .line 76
    .line 77
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

    .line 78
    check-cast p1, Lcom/p1/mobile/putong/data/LiveSummary;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/LiveSummary$1;->serialize(Lcom/p1/mobile/putong/data/LiveSummary;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
