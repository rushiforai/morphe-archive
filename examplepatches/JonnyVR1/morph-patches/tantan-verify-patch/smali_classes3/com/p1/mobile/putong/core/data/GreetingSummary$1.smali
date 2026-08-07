.class Lcom/p1/mobile/putong/core/data/GreetingSummary$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/GreetingSummary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/GreetingSummary;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/GreetingSummary;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->unseen:I

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
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestTime:D

    .line 10
    .line 11
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestUserId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestMessageId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->iconURL:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->title:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->subtitle:Ljava/lang/String;

    .line 57
    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    const/4 v1, 0x7

    .line 61
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    :cond_4
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 67
    .line 68
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 69
    check-cast p1, Lcom/p1/mobile/putong/core/data/GreetingSummary;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/GreetingSummary$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/GreetingSummary;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/GreetingSummary;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/GreetingSummary;-><init>()V

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
    if-eqz v0, :cond_b

    .line 13
    .line 14
    const/16 v2, 0x8

    .line 15
    .line 16
    if-eq v0, v2, :cond_a

    .line 17
    .line 18
    const/16 v2, 0x11

    .line 19
    .line 20
    if-eq v0, v2, :cond_9

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_8

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_7

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_6

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_5

    .line 37
    .line 38
    const/16 v2, 0x3a

    .line 39
    .line 40
    if-eq v0, v2, :cond_4

    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestUserId:Ljava/lang/String;

    .line 43
    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestUserId:Ljava/lang/String;

    .line 47
    .line 48
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestMessageId:Ljava/lang/String;

    .line 49
    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestMessageId:Ljava/lang/String;

    .line 53
    .line 54
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->iconURL:Ljava/lang/String;

    .line 55
    .line 56
    if-nez p1, :cond_2

    .line 57
    .line 58
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->iconURL:Ljava/lang/String;

    .line 59
    .line 60
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->title:Ljava/lang/String;

    .line 61
    .line 62
    if-nez p1, :cond_3

    .line 63
    .line 64
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->title:Ljava/lang/String;

    .line 65
    .line 66
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->subtitle:Ljava/lang/String;

    .line 67
    .line 68
    if-nez p1, :cond_10

    .line 69
    .line 70
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->subtitle:Ljava/lang/String;

    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->subtitle:Ljava/lang/String;

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->title:Ljava/lang/String;

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->iconURL:Ljava/lang/String;

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestMessageId:Ljava/lang/String;

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestUserId:Ljava/lang/String;

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 109
    .line 110
    .line 111
    move-result-wide v0

    .line 112
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestTime:D

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    iput v0, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->unseen:I

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestUserId:Ljava/lang/String;

    .line 123
    .line 124
    if-nez p1, :cond_c

    .line 125
    .line 126
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestUserId:Ljava/lang/String;

    .line 127
    .line 128
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestMessageId:Ljava/lang/String;

    .line 129
    .line 130
    if-nez p1, :cond_d

    .line 131
    .line 132
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestMessageId:Ljava/lang/String;

    .line 133
    .line 134
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->iconURL:Ljava/lang/String;

    .line 135
    .line 136
    if-nez p1, :cond_e

    .line 137
    .line 138
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->iconURL:Ljava/lang/String;

    .line 139
    .line 140
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->title:Ljava/lang/String;

    .line 141
    .line 142
    if-nez p1, :cond_f

    .line 143
    .line 144
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->title:Ljava/lang/String;

    .line 145
    .line 146
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->subtitle:Ljava/lang/String;

    .line 147
    .line 148
    if-nez p1, :cond_10

    .line 149
    .line 150
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->subtitle:Ljava/lang/String;

    .line 151
    .line 152
    :cond_10
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 153
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/GreetingSummary$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/GreetingSummary;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/GreetingSummary;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->unseen:I

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestTime:D

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestUserId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestMessageId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->iconURL:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->title:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    const/4 v0, 0x6

    .line 42
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->subtitle:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const/4 p1, 0x7

    .line 50
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
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

    .line 54
    check-cast p1, Lcom/p1/mobile/putong/core/data/GreetingSummary;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/GreetingSummary$1;->serialize(Lcom/p1/mobile/putong/core/data/GreetingSummary;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
