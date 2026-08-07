.class Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->smallDynamicUrl:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->mediumDynamicUrl:Ljava/lang/String;

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
    const/4 v0, 0x5

    .line 43
    iget v1, p1, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->totalSec:I

    .line 44
    .line 45
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    const/4 v0, 0x6

    .line 51
    iget v1, p1, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->remainingSec:I

    .line 52
    .line 53
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    const/4 v0, 0x7

    .line 59
    iget v1, p1, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->changeVoiceNo:I

    .line 60
    .line 61
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    const/16 v0, 0x8

    .line 67
    .line 68
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->endMill:J

    .line 69
    .line 70
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    add-int/2addr p0, v0

    .line 75
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->funnyUrl:Ljava/lang/String;

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
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 87
    .line 88
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 89
    check-cast p1, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;-><init>()V

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
    if-eqz v0, :cond_d

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_c

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_b

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_a

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_9

    .line 29
    .line 30
    const/16 v2, 0x28

    .line 31
    .line 32
    if-eq v0, v2, :cond_8

    .line 33
    .line 34
    const/16 v2, 0x30

    .line 35
    .line 36
    if-eq v0, v2, :cond_7

    .line 37
    .line 38
    const/16 v2, 0x38

    .line 39
    .line 40
    if-eq v0, v2, :cond_6

    .line 41
    .line 42
    const/16 v2, 0x40

    .line 43
    .line 44
    if-eq v0, v2, :cond_5

    .line 45
    .line 46
    const/16 v2, 0x4a

    .line 47
    .line 48
    if-eq v0, v2, :cond_4

    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 55
    .line 56
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 61
    .line 62
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->smallDynamicUrl:Ljava/lang/String;

    .line 63
    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->smallDynamicUrl:Ljava/lang/String;

    .line 67
    .line 68
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->mediumDynamicUrl:Ljava/lang/String;

    .line 69
    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->mediumDynamicUrl:Ljava/lang/String;

    .line 73
    .line 74
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->funnyUrl:Ljava/lang/String;

    .line 75
    .line 76
    if-nez p1, :cond_12

    .line 77
    .line 78
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->funnyUrl:Ljava/lang/String;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->funnyUrl:Ljava/lang/String;

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 89
    .line 90
    .line 91
    move-result-wide v0

    .line 92
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->endMill:J

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    iput v0, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->changeVoiceNo:I

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    iput v0, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->remainingSec:I

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    iput v0, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->totalSec:I

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->mediumDynamicUrl:Ljava/lang/String;

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->smallDynamicUrl:Ljava/lang/String;

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 143
    .line 144
    goto/16 :goto_0

    .line 145
    .line 146
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 147
    .line 148
    if-nez p1, :cond_e

    .line 149
    .line 150
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 151
    .line 152
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 153
    .line 154
    if-nez p1, :cond_f

    .line 155
    .line 156
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 157
    .line 158
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->smallDynamicUrl:Ljava/lang/String;

    .line 159
    .line 160
    if-nez p1, :cond_10

    .line 161
    .line 162
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->smallDynamicUrl:Ljava/lang/String;

    .line 163
    .line 164
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->mediumDynamicUrl:Ljava/lang/String;

    .line 165
    .line 166
    if-nez p1, :cond_11

    .line 167
    .line 168
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->mediumDynamicUrl:Ljava/lang/String;

    .line 169
    .line 170
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->funnyUrl:Ljava/lang/String;

    .line 171
    .line 172
    if-nez p1, :cond_12

    .line 173
    .line 174
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->funnyUrl:Ljava/lang/String;

    .line 175
    .line 176
    :cond_12
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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->smallDynamicUrl:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->mediumDynamicUrl:Ljava/lang/String;

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
    const/4 p0, 0x5

    .line 34
    iget v0, p1, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->totalSec:I

    .line 35
    .line 36
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x6

    .line 40
    iget v0, p1, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->remainingSec:I

    .line 41
    .line 42
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x7

    .line 46
    iget v0, p1, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->changeVoiceNo:I

    .line 47
    .line 48
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 49
    .line 50
    .line 51
    const/16 p0, 0x8

    .line 52
    .line 53
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->endMill:J

    .line 54
    .line 55
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->funnyUrl:Ljava/lang/String;

    .line 59
    .line 60
    if-eqz p0, :cond_4

    .line 61
    .line 62
    const/16 p1, 0x9

    .line 63
    .line 64
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 65
    .line 66
    .line 67
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

    .line 68
    check-cast p1, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig$1;->serialize(Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
