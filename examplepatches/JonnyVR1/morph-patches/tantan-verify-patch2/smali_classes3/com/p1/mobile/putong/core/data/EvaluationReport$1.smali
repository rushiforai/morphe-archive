.class Lcom/p1/mobile/putong/core/data/EvaluationReport$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/EvaluationReport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/EvaluationReport;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/EvaluationReport;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->id:J

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->evaluationId:J

    .line 10
    .line 11
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    const/4 v0, 0x3

    .line 17
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->completed:Z

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    const/4 v0, 0x4

    .line 25
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->type:J

    .line 26
    .line 27
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->name:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    const/4 v1, 0x5

    .line 37
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->description:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->pictureUrl:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v0, :cond_2

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
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->reportUrl:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz v0, :cond_3

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
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->detailUrl:Ljava/lang/String;

    .line 74
    .line 75
    if-eqz v0, :cond_4

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
    :cond_4
    const/16 v0, 0xa

    .line 85
    .line 86
    iget v1, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->coinPrice:I

    .line 87
    .line 88
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    add-int/2addr p0, v0

    .line 93
    const/16 v0, 0xb

    .line 94
    .line 95
    iget v1, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->scaleType:I

    .line 96
    .line 97
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    add-int/2addr p0, v0

    .line 102
    const/16 v0, 0xc

    .line 103
    .line 104
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->reportTime:J

    .line 105
    .line 106
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    add-int/2addr p0, v0

    .line 111
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 112
    .line 113
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 114
    check-cast p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/EvaluationReport$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/EvaluationReport;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/EvaluationReport;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/EvaluationReport;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->name:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->name:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->description:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->description:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->pictureUrl:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->pictureUrl:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->reportUrl:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->reportUrl:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->detailUrl:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_8

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->detailUrl:Ljava/lang/String;

    .line 44
    .line 45
    return-object p0

    .line 46
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 47
    .line 48
    .line 49
    move-result-wide v0

    .line 50
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->reportTime:J

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iput v0, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->scaleType:I

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iput v0, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->coinPrice:I

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->detailUrl:Ljava/lang/String;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->reportUrl:Ljava/lang/String;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->pictureUrl:Ljava/lang/String;

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->description:Ljava/lang/String;

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->name:Ljava/lang/String;

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 103
    .line 104
    .line 105
    move-result-wide v0

    .line 106
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->type:J

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->completed:Z

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 117
    .line 118
    .line 119
    move-result-wide v0

    .line 120
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->evaluationId:J

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 124
    .line 125
    .line 126
    move-result-wide v0

    .line 127
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->id:J

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :sswitch_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->name:Ljava/lang/String;

    .line 131
    .line 132
    if-nez p1, :cond_4

    .line 133
    .line 134
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->name:Ljava/lang/String;

    .line 135
    .line 136
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->description:Ljava/lang/String;

    .line 137
    .line 138
    if-nez p1, :cond_5

    .line 139
    .line 140
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->description:Ljava/lang/String;

    .line 141
    .line 142
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->pictureUrl:Ljava/lang/String;

    .line 143
    .line 144
    if-nez p1, :cond_6

    .line 145
    .line 146
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->pictureUrl:Ljava/lang/String;

    .line 147
    .line 148
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->reportUrl:Ljava/lang/String;

    .line 149
    .line 150
    if-nez p1, :cond_7

    .line 151
    .line 152
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->reportUrl:Ljava/lang/String;

    .line 153
    .line 154
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->detailUrl:Ljava/lang/String;

    .line 155
    .line 156
    if-nez p1, :cond_8

    .line 157
    .line 158
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/EvaluationReport;->detailUrl:Ljava/lang/String;

    .line 159
    .line 160
    :cond_8
    return-object p0

    .line 161
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_c
        0x8 -> :sswitch_b
        0x10 -> :sswitch_a
        0x18 -> :sswitch_9
        0x20 -> :sswitch_8
        0x2a -> :sswitch_7
        0x32 -> :sswitch_6
        0x3a -> :sswitch_5
        0x42 -> :sswitch_4
        0x4a -> :sswitch_3
        0x50 -> :sswitch_2
        0x58 -> :sswitch_1
        0x60 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 161
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/EvaluationReport$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/EvaluationReport;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/EvaluationReport;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->id:J

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->evaluationId:J

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->completed:Z

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x4

    .line 20
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->type:J

    .line 21
    .line 22
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->name:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const/4 v0, 0x5

    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->description:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->pictureUrl:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    const/4 v0, 0x7

    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->reportUrl:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->detailUrl:Ljava/lang/String;

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
    iget v0, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->coinPrice:I

    .line 70
    .line 71
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 72
    .line 73
    .line 74
    const/16 p0, 0xb

    .line 75
    .line 76
    iget v0, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->scaleType:I

    .line 77
    .line 78
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 79
    .line 80
    .line 81
    const/16 p0, 0xc

    .line 82
    .line 83
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;->reportTime:J

    .line 84
    .line 85
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 89
    check-cast p1, Lcom/p1/mobile/putong/core/data/EvaluationReport;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/EvaluationReport$1;->serialize(Lcom/p1/mobile/putong/core/data/EvaluationReport;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
