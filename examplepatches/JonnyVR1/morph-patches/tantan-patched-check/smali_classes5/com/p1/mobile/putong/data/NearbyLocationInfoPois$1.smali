.class Lcom/p1/mobile/putong/data/NearbyLocationInfoPois$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->name:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->address:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->country:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->city:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->province:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->area:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v0, :cond_5

    .line 55
    .line 56
    const/4 v1, 0x6

    .line 57
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_5
    const/4 v0, 0x7

    .line 63
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->lng:D

    .line 64
    .line 65
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    const/16 v0, 0x8

    .line 71
    .line 72
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->lat:D

    .line 73
    .line 74
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    add-int/2addr p0, v0

    .line 79
    const/16 v0, 0x9

    .line 80
    .line 81
    iget v1, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->distance:I

    .line 82
    .line 83
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    add-int/2addr p0, v0

    .line 88
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->direction:Ljava/lang/String;

    .line 89
    .line 90
    if-eqz v0, :cond_6

    .line 91
    .line 92
    const/16 v1, 0xa

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
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->tag:Ljava/lang/String;

    .line 100
    .line 101
    if-eqz v0, :cond_7

    .line 102
    .line 103
    const/16 v1, 0xb

    .line 104
    .line 105
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    add-int/2addr p0, v0

    .line 110
    :cond_7
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 111
    .line 112
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 113
    check-cast p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->name:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->name:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->address:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->address:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->country:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->country:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->city:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->city:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->province:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->province:Ljava/lang/String;

    .line 44
    .line 45
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->area:Ljava/lang/String;

    .line 46
    .line 47
    if-nez p1, :cond_5

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->area:Ljava/lang/String;

    .line 50
    .line 51
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->direction:Ljava/lang/String;

    .line 52
    .line 53
    if-nez p1, :cond_6

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->direction:Ljava/lang/String;

    .line 56
    .line 57
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->tag:Ljava/lang/String;

    .line 58
    .line 59
    if-nez p1, :cond_e

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->tag:Ljava/lang/String;

    .line 62
    .line 63
    return-object p0

    .line 64
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->tag:Ljava/lang/String;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->direction:Ljava/lang/String;

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    iput v0, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->distance:I

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 86
    .line 87
    .line 88
    move-result-wide v0

    .line 89
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->lat:D

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 93
    .line 94
    .line 95
    move-result-wide v0

    .line 96
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->lng:D

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->area:Ljava/lang/String;

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->province:Ljava/lang/String;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->city:Ljava/lang/String;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->country:Ljava/lang/String;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->address:Ljava/lang/String;

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->name:Ljava/lang/String;

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->name:Ljava/lang/String;

    .line 143
    .line 144
    if-nez p1, :cond_7

    .line 145
    .line 146
    iput-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->name:Ljava/lang/String;

    .line 147
    .line 148
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->address:Ljava/lang/String;

    .line 149
    .line 150
    if-nez p1, :cond_8

    .line 151
    .line 152
    iput-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->address:Ljava/lang/String;

    .line 153
    .line 154
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->country:Ljava/lang/String;

    .line 155
    .line 156
    if-nez p1, :cond_9

    .line 157
    .line 158
    iput-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->country:Ljava/lang/String;

    .line 159
    .line 160
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->city:Ljava/lang/String;

    .line 161
    .line 162
    if-nez p1, :cond_a

    .line 163
    .line 164
    iput-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->city:Ljava/lang/String;

    .line 165
    .line 166
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->province:Ljava/lang/String;

    .line 167
    .line 168
    if-nez p1, :cond_b

    .line 169
    .line 170
    iput-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->province:Ljava/lang/String;

    .line 171
    .line 172
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->area:Ljava/lang/String;

    .line 173
    .line 174
    if-nez p1, :cond_c

    .line 175
    .line 176
    iput-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->area:Ljava/lang/String;

    .line 177
    .line 178
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->direction:Ljava/lang/String;

    .line 179
    .line 180
    if-nez p1, :cond_d

    .line 181
    .line 182
    iput-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->direction:Ljava/lang/String;

    .line 183
    .line 184
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->tag:Ljava/lang/String;

    .line 185
    .line 186
    if-nez p1, :cond_e

    .line 187
    .line 188
    iput-object v1, p0, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->tag:Ljava/lang/String;

    .line 189
    .line 190
    :cond_e
    return-object p0

    .line 191
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_b
        0xa -> :sswitch_a
        0x12 -> :sswitch_9
        0x1a -> :sswitch_8
        0x22 -> :sswitch_7
        0x2a -> :sswitch_6
        0x32 -> :sswitch_5
        0x39 -> :sswitch_4
        0x41 -> :sswitch_3
        0x48 -> :sswitch_2
        0x52 -> :sswitch_1
        0x5a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 191
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->name:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->address:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->country:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->city:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->province:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->area:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz p0, :cond_5

    .line 44
    .line 45
    const/4 v0, 0x6

    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_5
    const/4 p0, 0x7

    .line 50
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->lng:D

    .line 51
    .line 52
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 53
    .line 54
    .line 55
    const/16 p0, 0x8

    .line 56
    .line 57
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->lat:D

    .line 58
    .line 59
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 60
    .line 61
    .line 62
    const/16 p0, 0x9

    .line 63
    .line 64
    iget v0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->distance:I

    .line 65
    .line 66
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->direction:Ljava/lang/String;

    .line 70
    .line 71
    if-eqz p0, :cond_6

    .line 72
    .line 73
    const/16 v0, 0xa

    .line 74
    .line 75
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;->tag:Ljava/lang/String;

    .line 79
    .line 80
    if-eqz p0, :cond_7

    .line 81
    .line 82
    const/16 p1, 0xb

    .line 83
    .line 84
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :cond_7
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
    check-cast p1, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/NearbyLocationInfoPois$1;->serialize(Lcom/p1/mobile/putong/data/NearbyLocationInfoPois;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
