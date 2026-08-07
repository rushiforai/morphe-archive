.class Lcom/p1/mobile/putong/data/MediaMeta$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/MediaMeta;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/MediaMeta;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/MediaMeta;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/MediaMeta;->type:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x33

    .line 6
    .line 7
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MediaMeta;->source:Ljava/lang/String;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    const/16 v1, 0x34

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MediaMeta;->musicReference:Ljava/lang/String;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const/16 v1, 0x35

    .line 29
    .line 30
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    add-int/2addr p0, v0

    .line 35
    :cond_2
    const/16 v0, 0x36

    .line 36
    .line 37
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/MediaMeta;->hasAudio:Z

    .line 38
    .line 39
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MediaMeta;->musicId:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    const/16 v1, 0x37

    .line 49
    .line 50
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    add-int/2addr p0, v0

    .line 55
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MediaMeta;->proportion:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz v0, :cond_4

    .line 58
    .line 59
    const/16 v1, 0x38

    .line 60
    .line 61
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MediaMeta;->camera:Ljava/lang/String;

    .line 67
    .line 68
    if-eqz v0, :cond_5

    .line 69
    .line 70
    const/16 v1, 0x39

    .line 71
    .line 72
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    add-int/2addr p0, v0

    .line 77
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MediaMeta;->sticker:Ljava/lang/String;

    .line 78
    .line 79
    if-eqz v0, :cond_6

    .line 80
    .line 81
    const/16 v1, 0x3a

    .line 82
    .line 83
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    add-int/2addr p0, v0

    .line 88
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MediaMeta;->filter:Ljava/lang/String;

    .line 89
    .line 90
    if-eqz v0, :cond_7

    .line 91
    .line 92
    const/16 v1, 0x3b

    .line 93
    .line 94
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    add-int/2addr p0, v0

    .line 99
    :cond_7
    const/16 v0, 0x3c

    .line 100
    .line 101
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/MediaMeta;->isSameMusic:Z

    .line 102
    .line 103
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    add-int/2addr p0, v0

    .line 108
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 109
    .line 110
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 111
    check-cast p1, Lcom/p1/mobile/putong/data/MediaMeta;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/MediaMeta$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/MediaMeta;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/MediaMeta;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/MediaMeta;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/MediaMeta;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->type:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->type:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->source:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->source:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->musicReference:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->musicReference:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->musicId:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->musicId:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->proportion:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->proportion:Ljava/lang/String;

    .line 44
    .line 45
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->camera:Ljava/lang/String;

    .line 46
    .line 47
    if-nez p1, :cond_5

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->camera:Ljava/lang/String;

    .line 50
    .line 51
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->sticker:Ljava/lang/String;

    .line 52
    .line 53
    if-nez p1, :cond_6

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->sticker:Ljava/lang/String;

    .line 56
    .line 57
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->filter:Ljava/lang/String;

    .line 58
    .line 59
    if-nez p1, :cond_e

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->filter:Ljava/lang/String;

    .line 62
    .line 63
    return-object p0

    .line 64
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/MediaMeta;->isSameMusic:Z

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iput-object v0, p0, Lcom/p1/mobile/putong/data/MediaMeta;->filter:Ljava/lang/String;

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/data/MediaMeta;->sticker:Ljava/lang/String;

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iput-object v0, p0, Lcom/p1/mobile/putong/data/MediaMeta;->camera:Ljava/lang/String;

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iput-object v0, p0, Lcom/p1/mobile/putong/data/MediaMeta;->proportion:Ljava/lang/String;

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iput-object v0, p0, Lcom/p1/mobile/putong/data/MediaMeta;->musicId:Ljava/lang/String;

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/MediaMeta;->hasAudio:Z

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iput-object v0, p0, Lcom/p1/mobile/putong/data/MediaMeta;->musicReference:Ljava/lang/String;

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    iput-object v0, p0, Lcom/p1/mobile/putong/data/MediaMeta;->source:Ljava/lang/String;

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    iput-object v0, p0, Lcom/p1/mobile/putong/data/MediaMeta;->type:Ljava/lang/String;

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :sswitch_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->type:Ljava/lang/String;

    .line 135
    .line 136
    if-nez p1, :cond_7

    .line 137
    .line 138
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->type:Ljava/lang/String;

    .line 139
    .line 140
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->source:Ljava/lang/String;

    .line 141
    .line 142
    if-nez p1, :cond_8

    .line 143
    .line 144
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->source:Ljava/lang/String;

    .line 145
    .line 146
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->musicReference:Ljava/lang/String;

    .line 147
    .line 148
    if-nez p1, :cond_9

    .line 149
    .line 150
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->musicReference:Ljava/lang/String;

    .line 151
    .line 152
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->musicId:Ljava/lang/String;

    .line 153
    .line 154
    if-nez p1, :cond_a

    .line 155
    .line 156
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->musicId:Ljava/lang/String;

    .line 157
    .line 158
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->proportion:Ljava/lang/String;

    .line 159
    .line 160
    if-nez p1, :cond_b

    .line 161
    .line 162
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->proportion:Ljava/lang/String;

    .line 163
    .line 164
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->camera:Ljava/lang/String;

    .line 165
    .line 166
    if-nez p1, :cond_c

    .line 167
    .line 168
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->camera:Ljava/lang/String;

    .line 169
    .line 170
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->sticker:Ljava/lang/String;

    .line 171
    .line 172
    if-nez p1, :cond_d

    .line 173
    .line 174
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->sticker:Ljava/lang/String;

    .line 175
    .line 176
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->filter:Ljava/lang/String;

    .line 177
    .line 178
    if-nez p1, :cond_e

    .line 179
    .line 180
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->filter:Ljava/lang/String;

    .line 181
    .line 182
    :cond_e
    return-object p0

    .line 183
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_a
        0x19a -> :sswitch_9
        0x1a2 -> :sswitch_8
        0x1aa -> :sswitch_7
        0x1b0 -> :sswitch_6
        0x1ba -> :sswitch_5
        0x1c2 -> :sswitch_4
        0x1ca -> :sswitch_3
        0x1d2 -> :sswitch_2
        0x1da -> :sswitch_1
        0x1e0 -> :sswitch_0
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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/MediaMeta$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/MediaMeta;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/MediaMeta;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/MediaMeta;->type:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x33

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/MediaMeta;->source:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const/16 v0, 0x34

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/MediaMeta;->musicReference:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/16 v0, 0x35

    .line 24
    .line 25
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    const/16 p0, 0x36

    .line 29
    .line 30
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/MediaMeta;->hasAudio:Z

    .line 31
    .line 32
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p1, Lcom/p1/mobile/putong/data/MediaMeta;->musicId:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    const/16 v0, 0x37

    .line 40
    .line 41
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/MediaMeta;->proportion:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz p0, :cond_4

    .line 47
    .line 48
    const/16 v0, 0x38

    .line 49
    .line 50
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/MediaMeta;->camera:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz p0, :cond_5

    .line 56
    .line 57
    const/16 v0, 0x39

    .line 58
    .line 59
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/MediaMeta;->sticker:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz p0, :cond_6

    .line 65
    .line 66
    const/16 v0, 0x3a

    .line 67
    .line 68
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/MediaMeta;->filter:Ljava/lang/String;

    .line 72
    .line 73
    if-eqz p0, :cond_7

    .line 74
    .line 75
    const/16 v0, 0x3b

    .line 76
    .line 77
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 78
    .line 79
    .line 80
    :cond_7
    const/16 p0, 0x3c

    .line 81
    .line 82
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/MediaMeta;->isSameMusic:Z

    .line 83
    .line 84
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 88
    check-cast p1, Lcom/p1/mobile/putong/data/MediaMeta;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/MediaMeta$1;->serialize(Lcom/p1/mobile/putong/data/MediaMeta;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
