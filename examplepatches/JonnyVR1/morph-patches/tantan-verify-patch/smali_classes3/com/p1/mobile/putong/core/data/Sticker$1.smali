.class Lcom/p1/mobile/putong/core/data/Sticker$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Sticker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/Sticker;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Sticker;)I
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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->package_:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    sget-object v1, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const/16 v2, 0x35

    .line 51
    .line 52
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    add-int/2addr p0, v0

    .line 57
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 58
    .line 59
    if-eqz v0, :cond_4

    .line 60
    .line 61
    const/16 v1, 0x36

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    :cond_4
    const/16 v0, 0x37

    .line 73
    .line 74
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Sticker;->seq:J

    .line 75
    .line 76
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    add-int/2addr p0, v0

    .line 81
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->hash:Ljava/lang/String;

    .line 82
    .line 83
    if-eqz v0, :cond_5

    .line 84
    .line 85
    const/16 v1, 0x38

    .line 86
    .line 87
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    add-int/2addr p0, v0

    .line 92
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->status:Ljava/lang/String;

    .line 93
    .line 94
    if-eqz v0, :cond_6

    .line 95
    .line 96
    const/16 v1, 0x39

    .line 97
    .line 98
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    add-int/2addr p0, v0

    .line 103
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 104
    .line 105
    if-eqz v0, :cond_7

    .line 106
    .line 107
    const/16 v1, 0x3a

    .line 108
    .line 109
    sget-object v2, Lcom/p1/mobile/putong/core/data/StickerSource;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 110
    .line 111
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    add-int/2addr p0, v0

    .line 116
    :cond_7
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 117
    .line 118
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 119
    check-cast p1, Lcom/p1/mobile/putong/core/data/Sticker;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Sticker$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Sticker;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Sticker;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/Sticker;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/Sticker;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const-string v3, ""

    .line 13
    .line 14
    sparse-switch v2, :sswitch_data_0

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/core/data/StickerSource;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Sticker;->package_:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/Sticker;->package_:Ljava/lang/String;

    .line 42
    .line 43
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 44
    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 48
    .line 49
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 50
    .line 51
    if-nez p1, :cond_3

    .line 52
    .line 53
    new-instance p1, Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 59
    .line 60
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Sticker;->hash:Ljava/lang/String;

    .line 61
    .line 62
    if-nez p1, :cond_8

    .line 63
    .line 64
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/Sticker;->hash:Ljava/lang/String;

    .line 65
    .line 66
    return-object p0

    .line 67
    :sswitch_0
    sget-object v2, Lcom/p1/mobile/putong/core/data/StickerSource;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 68
    .line 69
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    check-cast v2, Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 74
    .line 75
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/Sticker;->status:Ljava/lang/String;

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/Sticker;->hash:Ljava/lang/String;

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 93
    .line 94
    .line 95
    move-result-wide v2

    .line 96
    iput-wide v2, p0, Lcom/p1/mobile/putong/core/data/Sticker;->seq:J

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    goto :goto_0

    .line 108
    :sswitch_5
    sget-object v2, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 109
    .line 110
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    check-cast v2, Ljava/util/List;

    .line 119
    .line 120
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/Sticker;->package_:Ljava/lang/String;

    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    iput-object v2, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 143
    .line 144
    goto/16 :goto_0

    .line 145
    .line 146
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 147
    .line 148
    .line 149
    move-result-wide v2

    .line 150
    iput-wide v2, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 151
    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :sswitch_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 155
    .line 156
    if-nez p1, :cond_4

    .line 157
    .line 158
    if-eqz v1, :cond_4

    .line 159
    .line 160
    sget-object p1, Lcom/p1/mobile/putong/core/data/StickerSource;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 161
    .line 162
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    check-cast p1, Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 171
    .line 172
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 173
    .line 174
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Sticker;->package_:Ljava/lang/String;

    .line 175
    .line 176
    if-nez p1, :cond_5

    .line 177
    .line 178
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/Sticker;->package_:Ljava/lang/String;

    .line 179
    .line 180
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 181
    .line 182
    if-nez p1, :cond_6

    .line 183
    .line 184
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 185
    .line 186
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 187
    .line 188
    if-nez p1, :cond_7

    .line 189
    .line 190
    new-instance p1, Ljava/util/ArrayList;

    .line 191
    .line 192
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 193
    .line 194
    .line 195
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 196
    .line 197
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Sticker;->hash:Ljava/lang/String;

    .line 198
    .line 199
    if-nez p1, :cond_8

    .line 200
    .line 201
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/Sticker;->hash:Ljava/lang/String;

    .line 202
    .line 203
    :cond_8
    return-object p0

    .line 204
    nop

    .line 205
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_a
        0x8 -> :sswitch_9
        0x12 -> :sswitch_8
        0x19a -> :sswitch_7
        0x1a2 -> :sswitch_6
        0x1aa -> :sswitch_5
        0x1b0 -> :sswitch_4
        0x1b8 -> :sswitch_3
        0x1c2 -> :sswitch_2
        0x1ca -> :sswitch_1
        0x1d2 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 205
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Sticker$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Sticker;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/Sticker;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->package_:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 34
    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const/16 v1, 0x35

    .line 44
    .line 45
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 46
    .line 47
    .line 48
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 49
    .line 50
    if-eqz p0, :cond_4

    .line 51
    .line 52
    const/16 v0, 0x36

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 59
    .line 60
    .line 61
    :cond_4
    const/16 p0, 0x37

    .line 62
    .line 63
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->seq:J

    .line 64
    .line 65
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->hash:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz p0, :cond_5

    .line 71
    .line 72
    const/16 v0, 0x38

    .line 73
    .line 74
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->status:Ljava/lang/String;

    .line 78
    .line 79
    if-eqz p0, :cond_6

    .line 80
    .line 81
    const/16 v0, 0x39

    .line 82
    .line 83
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 84
    .line 85
    .line 86
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 87
    .line 88
    if-eqz p0, :cond_7

    .line 89
    .line 90
    const/16 p1, 0x3a

    .line 91
    .line 92
    sget-object v0, Lcom/p1/mobile/putong/core/data/StickerSource;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 93
    .line 94
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 95
    .line 96
    .line 97
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

    .line 98
    check-cast p1, Lcom/p1/mobile/putong/core/data/Sticker;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Sticker$1;->serialize(Lcom/p1/mobile/putong/core/data/Sticker;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
