.class Lcom/p1/mobile/putong/data/UssTags$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/UssTags;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/UssTags;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/UssTags;)I
    .locals 2

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/data/UssTags;->onlineStatus:I

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
    iget v1, p1, Lcom/p1/mobile/putong/data/UssTags;->selected:I

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
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/UssTags;->newUser:Z

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UssTags;->cardStyle:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UssTags;->avatarIdentifier:Ljava/lang/String;

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
    const/4 v0, 0x6

    .line 45
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/UssTags;->repeatedUser:Z

    .line 46
    .line 47
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UssTags;->title:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UssTags;->subTitle:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UssTags;->debugInfo:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UssTags;->eventInfo:Ljava/lang/String;

    .line 85
    .line 86
    if-eqz v0, :cond_5

    .line 87
    .line 88
    const/16 v1, 0xa

    .line 89
    .line 90
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    add-int/2addr p0, v0

    .line 95
    :cond_5
    const/16 v0, 0xb

    .line 96
    .line 97
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/UssTags;->showAboutMeOnCard:Z

    .line 98
    .line 99
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    add-int/2addr p0, v0

    .line 104
    const/16 v0, 0xc

    .line 105
    .line 106
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/UssTags;->onlyShowAboutMeInside:Z

    .line 107
    .line 108
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    add-int/2addr p0, v0

    .line 113
    const/16 v0, 0xd

    .line 114
    .line 115
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/UssTags;->profileShowFollowButton:Z

    .line 116
    .line 117
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    add-int/2addr p0, v0

    .line 122
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 123
    .line 124
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 125
    check-cast p1, Lcom/p1/mobile/putong/data/UssTags;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/UssTags$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/UssTags;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/UssTags;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/UssTags;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/UssTags;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UssTags;->cardStyle:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->cardStyle:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UssTags;->avatarIdentifier:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->avatarIdentifier:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UssTags;->title:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->title:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UssTags;->subTitle:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->subTitle:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UssTags;->debugInfo:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->debugInfo:Ljava/lang/String;

    .line 44
    .line 45
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UssTags;->eventInfo:Ljava/lang/String;

    .line 46
    .line 47
    if-nez p1, :cond_a

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->eventInfo:Ljava/lang/String;

    .line 50
    .line 51
    return-object p0

    .line 52
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/UssTags;->profileShowFollowButton:Z

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/UssTags;->onlyShowAboutMeInside:Z

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/UssTags;->showAboutMeOnCard:Z

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UssTags;->eventInfo:Ljava/lang/String;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UssTags;->debugInfo:Ljava/lang/String;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UssTags;->subTitle:Ljava/lang/String;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UssTags;->title:Ljava/lang/String;

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/UssTags;->repeatedUser:Z

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UssTags;->avatarIdentifier:Ljava/lang/String;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UssTags;->cardStyle:Ljava/lang/String;

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/UssTags;->newUser:Z

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    iput v0, p0, Lcom/p1/mobile/putong/data/UssTags;->selected:I

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    iput v0, p0, Lcom/p1/mobile/putong/data/UssTags;->onlineStatus:I

    .line 142
    .line 143
    goto/16 :goto_0

    .line 144
    .line 145
    :sswitch_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UssTags;->cardStyle:Ljava/lang/String;

    .line 146
    .line 147
    if-nez p1, :cond_5

    .line 148
    .line 149
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->cardStyle:Ljava/lang/String;

    .line 150
    .line 151
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UssTags;->avatarIdentifier:Ljava/lang/String;

    .line 152
    .line 153
    if-nez p1, :cond_6

    .line 154
    .line 155
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->avatarIdentifier:Ljava/lang/String;

    .line 156
    .line 157
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UssTags;->title:Ljava/lang/String;

    .line 158
    .line 159
    if-nez p1, :cond_7

    .line 160
    .line 161
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->title:Ljava/lang/String;

    .line 162
    .line 163
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UssTags;->subTitle:Ljava/lang/String;

    .line 164
    .line 165
    if-nez p1, :cond_8

    .line 166
    .line 167
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->subTitle:Ljava/lang/String;

    .line 168
    .line 169
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UssTags;->debugInfo:Ljava/lang/String;

    .line 170
    .line 171
    if-nez p1, :cond_9

    .line 172
    .line 173
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->debugInfo:Ljava/lang/String;

    .line 174
    .line 175
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UssTags;->eventInfo:Ljava/lang/String;

    .line 176
    .line 177
    if-nez p1, :cond_a

    .line 178
    .line 179
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->eventInfo:Ljava/lang/String;

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
        0x8 -> :sswitch_c
        0x10 -> :sswitch_b
        0x18 -> :sswitch_a
        0x22 -> :sswitch_9
        0x2a -> :sswitch_8
        0x30 -> :sswitch_7
        0x3a -> :sswitch_6
        0x42 -> :sswitch_5
        0x4a -> :sswitch_4
        0x52 -> :sswitch_3
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

    .line 183
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/UssTags$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/UssTags;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/UssTags;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/data/UssTags;->onlineStatus:I

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget v0, p1, Lcom/p1/mobile/putong/data/UssTags;->selected:I

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/UssTags;->newUser:Z

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UssTags;->cardStyle:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UssTags;->avatarIdentifier:Ljava/lang/String;

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
    const/4 p0, 0x6

    .line 36
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/UssTags;->repeatedUser:Z

    .line 37
    .line 38
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UssTags;->title:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UssTags;->subTitle:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UssTags;->debugInfo:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UssTags;->eventInfo:Ljava/lang/String;

    .line 68
    .line 69
    if-eqz p0, :cond_5

    .line 70
    .line 71
    const/16 v0, 0xa

    .line 72
    .line 73
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 74
    .line 75
    .line 76
    :cond_5
    const/16 p0, 0xb

    .line 77
    .line 78
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/UssTags;->showAboutMeOnCard:Z

    .line 79
    .line 80
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 81
    .line 82
    .line 83
    const/16 p0, 0xc

    .line 84
    .line 85
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/UssTags;->onlyShowAboutMeInside:Z

    .line 86
    .line 87
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 88
    .line 89
    .line 90
    const/16 p0, 0xd

    .line 91
    .line 92
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/UssTags;->profileShowFollowButton:Z

    .line 93
    .line 94
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

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
    check-cast p1, Lcom/p1/mobile/putong/data/UssTags;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/UssTags$1;->serialize(Lcom/p1/mobile/putong/data/UssTags;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
