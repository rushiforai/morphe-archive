.class Lcom/p1/mobile/putong/core/data/MatePlanQuestion$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MatePlanQuestion;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/MatePlanQuestion;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MatePlanQuestion;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->questionId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->content:Ljava/lang/String;

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
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->index:I

    .line 24
    .line 25
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->category:Ljava/lang/String;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x4

    .line 35
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->questionType:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz v0, :cond_3

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
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->attribute:Lcom/p1/mobile/putong/core/data/MatePlanQuestionAttribute;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x6

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/core/data/MatePlanQuestionAttribute;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 56
    .line 57
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->logo:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    const/4 v1, 0x7

    .line 67
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->status:Ljava/lang/String;

    .line 73
    .line 74
    if-eqz v0, :cond_6

    .line 75
    .line 76
    const/16 v1, 0x8

    .line 77
    .line 78
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    add-int/2addr p0, v0

    .line 83
    :cond_6
    const/16 v0, 0x9

    .line 84
    .line 85
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->createdTime:D

    .line 86
    .line 87
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    add-int/2addr p0, v0

    .line 92
    const/16 v0, 0xa

    .line 93
    .line 94
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->updatedTime:D

    .line 95
    .line 96
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    add-int/2addr p0, v0

    .line 101
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 102
    .line 103
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 104
    check-cast p1, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MatePlanQuestion$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MatePlanQuestion;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MatePlanQuestion;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->questionId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->questionId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->content:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->content:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->category:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->category:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->questionType:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->questionType:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->attribute:Lcom/p1/mobile/putong/core/data/MatePlanQuestionAttribute;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MatePlanQuestionAttribute;->new_()Lcom/p1/mobile/putong/core/data/MatePlanQuestionAttribute;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->attribute:Lcom/p1/mobile/putong/core/data/MatePlanQuestionAttribute;

    .line 48
    .line 49
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->logo:Ljava/lang/String;

    .line 50
    .line 51
    if-nez p1, :cond_5

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->logo:Ljava/lang/String;

    .line 54
    .line 55
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->status:Ljava/lang/String;

    .line 56
    .line 57
    if-nez p1, :cond_c

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->status:Ljava/lang/String;

    .line 60
    .line 61
    return-object p0

    .line 62
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 63
    .line 64
    .line 65
    move-result-wide v0

    .line 66
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->updatedTime:D

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 70
    .line 71
    .line 72
    move-result-wide v0

    .line 73
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->createdTime:D

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->status:Ljava/lang/String;

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->logo:Ljava/lang/String;

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :sswitch_4
    sget-object v0, Lcom/p1/mobile/putong/core/data/MatePlanQuestionAttribute;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 91
    .line 92
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    check-cast v0, Lcom/p1/mobile/putong/core/data/MatePlanQuestionAttribute;

    .line 97
    .line 98
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->attribute:Lcom/p1/mobile/putong/core/data/MatePlanQuestionAttribute;

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->questionType:Ljava/lang/String;

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->category:Ljava/lang/String;

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    iput v0, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->index:I

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->content:Ljava/lang/String;

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->questionId:Ljava/lang/String;

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :sswitch_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->questionId:Ljava/lang/String;

    .line 138
    .line 139
    if-nez p1, :cond_6

    .line 140
    .line 141
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->questionId:Ljava/lang/String;

    .line 142
    .line 143
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->content:Ljava/lang/String;

    .line 144
    .line 145
    if-nez p1, :cond_7

    .line 146
    .line 147
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->content:Ljava/lang/String;

    .line 148
    .line 149
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->category:Ljava/lang/String;

    .line 150
    .line 151
    if-nez p1, :cond_8

    .line 152
    .line 153
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->category:Ljava/lang/String;

    .line 154
    .line 155
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->questionType:Ljava/lang/String;

    .line 156
    .line 157
    if-nez p1, :cond_9

    .line 158
    .line 159
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->questionType:Ljava/lang/String;

    .line 160
    .line 161
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->attribute:Lcom/p1/mobile/putong/core/data/MatePlanQuestionAttribute;

    .line 162
    .line 163
    if-nez p1, :cond_a

    .line 164
    .line 165
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MatePlanQuestionAttribute;->new_()Lcom/p1/mobile/putong/core/data/MatePlanQuestionAttribute;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->attribute:Lcom/p1/mobile/putong/core/data/MatePlanQuestionAttribute;

    .line 170
    .line 171
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->logo:Ljava/lang/String;

    .line 172
    .line 173
    if-nez p1, :cond_b

    .line 174
    .line 175
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->logo:Ljava/lang/String;

    .line 176
    .line 177
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->status:Ljava/lang/String;

    .line 178
    .line 179
    if-nez p1, :cond_c

    .line 180
    .line 181
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->status:Ljava/lang/String;

    .line 182
    .line 183
    :cond_c
    return-object p0

    .line 184
    nop

    .line 185
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_a
        0xa -> :sswitch_9
        0x12 -> :sswitch_8
        0x18 -> :sswitch_7
        0x22 -> :sswitch_6
        0x2a -> :sswitch_5
        0x32 -> :sswitch_4
        0x3a -> :sswitch_3
        0x42 -> :sswitch_2
        0x49 -> :sswitch_1
        0x51 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 185
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MatePlanQuestion$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MatePlanQuestion;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/MatePlanQuestion;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->questionId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->content:Ljava/lang/String;

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
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->index:I

    .line 19
    .line 20
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->category:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->questionType:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x5

    .line 36
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->attribute:Lcom/p1/mobile/putong/core/data/MatePlanQuestionAttribute;

    .line 40
    .line 41
    if-eqz p0, :cond_4

    .line 42
    .line 43
    const/4 v0, 0x6

    .line 44
    sget-object v1, Lcom/p1/mobile/putong/core/data/MatePlanQuestionAttribute;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 45
    .line 46
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 47
    .line 48
    .line 49
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->logo:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz p0, :cond_5

    .line 52
    .line 53
    const/4 v0, 0x7

    .line 54
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->status:Ljava/lang/String;

    .line 58
    .line 59
    if-eqz p0, :cond_6

    .line 60
    .line 61
    const/16 v0, 0x8

    .line 62
    .line 63
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_6
    const/16 p0, 0x9

    .line 67
    .line 68
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->createdTime:D

    .line 69
    .line 70
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 71
    .line 72
    .line 73
    const/16 p0, 0xa

    .line 74
    .line 75
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;->updatedTime:D

    .line 76
    .line 77
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 81
    check-cast p1, Lcom/p1/mobile/putong/core/data/MatePlanQuestion;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MatePlanQuestion$1;->serialize(Lcom/p1/mobile/putong/core/data/MatePlanQuestion;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
