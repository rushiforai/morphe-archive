.class Lcom/p1/mobile/putong/core/data/HeartbeatMatch$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/HeartbeatMatch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/HeartbeatMatch;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/HeartbeatMatch;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->expireTime:D

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->isPassive:Z

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
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->acceptTime:D

    .line 18
    .line 19
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->source:Ljava/lang/String;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    const/4 v1, 0x4

    .line 29
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    :cond_0
    const/4 v0, 0x5

    .line 35
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->lock:Z

    .line 36
    .line 37
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->tracker:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    const/4 v1, 0x6

    .line 47
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_1
    const/4 v0, 0x7

    .line 53
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->guideFakeToGood:Z

    .line 54
    .line 55
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    const/16 v0, 0x8

    .line 61
    .line 62
    iget v1, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->matchType:I

    .line 63
    .line 64
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    add-int/2addr p0, v0

    .line 69
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetText:Ljava/lang/String;

    .line 70
    .line 71
    if-eqz v0, :cond_2

    .line 72
    .line 73
    const/16 v1, 0x9

    .line 74
    .line 75
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    add-int/2addr p0, v0

    .line 80
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetEmoji:Ljava/lang/String;

    .line 81
    .line 82
    if-eqz v0, :cond_3

    .line 83
    .line 84
    const/16 v1, 0xa

    .line 85
    .line 86
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    add-int/2addr p0, v0

    .line 91
    :cond_3
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 92
    .line 93
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 94
    check-cast p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/HeartbeatMatch$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/HeartbeatMatch;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/HeartbeatMatch;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->source:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->source:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->tracker:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->tracker:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetText:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetText:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetEmoji:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_6

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetEmoji:Ljava/lang/String;

    .line 38
    .line 39
    return-object p0

    .line 40
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetEmoji:Ljava/lang/String;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetText:Ljava/lang/String;

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iput v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->matchType:I

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->guideFakeToGood:Z

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->tracker:Ljava/lang/String;

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->lock:Z

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->source:Ljava/lang/String;

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 90
    .line 91
    .line 92
    move-result-wide v0

    .line 93
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->acceptTime:D

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->isPassive:Z

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 104
    .line 105
    .line 106
    move-result-wide v0

    .line 107
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->expireTime:D

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :sswitch_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->source:Ljava/lang/String;

    .line 111
    .line 112
    if-nez p1, :cond_3

    .line 113
    .line 114
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->source:Ljava/lang/String;

    .line 115
    .line 116
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->tracker:Ljava/lang/String;

    .line 117
    .line 118
    if-nez p1, :cond_4

    .line 119
    .line 120
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->tracker:Ljava/lang/String;

    .line 121
    .line 122
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetText:Ljava/lang/String;

    .line 123
    .line 124
    if-nez p1, :cond_5

    .line 125
    .line 126
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetText:Ljava/lang/String;

    .line 127
    .line 128
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetEmoji:Ljava/lang/String;

    .line 129
    .line 130
    if-nez p1, :cond_6

    .line 131
    .line 132
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetEmoji:Ljava/lang/String;

    .line 133
    .line 134
    :cond_6
    return-object p0

    .line 135
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_a
        0x9 -> :sswitch_9
        0x10 -> :sswitch_8
        0x19 -> :sswitch_7
        0x22 -> :sswitch_6
        0x28 -> :sswitch_5
        0x32 -> :sswitch_4
        0x38 -> :sswitch_3
        0x40 -> :sswitch_2
        0x4a -> :sswitch_1
        0x52 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 135
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/HeartbeatMatch$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/HeartbeatMatch;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->expireTime:D

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->isPassive:Z

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->acceptTime:D

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->source:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x4

    .line 24
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    const/4 p0, 0x5

    .line 28
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->lock:Z

    .line 29
    .line 30
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->tracker:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    const/4 v0, 0x6

    .line 38
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    const/4 p0, 0x7

    .line 42
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->guideFakeToGood:Z

    .line 43
    .line 44
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 45
    .line 46
    .line 47
    const/16 p0, 0x8

    .line 48
    .line 49
    iget v0, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->matchType:I

    .line 50
    .line 51
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetText:Ljava/lang/String;

    .line 55
    .line 56
    if-eqz p0, :cond_2

    .line 57
    .line 58
    const/16 v0, 0x9

    .line 59
    .line 60
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetEmoji:Ljava/lang/String;

    .line 64
    .line 65
    if-eqz p0, :cond_3

    .line 66
    .line 67
    const/16 p1, 0xa

    .line 68
    .line 69
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 70
    .line 71
    .line 72
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

    .line 73
    check-cast p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/HeartbeatMatch$1;->serialize(Lcom/p1/mobile/putong/core/data/HeartbeatMatch;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
