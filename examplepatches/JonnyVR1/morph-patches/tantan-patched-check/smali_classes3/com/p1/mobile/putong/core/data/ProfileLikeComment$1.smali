.class Lcom/p1/mobile/putong/core/data/ProfileLikeComment$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ProfileLikeComment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/ProfileLikeComment;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ProfileLikeComment;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->userId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->module:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->category:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->comment:Ljava/lang/String;

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
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->createdTime:D

    .line 54
    .line 55
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->identifier:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz v0, :cond_5

    .line 63
    .line 64
    const/4 v1, 0x7

    .line 65
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->snapshot:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz v0, :cond_6

    .line 73
    .line 74
    const/16 v1, 0x8

    .line 75
    .line 76
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    add-int/2addr p0, v0

    .line 81
    :cond_6
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 82
    .line 83
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 84
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ProfileLikeComment$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ProfileLikeComment;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ProfileLikeComment;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;-><init>()V

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
    if-eqz v0, :cond_e

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_d

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_c

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_b

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_a

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_9

    .line 33
    .line 34
    const/16 v2, 0x31

    .line 35
    .line 36
    if-eq v0, v2, :cond_8

    .line 37
    .line 38
    const/16 v2, 0x3a

    .line 39
    .line 40
    if-eq v0, v2, :cond_7

    .line 41
    .line 42
    const/16 v2, 0x42

    .line 43
    .line 44
    if-eq v0, v2, :cond_6

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->id:Ljava/lang/String;

    .line 47
    .line 48
    if-nez p1, :cond_0

    .line 49
    .line 50
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->id:Ljava/lang/String;

    .line 51
    .line 52
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->userId:Ljava/lang/String;

    .line 53
    .line 54
    if-nez p1, :cond_1

    .line 55
    .line 56
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->userId:Ljava/lang/String;

    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->module:Ljava/lang/String;

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->module:Ljava/lang/String;

    .line 63
    .line 64
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->category:Ljava/lang/String;

    .line 65
    .line 66
    if-nez p1, :cond_3

    .line 67
    .line 68
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->category:Ljava/lang/String;

    .line 69
    .line 70
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->identifier:Ljava/lang/String;

    .line 71
    .line 72
    if-nez p1, :cond_4

    .line 73
    .line 74
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->identifier:Ljava/lang/String;

    .line 75
    .line 76
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->snapshot:Ljava/lang/String;

    .line 77
    .line 78
    if-nez p1, :cond_5

    .line 79
    .line 80
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->snapshot:Ljava/lang/String;

    .line 81
    .line 82
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->comment:Ljava/lang/String;

    .line 83
    .line 84
    if-nez p1, :cond_15

    .line 85
    .line 86
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->comment:Ljava/lang/String;

    .line 87
    .line 88
    return-object p0

    .line 89
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->snapshot:Ljava/lang/String;

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->identifier:Ljava/lang/String;

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 104
    .line 105
    .line 106
    move-result-wide v0

    .line 107
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->createdTime:D

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->comment:Ljava/lang/String;

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->category:Ljava/lang/String;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->module:Ljava/lang/String;

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->userId:Ljava/lang/String;

    .line 136
    .line 137
    goto/16 :goto_0

    .line 138
    .line 139
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->id:Ljava/lang/String;

    .line 144
    .line 145
    goto/16 :goto_0

    .line 146
    .line 147
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->id:Ljava/lang/String;

    .line 148
    .line 149
    if-nez p1, :cond_f

    .line 150
    .line 151
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->id:Ljava/lang/String;

    .line 152
    .line 153
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->userId:Ljava/lang/String;

    .line 154
    .line 155
    if-nez p1, :cond_10

    .line 156
    .line 157
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->userId:Ljava/lang/String;

    .line 158
    .line 159
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->module:Ljava/lang/String;

    .line 160
    .line 161
    if-nez p1, :cond_11

    .line 162
    .line 163
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->module:Ljava/lang/String;

    .line 164
    .line 165
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->category:Ljava/lang/String;

    .line 166
    .line 167
    if-nez p1, :cond_12

    .line 168
    .line 169
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->category:Ljava/lang/String;

    .line 170
    .line 171
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->identifier:Ljava/lang/String;

    .line 172
    .line 173
    if-nez p1, :cond_13

    .line 174
    .line 175
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->identifier:Ljava/lang/String;

    .line 176
    .line 177
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->snapshot:Ljava/lang/String;

    .line 178
    .line 179
    if-nez p1, :cond_14

    .line 180
    .line 181
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->snapshot:Ljava/lang/String;

    .line 182
    .line 183
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->comment:Ljava/lang/String;

    .line 184
    .line 185
    if-nez p1, :cond_15

    .line 186
    .line 187
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->comment:Ljava/lang/String;

    .line 188
    .line 189
    :cond_15
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 190
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ProfileLikeComment$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/ProfileLikeComment;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->userId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->module:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->category:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->comment:Ljava/lang/String;

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
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->createdTime:D

    .line 43
    .line 44
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->identifier:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz p0, :cond_5

    .line 50
    .line 51
    const/4 v0, 0x7

    .line 52
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->snapshot:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz p0, :cond_6

    .line 58
    .line 59
    const/16 p1, 0x8

    .line 60
    .line 61
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_6
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 65
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ProfileLikeComment$1;->serialize(Lcom/p1/mobile/putong/core/data/ProfileLikeComment;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
