.class Lcom/p1/mobile/putong/data/GivenGiftBrief$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/GivenGiftBrief;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/GivenGiftBrief;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/GivenGiftBrief;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->id:I

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
    iget v1, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->num:I

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    const/4 v0, 0x3

    .line 17
    iget v1, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->giftLevel:I

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    iget-object v0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->from:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    const/4 v1, 0x5

    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->userName:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    const/4 v1, 0x6

    .line 49
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->comboId:Ljava/lang/String;

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
    const/16 v0, 0x8

    .line 65
    .line 66
    iget v1, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->combos:I

    .line 67
    .line 68
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    add-int/2addr p0, v0

    .line 73
    const/16 v0, 0x9

    .line 74
    .line 75
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->pollFromNetwork:Z

    .line 76
    .line 77
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    add-int/2addr p0, v0

    .line 82
    const/16 v0, 0xa

    .line 83
    .line 84
    iget v1, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->stickFacePositionType:I

    .line 85
    .line 86
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    add-int/2addr p0, v0

    .line 91
    const/16 v0, 0xb

    .line 92
    .line 93
    iget v1, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->remain:I

    .line 94
    .line 95
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr p0, v0

    .line 100
    const/16 v0, 0xc

    .line 101
    .line 102
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->expiredTime:J

    .line 103
    .line 104
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    add-int/2addr p0, v0

    .line 109
    const/16 v0, 0xd

    .line 110
    .line 111
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->isFirstGivenGift:Z

    .line 112
    .line 113
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    add-int/2addr p0, v0

    .line 118
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 119
    .line 120
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 121
    check-cast p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/GivenGiftBrief$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/GivenGiftBrief;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/GivenGiftBrief;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/GivenGiftBrief;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->from:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->from:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->userName:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->userName:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->comboId:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_6

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->comboId:Ljava/lang/String;

    .line 38
    .line 39
    return-object p0

    .line 40
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->isFirstGivenGift:Z

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 48
    .line 49
    .line 50
    move-result-wide v0

    .line 51
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->expiredTime:J

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
    iput v0, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->remain:I

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iput v0, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->stickFacePositionType:I

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->pollFromNetwork:Z

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    iput v0, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->combos:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->comboId:Ljava/lang/String;

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->userName:Ljava/lang/String;

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iput-object v0, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iput-object v0, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->from:Ljava/lang/String;

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    iput v0, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->giftLevel:I

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    iput v0, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->num:I

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    iput v0, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->id:I

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :sswitch_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->from:Ljava/lang/String;

    .line 132
    .line 133
    if-nez p1, :cond_3

    .line 134
    .line 135
    iput-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->from:Ljava/lang/String;

    .line 136
    .line 137
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 138
    .line 139
    if-nez p1, :cond_4

    .line 140
    .line 141
    iput-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 142
    .line 143
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->userName:Ljava/lang/String;

    .line 144
    .line 145
    if-nez p1, :cond_5

    .line 146
    .line 147
    iput-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->userName:Ljava/lang/String;

    .line 148
    .line 149
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->comboId:Ljava/lang/String;

    .line 150
    .line 151
    if-nez p1, :cond_6

    .line 152
    .line 153
    iput-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->comboId:Ljava/lang/String;

    .line 154
    .line 155
    :cond_6
    return-object p0

    .line 156
    nop

    .line 157
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_d
        0x8 -> :sswitch_c
        0x10 -> :sswitch_b
        0x18 -> :sswitch_a
        0x22 -> :sswitch_9
        0x2a -> :sswitch_8
        0x32 -> :sswitch_7
        0x3a -> :sswitch_6
        0x40 -> :sswitch_5
        0x48 -> :sswitch_4
        0x50 -> :sswitch_3
        0x58 -> :sswitch_2
        0x60 -> :sswitch_1
        0x68 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 157
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/GivenGiftBrief$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/GivenGiftBrief;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/GivenGiftBrief;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->id:I

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget v0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->num:I

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    iget v0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->giftLevel:I

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->from:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    const/4 v0, 0x5

    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->userName:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    const/4 v0, 0x6

    .line 40
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->comboId:Ljava/lang/String;

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
    const/16 p0, 0x8

    .line 52
    .line 53
    iget v0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->combos:I

    .line 54
    .line 55
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 56
    .line 57
    .line 58
    const/16 p0, 0x9

    .line 59
    .line 60
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->pollFromNetwork:Z

    .line 61
    .line 62
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 63
    .line 64
    .line 65
    const/16 p0, 0xa

    .line 66
    .line 67
    iget v0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->stickFacePositionType:I

    .line 68
    .line 69
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 70
    .line 71
    .line 72
    const/16 p0, 0xb

    .line 73
    .line 74
    iget v0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->remain:I

    .line 75
    .line 76
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 77
    .line 78
    .line 79
    const/16 p0, 0xc

    .line 80
    .line 81
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->expiredTime:J

    .line 82
    .line 83
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 84
    .line 85
    .line 86
    const/16 p0, 0xd

    .line 87
    .line 88
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->isFirstGivenGift:Z

    .line 89
    .line 90
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 94
    check-cast p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/GivenGiftBrief$1;->serialize(Lcom/p1/mobile/putong/data/GivenGiftBrief;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
