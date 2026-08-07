.class Lcom/p1/mobile/putong/core/data/AppealInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/AppealInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/AppealInfo;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/AppealInfo;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->id:Ljava/lang/String;

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
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppeal:Z

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/2addr p0, v0

    .line 20
    const/4 v0, 0x3

    .line 21
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->allowAppeal:Z

    .line 22
    .line 23
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->reason:Lcom/p1/mobile/putong/core/data/AppealReason;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    const/4 v1, 0x4

    .line 33
    sget-object v2, Lcom/p1/mobile/putong/core/data/AppealReason;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 34
    .line 35
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->method:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    const/4 v1, 0x5

    .line 45
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->status:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    const/4 v1, 0x6

    .line 55
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    :cond_3
    const/4 v0, 0x7

    .line 61
    iget v1, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->appeal_count:I

    .line 62
    .line 63
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppealDescription:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz v0, :cond_4

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
    :cond_4
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 80
    .line 81
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 82
    check-cast p1, Lcom/p1/mobile/putong/core/data/AppealInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/AppealInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/AppealInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/AppealInfo;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/AppealInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/AppealInfo;-><init>()V

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
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_b

    .line 17
    .line 18
    const/16 v2, 0x10

    .line 19
    .line 20
    if-eq v0, v2, :cond_a

    .line 21
    .line 22
    const/16 v2, 0x18

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
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_7

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_6

    .line 37
    .line 38
    const/16 v2, 0x38

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->id:Ljava/lang/String;

    .line 47
    .line 48
    if-nez p1, :cond_0

    .line 49
    .line 50
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->id:Ljava/lang/String;

    .line 51
    .line 52
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->reason:Lcom/p1/mobile/putong/core/data/AppealReason;

    .line 53
    .line 54
    if-nez p1, :cond_1

    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AppealReason;->new_()Lcom/p1/mobile/putong/core/data/AppealReason;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->reason:Lcom/p1/mobile/putong/core/data/AppealReason;

    .line 61
    .line 62
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->method:Ljava/lang/String;

    .line 63
    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->method:Ljava/lang/String;

    .line 67
    .line 68
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->status:Ljava/lang/String;

    .line 69
    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->status:Ljava/lang/String;

    .line 73
    .line 74
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppealDescription:Ljava/lang/String;

    .line 75
    .line 76
    if-nez p1, :cond_11

    .line 77
    .line 78
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppealDescription:Ljava/lang/String;

    .line 79
    .line 80
    return-object p0

    .line 81
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppealDescription:Ljava/lang/String;

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iput v0, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->appeal_count:I

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->status:Ljava/lang/String;

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->method:Ljava/lang/String;

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/core/data/AppealReason;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 110
    .line 111
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Lcom/p1/mobile/putong/core/data/AppealReason;

    .line 116
    .line 117
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->reason:Lcom/p1/mobile/putong/core/data/AppealReason;

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->allowAppeal:Z

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppeal:Z

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->id:Ljava/lang/String;

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->id:Ljava/lang/String;

    .line 143
    .line 144
    if-nez p1, :cond_d

    .line 145
    .line 146
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->id:Ljava/lang/String;

    .line 147
    .line 148
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->reason:Lcom/p1/mobile/putong/core/data/AppealReason;

    .line 149
    .line 150
    if-nez p1, :cond_e

    .line 151
    .line 152
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AppealReason;->new_()Lcom/p1/mobile/putong/core/data/AppealReason;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->reason:Lcom/p1/mobile/putong/core/data/AppealReason;

    .line 157
    .line 158
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->method:Ljava/lang/String;

    .line 159
    .line 160
    if-nez p1, :cond_f

    .line 161
    .line 162
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->method:Ljava/lang/String;

    .line 163
    .line 164
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->status:Ljava/lang/String;

    .line 165
    .line 166
    if-nez p1, :cond_10

    .line 167
    .line 168
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->status:Ljava/lang/String;

    .line 169
    .line 170
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppealDescription:Ljava/lang/String;

    .line 171
    .line 172
    if-nez p1, :cond_11

    .line 173
    .line 174
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppealDescription:Ljava/lang/String;

    .line 175
    .line 176
    :cond_11
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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/AppealInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/AppealInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/AppealInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->id:Ljava/lang/String;

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
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppeal:Z

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x3

    .line 16
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->allowAppeal:Z

    .line 17
    .line 18
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->reason:Lcom/p1/mobile/putong/core/data/AppealReason;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x4

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/data/AppealReason;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->method:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    const/4 v0, 0x5

    .line 36
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->status:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz p0, :cond_3

    .line 42
    .line 43
    const/4 v0, 0x6

    .line 44
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_3
    const/4 p0, 0x7

    .line 48
    iget v0, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->appeal_count:I

    .line 49
    .line 50
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppealDescription:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz p0, :cond_4

    .line 56
    .line 57
    const/16 p1, 0x8

    .line 58
    .line 59
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 60
    .line 61
    .line 62
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

    .line 63
    check-cast p1, Lcom/p1/mobile/putong/core/data/AppealInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/AppealInfo$1;->serialize(Lcom/p1/mobile/putong/core/data/AppealInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
