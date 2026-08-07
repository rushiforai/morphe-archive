.class Lcom/p1/mobile/putong/core/data/CoreGiftInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/CoreGiftInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/CoreGiftInfo;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/2addr p0, v0

    .line 18
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/16 v1, 0x33

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    add-int/2addr p0, v0

    .line 29
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->url:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    const/16 v1, 0x34

    .line 34
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
    const/16 v0, 0x35

    .line 41
    .line 42
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitCoinPrice:D

    .line 43
    .line 44
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    add-int/2addr p0, v0

    .line 49
    const/16 v0, 0x36

    .line 50
    .line 51
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitLikes:I

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
    const/16 v0, 0x37

    .line 59
    .line 60
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicGift:Z

    .line 61
    .line 62
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    add-int/2addr p0, v0

    .line 67
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicURL:Ljava/lang/String;

    .line 68
    .line 69
    if-eqz v0, :cond_3

    .line 70
    .line 71
    const/16 v1, 0x38

    .line 72
    .line 73
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    add-int/2addr p0, v0

    .line 78
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicMD5:Ljava/lang/String;

    .line 79
    .line 80
    if-eqz v0, :cond_4

    .line 81
    .line 82
    const/16 v1, 0x39

    .line 83
    .line 84
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    add-int/2addr p0, v0

    .line 89
    :cond_4
    const/16 v0, 0x3a

    .line 90
    .line 91
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->quota:I

    .line 92
    .line 93
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    add-int/2addr p0, v0

    .line 98
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 99
    .line 100
    if-eqz v0, :cond_5

    .line 101
    .line 102
    const/16 v1, 0x3b

    .line 103
    .line 104
    sget-object v2, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 105
    .line 106
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    add-int/2addr p0, v0

    .line 111
    :cond_5
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 112
    .line 113
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 114
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CoreGiftInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CoreGiftInfo;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->url:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->url:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicURL:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicURL:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicMD5:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicMD5:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->new_()Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 48
    .line 49
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->consumeType:Ljava/lang/String;

    .line 50
    .line 51
    if-nez p1, :cond_5

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->consumeType:Ljava/lang/String;

    .line 54
    .line 55
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->coinSign:Ljava/lang/String;

    .line 56
    .line 57
    if-nez p1, :cond_c

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->coinSign:Ljava/lang/String;

    .line 60
    .line 61
    return-object p0

    .line 62
    :sswitch_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 69
    .line 70
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->quota:I

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicMD5:Ljava/lang/String;

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicURL:Ljava/lang/String;

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicGift:Z

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitLikes:I

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 109
    .line 110
    .line 111
    move-result-wide v0

    .line 112
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitCoinPrice:D

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->url:Ljava/lang/String;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

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
    iput-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 138
    .line 139
    .line 140
    move-result-wide v0

    .line 141
    iput-wide v0, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 142
    .line 143
    goto/16 :goto_0

    .line 144
    .line 145
    :sswitch_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

    .line 146
    .line 147
    if-nez p1, :cond_6

    .line 148
    .line 149
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

    .line 150
    .line 151
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->url:Ljava/lang/String;

    .line 152
    .line 153
    if-nez p1, :cond_7

    .line 154
    .line 155
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->url:Ljava/lang/String;

    .line 156
    .line 157
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicURL:Ljava/lang/String;

    .line 158
    .line 159
    if-nez p1, :cond_8

    .line 160
    .line 161
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicURL:Ljava/lang/String;

    .line 162
    .line 163
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicMD5:Ljava/lang/String;

    .line 164
    .line 165
    if-nez p1, :cond_9

    .line 166
    .line 167
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicMD5:Ljava/lang/String;

    .line 168
    .line 169
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 170
    .line 171
    if-nez p1, :cond_a

    .line 172
    .line 173
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->new_()Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 178
    .line 179
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->consumeType:Ljava/lang/String;

    .line 180
    .line 181
    if-nez p1, :cond_b

    .line 182
    .line 183
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->consumeType:Ljava/lang/String;

    .line 184
    .line 185
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->coinSign:Ljava/lang/String;

    .line 186
    .line 187
    if-nez p1, :cond_c

    .line 188
    .line 189
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->coinSign:Ljava/lang/String;

    .line 190
    .line 191
    :cond_c
    return-object p0

    .line 192
    nop

    .line 193
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_b
        0x8 -> :sswitch_a
        0x12 -> :sswitch_9
        0x19a -> :sswitch_8
        0x1a2 -> :sswitch_7
        0x1a9 -> :sswitch_6
        0x1b0 -> :sswitch_5
        0x1b8 -> :sswitch_4
        0x1c2 -> :sswitch_3
        0x1ca -> :sswitch_2
        0x1d0 -> :sswitch_1
        0x1da -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 193
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CoreGiftInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/16 v0, 0x33

    .line 20
    .line 21
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->url:Ljava/lang/String;

    .line 25
    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    const/16 v0, 0x34

    .line 29
    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_2
    const/16 p0, 0x35

    .line 34
    .line 35
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitCoinPrice:D

    .line 36
    .line 37
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 38
    .line 39
    .line 40
    const/16 p0, 0x36

    .line 41
    .line 42
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitLikes:I

    .line 43
    .line 44
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 45
    .line 46
    .line 47
    const/16 p0, 0x37

    .line 48
    .line 49
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicGift:Z

    .line 50
    .line 51
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicURL:Ljava/lang/String;

    .line 55
    .line 56
    if-eqz p0, :cond_3

    .line 57
    .line 58
    const/16 v0, 0x38

    .line 59
    .line 60
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicMD5:Ljava/lang/String;

    .line 64
    .line 65
    if-eqz p0, :cond_4

    .line 66
    .line 67
    const/16 v0, 0x39

    .line 68
    .line 69
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 70
    .line 71
    .line 72
    :cond_4
    const/16 p0, 0x3a

    .line 73
    .line 74
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->quota:I

    .line 75
    .line 76
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 80
    .line 81
    if-eqz p0, :cond_5

    .line 82
    .line 83
    const/16 p1, 0x3b

    .line 84
    .line 85
    sget-object v0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 86
    .line 87
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 88
    .line 89
    .line 90
    :cond_5
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 91
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/CoreGiftInfo$1;->serialize(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
