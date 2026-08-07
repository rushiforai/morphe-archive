.class Lcom/p1/mobile/putong/data/UserMedal$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/UserMedal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/UserMedal;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/UserMedal;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserMedal;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserMedal;->liveID:Ljava/lang/String;

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
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/UserMedal;->expireTime:J

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
    iget v1, p1, Lcom/p1/mobile/putong/data/UserMedal;->fanbaseGrade:I

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserMedal;->familyText:Ljava/lang/String;

    .line 39
    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    const/4 v1, 0x5

    .line 43
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    :cond_2
    const/4 v0, 0x6

    .line 49
    iget v1, p1, Lcom/p1/mobile/putong/data/UserMedal;->familyGrade:I

    .line 50
    .line 51
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    const/4 v0, 0x7

    .line 57
    iget v1, p1, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseGrade:I

    .line 58
    .line 59
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseColor:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz v0, :cond_3

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
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseText:Ljava/lang/String;

    .line 76
    .line 77
    if-eqz v0, :cond_4

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
    :cond_4
    const/16 v0, 0xa

    .line 87
    .line 88
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/UserMedal;->familyLight:Z

    .line 89
    .line 90
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

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

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 98
    check-cast p1, Lcom/p1/mobile/putong/data/UserMedal;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/UserMedal$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/UserMedal;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/UserMedal;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/UserMedal;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/UserMedal;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserMedal;->id:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserMedal;->id:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserMedal;->liveID:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserMedal;->liveID:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserMedal;->familyText:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserMedal;->familyText:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseColor:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseColor:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseText:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_8

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseText:Ljava/lang/String;

    .line 44
    .line 45
    return-object p0

    .line 46
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/UserMedal;->familyLight:Z

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseText:Ljava/lang/String;

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseColor:Ljava/lang/String;

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iput v0, p0, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseGrade:I

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    iput v0, p0, Lcom/p1/mobile/putong/data/UserMedal;->familyGrade:I

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserMedal;->familyText:Ljava/lang/String;

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iput v0, p0, Lcom/p1/mobile/putong/data/UserMedal;->fanbaseGrade:I

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 96
    .line 97
    .line 98
    move-result-wide v0

    .line 99
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/UserMedal;->expireTime:J

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserMedal;->liveID:Ljava/lang/String;

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserMedal;->id:Ljava/lang/String;

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :sswitch_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserMedal;->id:Ljava/lang/String;

    .line 117
    .line 118
    if-nez p1, :cond_4

    .line 119
    .line 120
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserMedal;->id:Ljava/lang/String;

    .line 121
    .line 122
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserMedal;->liveID:Ljava/lang/String;

    .line 123
    .line 124
    if-nez p1, :cond_5

    .line 125
    .line 126
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserMedal;->liveID:Ljava/lang/String;

    .line 127
    .line 128
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserMedal;->familyText:Ljava/lang/String;

    .line 129
    .line 130
    if-nez p1, :cond_6

    .line 131
    .line 132
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserMedal;->familyText:Ljava/lang/String;

    .line 133
    .line 134
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseColor:Ljava/lang/String;

    .line 135
    .line 136
    if-nez p1, :cond_7

    .line 137
    .line 138
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseColor:Ljava/lang/String;

    .line 139
    .line 140
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseText:Ljava/lang/String;

    .line 141
    .line 142
    if-nez p1, :cond_8

    .line 143
    .line 144
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseText:Ljava/lang/String;

    .line 145
    .line 146
    :cond_8
    return-object p0

    .line 147
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_a
        0xa -> :sswitch_9
        0x12 -> :sswitch_8
        0x18 -> :sswitch_7
        0x20 -> :sswitch_6
        0x2a -> :sswitch_5
        0x30 -> :sswitch_4
        0x38 -> :sswitch_3
        0x42 -> :sswitch_2
        0x4a -> :sswitch_1
        0x50 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 147
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/UserMedal$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/UserMedal;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/UserMedal;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserMedal;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserMedal;->liveID:Ljava/lang/String;

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
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/UserMedal;->expireTime:J

    .line 19
    .line 20
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x4

    .line 24
    iget v0, p1, Lcom/p1/mobile/putong/data/UserMedal;->fanbaseGrade:I

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserMedal;->familyText:Ljava/lang/String;

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
    const/4 p0, 0x6

    .line 38
    iget v0, p1, Lcom/p1/mobile/putong/data/UserMedal;->familyGrade:I

    .line 39
    .line 40
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x7

    .line 44
    iget v0, p1, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseGrade:I

    .line 45
    .line 46
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseColor:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz p0, :cond_3

    .line 52
    .line 53
    const/16 v0, 0x8

    .line 54
    .line 55
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseText:Ljava/lang/String;

    .line 59
    .line 60
    if-eqz p0, :cond_4

    .line 61
    .line 62
    const/16 v0, 0x9

    .line 63
    .line 64
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_4
    const/16 p0, 0xa

    .line 68
    .line 69
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/UserMedal;->familyLight:Z

    .line 70
    .line 71
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 75
    check-cast p1, Lcom/p1/mobile/putong/data/UserMedal;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/UserMedal$1;->serialize(Lcom/p1/mobile/putong/data/UserMedal;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
