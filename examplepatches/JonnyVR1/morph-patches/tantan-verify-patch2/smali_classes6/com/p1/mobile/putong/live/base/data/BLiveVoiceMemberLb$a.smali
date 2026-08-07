.class public Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb$a;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;",
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
.method public a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->rank:I

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userName:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userAvatar:Ljava/lang/String;

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
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->hierarchyGrade:I

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
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->medalGrade:I

    .line 48
    .line 49
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->medalColor:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->medalName:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->gender:Ljava/lang/String;

    .line 76
    .line 77
    if-eqz v0, :cond_5

    .line 78
    .line 79
    const/16 v1, 0x9

    .line 80
    .line 81
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    add-int/2addr p0, v0

    .line 86
    :cond_5
    const/16 v0, 0xa

    .line 87
    .line 88
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->score:J

    .line 89
    .line 90
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    add-int/2addr p0, v0

    .line 95
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 96
    .line 97
    return p0
.end method

.method public b(Ll/nc5;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userName:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userName:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userAvatar:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userAvatar:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->medalColor:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->medalColor:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->medalName:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->medalName:Ljava/lang/String;

    .line 44
    .line 45
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->gender:Ljava/lang/String;

    .line 46
    .line 47
    if-nez p1, :cond_a

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->gender:Ljava/lang/String;

    .line 50
    .line 51
    return-object p0

    .line 52
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 53
    .line 54
    .line 55
    move-result-wide v0

    .line 56
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->score:J

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->gender:Ljava/lang/String;

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->medalName:Ljava/lang/String;

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->medalColor:Ljava/lang/String;

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iput v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->medalGrade:I

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    iput v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->hierarchyGrade:I

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userAvatar:Ljava/lang/String;

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userName:Ljava/lang/String;

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userId:Ljava/lang/String;

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    iput v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->rank:I

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :sswitch_a
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userId:Ljava/lang/String;

    .line 123
    .line 124
    if-nez p1, :cond_5

    .line 125
    .line 126
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userId:Ljava/lang/String;

    .line 127
    .line 128
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userName:Ljava/lang/String;

    .line 129
    .line 130
    if-nez p1, :cond_6

    .line 131
    .line 132
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userName:Ljava/lang/String;

    .line 133
    .line 134
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userAvatar:Ljava/lang/String;

    .line 135
    .line 136
    if-nez p1, :cond_7

    .line 137
    .line 138
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userAvatar:Ljava/lang/String;

    .line 139
    .line 140
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->medalColor:Ljava/lang/String;

    .line 141
    .line 142
    if-nez p1, :cond_8

    .line 143
    .line 144
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->medalColor:Ljava/lang/String;

    .line 145
    .line 146
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->medalName:Ljava/lang/String;

    .line 147
    .line 148
    if-nez p1, :cond_9

    .line 149
    .line 150
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->medalName:Ljava/lang/String;

    .line 151
    .line 152
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->gender:Ljava/lang/String;

    .line 153
    .line 154
    if-nez p1, :cond_a

    .line 155
    .line 156
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->gender:Ljava/lang/String;

    .line 157
    .line 158
    :cond_a
    return-object p0

    .line 159
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_a
        0x8 -> :sswitch_9
        0x12 -> :sswitch_8
        0x1a -> :sswitch_7
        0x22 -> :sswitch_6
        0x28 -> :sswitch_5
        0x30 -> :sswitch_4
        0x3a -> :sswitch_3
        0x42 -> :sswitch_2
        0x4a -> :sswitch_1
        0x50 -> :sswitch_0
    .end sparse-switch
.end method

.method public c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->rank:I

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userName:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->userAvatar:Ljava/lang/String;

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
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->hierarchyGrade:I

    .line 33
    .line 34
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x6

    .line 38
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->medalGrade:I

    .line 39
    .line 40
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->medalColor:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->medalName:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz p0, :cond_4

    .line 54
    .line 55
    const/16 v0, 0x8

    .line 56
    .line 57
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->gender:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz p0, :cond_5

    .line 63
    .line 64
    const/16 v0, 0x9

    .line 65
    .line 66
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_5
    const/16 p0, 0xa

    .line 70
    .line 71
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->score:J

    .line 72
    .line 73
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb$a;->a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;)I

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb$a;->b(Ll/nc5;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb$a;->c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
