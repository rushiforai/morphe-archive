.class Lcom/p1/mobile/putong/core/data/QuickchatUsers$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/QuickchatUsers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/QuickchatUsers;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/QuickchatUsers;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->status:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->quickchatType:Ljava/lang/String;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    :cond_2
    const/4 v0, 0x4

    .line 33
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->waittingExpiredTime:D

    .line 34
    .line 35
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    const/4 v0, 0x5

    .line 41
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->rtcChannelWaittingTime:D

    .line 42
    .line 43
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->otherUserID:Ljava/lang/String;

    .line 49
    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    const/4 v1, 0x6

    .line 53
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->rtcChannel:Ljava/lang/String;

    .line 59
    .line 60
    if-eqz v0, :cond_4

    .line 61
    .line 62
    const/4 v1, 0x7

    .line 63
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->rtcToken:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz v0, :cond_5

    .line 71
    .line 72
    const/16 v1, 0x8

    .line 73
    .line 74
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    add-int/2addr p0, v0

    .line 79
    :cond_5
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 80
    .line 81
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 82
    check-cast p1, Lcom/p1/mobile/putong/core/data/QuickchatUsers;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/QuickchatUsers$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/QuickchatUsers;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/QuickchatUsers;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/QuickchatUsers;-><init>()V

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
    if-eqz v0, :cond_d

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_c

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_b

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_a

    .line 25
    .line 26
    const/16 v2, 0x21

    .line 27
    .line 28
    if-eq v0, v2, :cond_9

    .line 29
    .line 30
    const/16 v2, 0x29

    .line 31
    .line 32
    if-eq v0, v2, :cond_8

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_7

    .line 37
    .line 38
    const/16 v2, 0x3a

    .line 39
    .line 40
    if-eq v0, v2, :cond_6

    .line 41
    .line 42
    const/16 v2, 0x42

    .line 43
    .line 44
    if-eq v0, v2, :cond_5

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->id:Ljava/lang/String;

    .line 47
    .line 48
    if-nez p1, :cond_0

    .line 49
    .line 50
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->id:Ljava/lang/String;

    .line 51
    .line 52
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->status:Ljava/lang/String;

    .line 53
    .line 54
    if-nez p1, :cond_1

    .line 55
    .line 56
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->status:Ljava/lang/String;

    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->quickchatType:Ljava/lang/String;

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->quickchatType:Ljava/lang/String;

    .line 63
    .line 64
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->otherUserID:Ljava/lang/String;

    .line 65
    .line 66
    if-nez p1, :cond_3

    .line 67
    .line 68
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->otherUserID:Ljava/lang/String;

    .line 69
    .line 70
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->rtcChannel:Ljava/lang/String;

    .line 71
    .line 72
    if-nez p1, :cond_4

    .line 73
    .line 74
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->rtcChannel:Ljava/lang/String;

    .line 75
    .line 76
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->rtcToken:Ljava/lang/String;

    .line 77
    .line 78
    if-nez p1, :cond_13

    .line 79
    .line 80
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->rtcToken:Ljava/lang/String;

    .line 81
    .line 82
    return-object p0

    .line 83
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->rtcToken:Ljava/lang/String;

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->rtcChannel:Ljava/lang/String;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->otherUserID:Ljava/lang/String;

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 105
    .line 106
    .line 107
    move-result-wide v0

    .line 108
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->rtcChannelWaittingTime:D

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 112
    .line 113
    .line 114
    move-result-wide v0

    .line 115
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->waittingExpiredTime:D

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->quickchatType:Ljava/lang/String;

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->status:Ljava/lang/String;

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->id:Ljava/lang/String;

    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->id:Ljava/lang/String;

    .line 141
    .line 142
    if-nez p1, :cond_e

    .line 143
    .line 144
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->id:Ljava/lang/String;

    .line 145
    .line 146
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->status:Ljava/lang/String;

    .line 147
    .line 148
    if-nez p1, :cond_f

    .line 149
    .line 150
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->status:Ljava/lang/String;

    .line 151
    .line 152
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->quickchatType:Ljava/lang/String;

    .line 153
    .line 154
    if-nez p1, :cond_10

    .line 155
    .line 156
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->quickchatType:Ljava/lang/String;

    .line 157
    .line 158
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->otherUserID:Ljava/lang/String;

    .line 159
    .line 160
    if-nez p1, :cond_11

    .line 161
    .line 162
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->otherUserID:Ljava/lang/String;

    .line 163
    .line 164
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->rtcChannel:Ljava/lang/String;

    .line 165
    .line 166
    if-nez p1, :cond_12

    .line 167
    .line 168
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->rtcChannel:Ljava/lang/String;

    .line 169
    .line 170
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->rtcToken:Ljava/lang/String;

    .line 171
    .line 172
    if-nez p1, :cond_13

    .line 173
    .line 174
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->rtcToken:Ljava/lang/String;

    .line 175
    .line 176
    :cond_13
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 177
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/QuickchatUsers$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/QuickchatUsers;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/QuickchatUsers;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->status:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->quickchatType:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_2
    const/4 p0, 0x4

    .line 26
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->waittingExpiredTime:D

    .line 27
    .line 28
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x5

    .line 32
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->rtcChannelWaittingTime:D

    .line 33
    .line 34
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->otherUserID:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->rtcChannel:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const/4 v0, 0x7

    .line 50
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickchatUsers;->rtcToken:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz p0, :cond_5

    .line 56
    .line 57
    const/16 p1, 0x8

    .line 58
    .line 59
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_5
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 63
    check-cast p1, Lcom/p1/mobile/putong/core/data/QuickchatUsers;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/QuickchatUsers$1;->serialize(Lcom/p1/mobile/putong/core/data/QuickchatUsers;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
