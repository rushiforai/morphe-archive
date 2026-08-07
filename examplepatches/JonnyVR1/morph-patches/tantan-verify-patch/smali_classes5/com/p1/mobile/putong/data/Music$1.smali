.class Lcom/p1/mobile/putong/data/Music$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Music;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/Music;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/Music;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Music;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Music;->name:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Music;->describe:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Music;->owner:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    const/16 v1, 0x36

    .line 40
    .line 41
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Music;->type:Ljava/lang/String;

    .line 47
    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    const/16 v1, 0x37

    .line 51
    .line 52
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    add-int/2addr p0, v0

    .line 57
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Music;->cover:Ljava/lang/String;

    .line 58
    .line 59
    if-eqz v0, :cond_5

    .line 60
    .line 61
    const/16 v1, 0x38

    .line 62
    .line 63
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Music;->status:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz v0, :cond_6

    .line 71
    .line 72
    const/16 v1, 0x39

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
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Music;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 80
    .line 81
    if-eqz v0, :cond_7

    .line 82
    .line 83
    const/16 v1, 0x3a

    .line 84
    .line 85
    sget-object v2, Lcom/p1/mobile/putong/data/AudioMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 86
    .line 87
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    add-int/2addr p0, v0

    .line 92
    :cond_7
    const/16 v0, 0x3b

    .line 93
    .line 94
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/Music;->favor:Z

    .line 95
    .line 96
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    add-int/2addr p0, v0

    .line 101
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Music;->source:Ljava/lang/String;

    .line 102
    .line 103
    if-eqz v0, :cond_8

    .line 104
    .line 105
    const/16 v1, 0x3c

    .line 106
    .line 107
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    add-int/2addr p0, v0

    .line 112
    :cond_8
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 113
    .line 114
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 115
    check-cast p1, Lcom/p1/mobile/putong/data/Music;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Music$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/Music;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Music;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Music;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Music;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Music;->id:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Music;->id:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Music;->name:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Music;->name:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Music;->describe:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Music;->describe:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Music;->owner:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Music;->owner:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Music;->type:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Music;->type:Ljava/lang/String;

    .line 44
    .line 45
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Music;->cover:Ljava/lang/String;

    .line 46
    .line 47
    if-nez p1, :cond_5

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Music;->cover:Ljava/lang/String;

    .line 50
    .line 51
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Music;->status:Ljava/lang/String;

    .line 52
    .line 53
    if-nez p1, :cond_6

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Music;->status:Ljava/lang/String;

    .line 56
    .line 57
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Music;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 58
    .line 59
    if-nez p1, :cond_7

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/data/AudioMedia;->new_()Lcom/p1/mobile/putong/data/AudioMedia;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Music;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 66
    .line 67
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Music;->source:Ljava/lang/String;

    .line 68
    .line 69
    if-nez p1, :cond_10

    .line 70
    .line 71
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Music;->source:Ljava/lang/String;

    .line 72
    .line 73
    return-object p0

    .line 74
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Music;->source:Ljava/lang/String;

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/Music;->favor:Z

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/data/AudioMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    .line 90
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    check-cast v0, Lcom/p1/mobile/putong/data/AudioMedia;

    .line 95
    .line 96
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Music;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Music;->status:Ljava/lang/String;

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Music;->cover:Ljava/lang/String;

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Music;->type:Ljava/lang/String;

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Music;->owner:Ljava/lang/String;

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Music;->describe:Ljava/lang/String;

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Music;->name:Ljava/lang/String;

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Music;->id:Ljava/lang/String;

    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :sswitch_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Music;->id:Ljava/lang/String;

    .line 151
    .line 152
    if-nez p1, :cond_8

    .line 153
    .line 154
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Music;->id:Ljava/lang/String;

    .line 155
    .line 156
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Music;->name:Ljava/lang/String;

    .line 157
    .line 158
    if-nez p1, :cond_9

    .line 159
    .line 160
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Music;->name:Ljava/lang/String;

    .line 161
    .line 162
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Music;->describe:Ljava/lang/String;

    .line 163
    .line 164
    if-nez p1, :cond_a

    .line 165
    .line 166
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Music;->describe:Ljava/lang/String;

    .line 167
    .line 168
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Music;->owner:Ljava/lang/String;

    .line 169
    .line 170
    if-nez p1, :cond_b

    .line 171
    .line 172
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Music;->owner:Ljava/lang/String;

    .line 173
    .line 174
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Music;->type:Ljava/lang/String;

    .line 175
    .line 176
    if-nez p1, :cond_c

    .line 177
    .line 178
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Music;->type:Ljava/lang/String;

    .line 179
    .line 180
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Music;->cover:Ljava/lang/String;

    .line 181
    .line 182
    if-nez p1, :cond_d

    .line 183
    .line 184
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Music;->cover:Ljava/lang/String;

    .line 185
    .line 186
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Music;->status:Ljava/lang/String;

    .line 187
    .line 188
    if-nez p1, :cond_e

    .line 189
    .line 190
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Music;->status:Ljava/lang/String;

    .line 191
    .line 192
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Music;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 193
    .line 194
    if-nez p1, :cond_f

    .line 195
    .line 196
    invoke-static {}, Lcom/p1/mobile/putong/data/AudioMedia;->new_()Lcom/p1/mobile/putong/data/AudioMedia;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Music;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 201
    .line 202
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Music;->source:Ljava/lang/String;

    .line 203
    .line 204
    if-nez p1, :cond_10

    .line 205
    .line 206
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Music;->source:Ljava/lang/String;

    .line 207
    .line 208
    :cond_10
    return-object p0

    .line 209
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_a
        0x19a -> :sswitch_9
        0x1a2 -> :sswitch_8
        0x1aa -> :sswitch_7
        0x1b2 -> :sswitch_6
        0x1ba -> :sswitch_5
        0x1c2 -> :sswitch_4
        0x1ca -> :sswitch_3
        0x1d2 -> :sswitch_2
        0x1d8 -> :sswitch_1
        0x1e2 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 209
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Music$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Music;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/Music;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Music;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Music;->name:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Music;->describe:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Music;->owner:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz p0, :cond_3

    .line 31
    .line 32
    const/16 v0, 0x36

    .line 33
    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Music;->type:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    const/16 v0, 0x37

    .line 42
    .line 43
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Music;->cover:Ljava/lang/String;

    .line 47
    .line 48
    if-eqz p0, :cond_5

    .line 49
    .line 50
    const/16 v0, 0x38

    .line 51
    .line 52
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Music;->status:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz p0, :cond_6

    .line 58
    .line 59
    const/16 v0, 0x39

    .line 60
    .line 61
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Music;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 65
    .line 66
    if-eqz p0, :cond_7

    .line 67
    .line 68
    const/16 v0, 0x3a

    .line 69
    .line 70
    sget-object v1, Lcom/p1/mobile/putong/data/AudioMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 71
    .line 72
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 73
    .line 74
    .line 75
    :cond_7
    const/16 p0, 0x3b

    .line 76
    .line 77
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/Music;->favor:Z

    .line 78
    .line 79
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Music;->source:Ljava/lang/String;

    .line 83
    .line 84
    if-eqz p0, :cond_8

    .line 85
    .line 86
    const/16 p1, 0x3c

    .line 87
    .line 88
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_8
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 92
    check-cast p1, Lcom/p1/mobile/putong/data/Music;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Music$1;->serialize(Lcom/p1/mobile/putong/data/Music;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
