.class Lcom/p1/mobile/putong/core/data/RecentContractInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/RecentContractInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/RecentContractInfo;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/RecentContractInfo;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->productType:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->membershipType:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->platform:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractStatus:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    const/4 v1, 0x5

    .line 47
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_4
    const/4 v0, 0x6

    .line 53
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->startTime:J

    .line 54
    .line 55
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    const/4 v0, 0x7

    .line 61
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->endTime:J

    .line 62
    .line 63
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    const/16 v0, 0x8

    .line 69
    .line 70
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->cancelTime:J

    .line 71
    .line 72
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    add-int/2addr p0, v0

    .line 77
    const/16 v0, 0x9

    .line 78
    .line 79
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->autoRenew:Z

    .line 80
    .line 81
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    add-int/2addr p0, v0

    .line 86
    const/16 v0, 0xa

    .line 87
    .line 88
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->isUpgraded:Z

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->chargeInterval:Ljava/lang/String;

    .line 96
    .line 97
    if-eqz v0, :cond_5

    .line 98
    .line 99
    const/16 v1, 0xb

    .line 100
    .line 101
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    add-int/2addr p0, v0

    .line 106
    :cond_5
    const/16 v0, 0xc

    .line 107
    .line 108
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->intervalDays:J

    .line 109
    .line 110
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    add-int/2addr p0, v0

    .line 115
    const/16 v0, 0xd

    .line 116
    .line 117
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->createTime:J

    .line 118
    .line 119
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    add-int/2addr p0, v0

    .line 124
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 125
    .line 126
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 127
    check-cast p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/RecentContractInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/RecentContractInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/RecentContractInfo;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/RecentContractInfo;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->productType:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->productType:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->membershipType:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->membershipType:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->platform:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->platform:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractStatus:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractStatus:Ljava/lang/String;

    .line 44
    .line 45
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->chargeInterval:Ljava/lang/String;

    .line 46
    .line 47
    if-nez p1, :cond_a

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->chargeInterval:Ljava/lang/String;

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
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->createTime:J

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 60
    .line 61
    .line 62
    move-result-wide v0

    .line 63
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->intervalDays:J

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->chargeInterval:Ljava/lang/String;

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->isUpgraded:Z

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->autoRenew:Z

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 88
    .line 89
    .line 90
    move-result-wide v0

    .line 91
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->cancelTime:J

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
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->endTime:J

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
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->startTime:J

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractStatus:Ljava/lang/String;

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->platform:Ljava/lang/String;

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->membershipType:Ljava/lang/String;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->productType:Ljava/lang/String;

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractId:Ljava/lang/String;

    .line 142
    .line 143
    goto/16 :goto_0

    .line 144
    .line 145
    :sswitch_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractId:Ljava/lang/String;

    .line 146
    .line 147
    if-nez p1, :cond_5

    .line 148
    .line 149
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractId:Ljava/lang/String;

    .line 150
    .line 151
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->productType:Ljava/lang/String;

    .line 152
    .line 153
    if-nez p1, :cond_6

    .line 154
    .line 155
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->productType:Ljava/lang/String;

    .line 156
    .line 157
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->membershipType:Ljava/lang/String;

    .line 158
    .line 159
    if-nez p1, :cond_7

    .line 160
    .line 161
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->membershipType:Ljava/lang/String;

    .line 162
    .line 163
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->platform:Ljava/lang/String;

    .line 164
    .line 165
    if-nez p1, :cond_8

    .line 166
    .line 167
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->platform:Ljava/lang/String;

    .line 168
    .line 169
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractStatus:Ljava/lang/String;

    .line 170
    .line 171
    if-nez p1, :cond_9

    .line 172
    .line 173
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractStatus:Ljava/lang/String;

    .line 174
    .line 175
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->chargeInterval:Ljava/lang/String;

    .line 176
    .line 177
    if-nez p1, :cond_a

    .line 178
    .line 179
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->chargeInterval:Ljava/lang/String;

    .line 180
    .line 181
    :cond_a
    return-object p0

    .line 182
    nop

    .line 183
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_d
        0xa -> :sswitch_c
        0x12 -> :sswitch_b
        0x1a -> :sswitch_a
        0x22 -> :sswitch_9
        0x2a -> :sswitch_8
        0x30 -> :sswitch_7
        0x38 -> :sswitch_6
        0x40 -> :sswitch_5
        0x48 -> :sswitch_4
        0x50 -> :sswitch_3
        0x5a -> :sswitch_2
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

    .line 183
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/RecentContractInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/RecentContractInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->productType:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->membershipType:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->platform:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractStatus:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p0, :cond_4

    .line 36
    .line 37
    const/4 v0, 0x5

    .line 38
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_4
    const/4 p0, 0x6

    .line 42
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->startTime:J

    .line 43
    .line 44
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x7

    .line 48
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->endTime:J

    .line 49
    .line 50
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 51
    .line 52
    .line 53
    const/16 p0, 0x8

    .line 54
    .line 55
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->cancelTime:J

    .line 56
    .line 57
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 58
    .line 59
    .line 60
    const/16 p0, 0x9

    .line 61
    .line 62
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->autoRenew:Z

    .line 63
    .line 64
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 65
    .line 66
    .line 67
    const/16 p0, 0xa

    .line 68
    .line 69
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->isUpgraded:Z

    .line 70
    .line 71
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->chargeInterval:Ljava/lang/String;

    .line 75
    .line 76
    if-eqz p0, :cond_5

    .line 77
    .line 78
    const/16 v0, 0xb

    .line 79
    .line 80
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_5
    const/16 p0, 0xc

    .line 84
    .line 85
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->intervalDays:J

    .line 86
    .line 87
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 88
    .line 89
    .line 90
    const/16 p0, 0xd

    .line 91
    .line 92
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->createTime:J

    .line 93
    .line 94
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 98
    check-cast p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/RecentContractInfo$1;->serialize(Lcom/p1/mobile/putong/core/data/RecentContractInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
