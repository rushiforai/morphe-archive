.class Lcom/p1/mobile/putong/data/LiveFansClubLevel$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/LiveFansClubLevel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/LiveFansClubLevel;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/LiveFansClubLevel;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->title:Ljava/lang/String;

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
    const/4 v0, 0x2

    .line 13
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->grade:J

    .line 14
    .line 15
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/2addr p0, v0

    .line 20
    const/4 v0, 0x3

    .line 21
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->memberCount:J

    .line 22
    .line 23
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    const/4 v0, 0x4

    .line 29
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->wealth:J

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
    const/4 v0, 0x5

    .line 37
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->gap:J

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
    const/4 v0, 0x6

    .line 45
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->updatedTime:J

    .line 46
    .line 47
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->iconUrl:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    const/4 v1, 0x7

    .line 57
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingFrontUrl:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    const/16 v1, 0x8

    .line 67
    .line 68
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    add-int/2addr p0, v0

    .line 73
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingBackUrl:Ljava/lang/String;

    .line 74
    .line 75
    if-eqz v0, :cond_3

    .line 76
    .line 77
    const/16 v1, 0x9

    .line 78
    .line 79
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    add-int/2addr p0, v0

    .line 84
    :cond_3
    const/16 v0, 0xa

    .line 85
    .line 86
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->wealthRatio:D

    .line 87
    .line 88
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    add-int/2addr p0, v0

    .line 93
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->textColor:Ljava/lang/String;

    .line 94
    .line 95
    if-eqz v0, :cond_4

    .line 96
    .line 97
    const/16 v1, 0xb

    .line 98
    .line 99
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    add-int/2addr p0, v0

    .line 104
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->userType:Ljava/lang/String;

    .line 105
    .line 106
    if-eqz v0, :cond_5

    .line 107
    .line 108
    const/16 v1, 0xc

    .line 109
    .line 110
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    add-int/2addr p0, v0

    .line 115
    :cond_5
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 116
    .line 117
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 118
    check-cast p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/LiveFansClubLevel$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/LiveFansClubLevel;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/LiveFansClubLevel;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/LiveFansClubLevel;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->title:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->title:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->iconUrl:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->iconUrl:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingFrontUrl:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingFrontUrl:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingBackUrl:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingBackUrl:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->textColor:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->textColor:Ljava/lang/String;

    .line 44
    .line 45
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->userType:Ljava/lang/String;

    .line 46
    .line 47
    if-nez p1, :cond_a

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->userType:Ljava/lang/String;

    .line 50
    .line 51
    return-object p0

    .line 52
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->userType:Ljava/lang/String;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->textColor:Ljava/lang/String;

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 67
    .line 68
    .line 69
    move-result-wide v0

    .line 70
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->wealthRatio:D

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingBackUrl:Ljava/lang/String;

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingFrontUrl:Ljava/lang/String;

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->iconUrl:Ljava/lang/String;

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 95
    .line 96
    .line 97
    move-result-wide v0

    .line 98
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->updatedTime:J

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 102
    .line 103
    .line 104
    move-result-wide v0

    .line 105
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->gap:J

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 109
    .line 110
    .line 111
    move-result-wide v0

    .line 112
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->wealth:J

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 116
    .line 117
    .line 118
    move-result-wide v0

    .line 119
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->memberCount:J

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 123
    .line 124
    .line 125
    move-result-wide v0

    .line 126
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->grade:J

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->title:Ljava/lang/String;

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :sswitch_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->title:Ljava/lang/String;

    .line 138
    .line 139
    if-nez p1, :cond_5

    .line 140
    .line 141
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->title:Ljava/lang/String;

    .line 142
    .line 143
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->iconUrl:Ljava/lang/String;

    .line 144
    .line 145
    if-nez p1, :cond_6

    .line 146
    .line 147
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->iconUrl:Ljava/lang/String;

    .line 148
    .line 149
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingFrontUrl:Ljava/lang/String;

    .line 150
    .line 151
    if-nez p1, :cond_7

    .line 152
    .line 153
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingFrontUrl:Ljava/lang/String;

    .line 154
    .line 155
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingBackUrl:Ljava/lang/String;

    .line 156
    .line 157
    if-nez p1, :cond_8

    .line 158
    .line 159
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingBackUrl:Ljava/lang/String;

    .line 160
    .line 161
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->textColor:Ljava/lang/String;

    .line 162
    .line 163
    if-nez p1, :cond_9

    .line 164
    .line 165
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->textColor:Ljava/lang/String;

    .line 166
    .line 167
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->userType:Ljava/lang/String;

    .line 168
    .line 169
    if-nez p1, :cond_a

    .line 170
    .line 171
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->userType:Ljava/lang/String;

    .line 172
    .line 173
    :cond_a
    return-object p0

    .line 174
    nop

    .line 175
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_c
        0xa -> :sswitch_b
        0x10 -> :sswitch_a
        0x18 -> :sswitch_9
        0x20 -> :sswitch_8
        0x28 -> :sswitch_7
        0x30 -> :sswitch_6
        0x3a -> :sswitch_5
        0x42 -> :sswitch_4
        0x4a -> :sswitch_3
        0x51 -> :sswitch_2
        0x5a -> :sswitch_1
        0x62 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 175
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/LiveFansClubLevel$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/LiveFansClubLevel;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->title:Ljava/lang/String;

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
    const/4 p0, 0x2

    .line 10
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->grade:J

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x3

    .line 16
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->memberCount:J

    .line 17
    .line 18
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x4

    .line 22
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->wealth:J

    .line 23
    .line 24
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x5

    .line 28
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->gap:J

    .line 29
    .line 30
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x6

    .line 34
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->updatedTime:J

    .line 35
    .line 36
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->iconUrl:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    const/4 v0, 0x7

    .line 44
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingFrontUrl:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz p0, :cond_2

    .line 50
    .line 51
    const/16 v0, 0x8

    .line 52
    .line 53
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingBackUrl:Ljava/lang/String;

    .line 57
    .line 58
    if-eqz p0, :cond_3

    .line 59
    .line 60
    const/16 v0, 0x9

    .line 61
    .line 62
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_3
    const/16 p0, 0xa

    .line 66
    .line 67
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->wealthRatio:D

    .line 68
    .line 69
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->textColor:Ljava/lang/String;

    .line 73
    .line 74
    if-eqz p0, :cond_4

    .line 75
    .line 76
    const/16 v0, 0xb

    .line 77
    .line 78
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->userType:Ljava/lang/String;

    .line 82
    .line 83
    if-eqz p0, :cond_5

    .line 84
    .line 85
    const/16 p1, 0xc

    .line 86
    .line 87
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 88
    .line 89
    .line 90
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

    .line 91
    check-cast p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/LiveFansClubLevel$1;->serialize(Lcom/p1/mobile/putong/data/LiveFansClubLevel;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
