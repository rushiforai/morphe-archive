.class public Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance$a;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;",
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
.method public a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;)I
    .locals 2

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->showEntrance:Z

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->h5JumpUrl:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->giftSchema:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->iconUrl:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const/4 v1, 0x4

    .line 33
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    :cond_2
    const/4 v0, 0x5

    .line 39
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->progress:I

    .line 40
    .line 41
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    const/4 v0, 0x6

    .line 47
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->distribute:Z

    .line 48
    .line 49
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->content:Ljava/lang/String;

    .line 55
    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    const/4 v1, 0x7

    .line 59
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->giftContent:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz v0, :cond_4

    .line 67
    .line 68
    const/16 v1, 0x8

    .line 69
    .line 70
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    add-int/2addr p0, v0

    .line 75
    :cond_4
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 76
    .line 77
    return p0
.end method

.method public b(Ll/nc5;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;-><init>()V

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
    if-eqz v0, :cond_c

    .line 13
    .line 14
    const/16 v2, 0x8

    .line 15
    .line 16
    if-eq v0, v2, :cond_b

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_a

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_9

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_8

    .line 29
    .line 30
    const/16 v2, 0x28

    .line 31
    .line 32
    if-eq v0, v2, :cond_7

    .line 33
    .line 34
    const/16 v2, 0x30

    .line 35
    .line 36
    if-eq v0, v2, :cond_6

    .line 37
    .line 38
    const/16 v2, 0x3a

    .line 39
    .line 40
    if-eq v0, v2, :cond_5

    .line 41
    .line 42
    const/16 v2, 0x42

    .line 43
    .line 44
    if-eq v0, v2, :cond_4

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->h5JumpUrl:Ljava/lang/String;

    .line 47
    .line 48
    if-nez p1, :cond_0

    .line 49
    .line 50
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->h5JumpUrl:Ljava/lang/String;

    .line 51
    .line 52
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->giftSchema:Ljava/lang/String;

    .line 53
    .line 54
    if-nez p1, :cond_1

    .line 55
    .line 56
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->giftSchema:Ljava/lang/String;

    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->iconUrl:Ljava/lang/String;

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->iconUrl:Ljava/lang/String;

    .line 63
    .line 64
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->content:Ljava/lang/String;

    .line 65
    .line 66
    if-nez p1, :cond_3

    .line 67
    .line 68
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->content:Ljava/lang/String;

    .line 69
    .line 70
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->giftContent:Ljava/lang/String;

    .line 71
    .line 72
    if-nez p1, :cond_11

    .line 73
    .line 74
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->giftContent:Ljava/lang/String;

    .line 75
    .line 76
    return-object p0

    .line 77
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->giftContent:Ljava/lang/String;

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->content:Ljava/lang/String;

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->distribute:Z

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    iput v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->progress:I

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->iconUrl:Ljava/lang/String;

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->giftSchema:Ljava/lang/String;

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->h5JumpUrl:Ljava/lang/String;

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->showEntrance:Z

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->h5JumpUrl:Ljava/lang/String;

    .line 134
    .line 135
    if-nez p1, :cond_d

    .line 136
    .line 137
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->h5JumpUrl:Ljava/lang/String;

    .line 138
    .line 139
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->giftSchema:Ljava/lang/String;

    .line 140
    .line 141
    if-nez p1, :cond_e

    .line 142
    .line 143
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->giftSchema:Ljava/lang/String;

    .line 144
    .line 145
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->iconUrl:Ljava/lang/String;

    .line 146
    .line 147
    if-nez p1, :cond_f

    .line 148
    .line 149
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->iconUrl:Ljava/lang/String;

    .line 150
    .line 151
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->content:Ljava/lang/String;

    .line 152
    .line 153
    if-nez p1, :cond_10

    .line 154
    .line 155
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->content:Ljava/lang/String;

    .line 156
    .line 157
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->giftContent:Ljava/lang/String;

    .line 158
    .line 159
    if-nez p1, :cond_11

    .line 160
    .line 161
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->giftContent:Ljava/lang/String;

    .line 162
    .line 163
    :cond_11
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->showEntrance:Z

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->h5JumpUrl:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->giftSchema:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->iconUrl:Ljava/lang/String;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x4

    .line 28
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    const/4 p0, 0x5

    .line 32
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->progress:I

    .line 33
    .line 34
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x6

    .line 38
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->distribute:Z

    .line 39
    .line 40
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->content:Ljava/lang/String;

    .line 44
    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    const/4 v0, 0x7

    .line 48
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->giftContent:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz p0, :cond_4

    .line 54
    .line 55
    const/16 p1, 0x8

    .line 56
    .line 57
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_4
    return-void
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance$a;->a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;)I

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance$a;->b(Ll/nc5;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance$a;->c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
