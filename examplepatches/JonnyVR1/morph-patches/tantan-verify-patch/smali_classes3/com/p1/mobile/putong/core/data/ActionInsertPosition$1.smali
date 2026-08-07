.class Lcom/p1/mobile/putong/core/data/ActionInsertPosition$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ActionInsertPosition;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/ActionInsertPosition;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ActionInsertPosition;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->userId:Ljava/lang/String;

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
    iget v1, p1, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->position:I

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/2addr p0, v0

    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->cardExtraInfo:Lcom/p1/mobile/putong/core/data/CardExtraInfo;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    sget-object v2, Lcom/p1/mobile/putong/core/data/CardExtraInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 26
    .line 27
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->cardStyle:Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    sget-object v2, Lcom/p1/mobile/putong/core/data/CardStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 38
    .line 39
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->likedMe:Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x5

    .line 49
    sget-object v2, Lcom/p1/mobile/putong/core/data/CardStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 50
    .line 51
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->cityCData:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 57
    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    const/4 v1, 0x6

    .line 61
    sget-object v2, Lcom/p1/mobile/putong/core/data/CityCData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 62
    .line 63
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    :cond_4
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 69
    .line 70
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 71
    check-cast p1, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ActionInsertPosition$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ActionInsertPosition;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ActionInsertPosition;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;-><init>()V

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
    if-eqz v0, :cond_a

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_9

    .line 17
    .line 18
    const/16 v2, 0x10

    .line 19
    .line 20
    if-eq v0, v2, :cond_8

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_7

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_6

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_5

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_4

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->userId:Ljava/lang/String;

    .line 39
    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->userId:Ljava/lang/String;

    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->cardExtraInfo:Lcom/p1/mobile/putong/core/data/CardExtraInfo;

    .line 45
    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CardExtraInfo;->new_()Lcom/p1/mobile/putong/core/data/CardExtraInfo;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->cardExtraInfo:Lcom/p1/mobile/putong/core/data/CardExtraInfo;

    .line 53
    .line 54
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->cardStyle:Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 55
    .line 56
    if-nez p1, :cond_2

    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CardStyle;->new_()Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->cardStyle:Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 63
    .line 64
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->likedMe:Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 65
    .line 66
    if-nez p1, :cond_3

    .line 67
    .line 68
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CardStyle;->new_()Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->likedMe:Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 73
    .line 74
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->cityCData:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 75
    .line 76
    if-nez p1, :cond_f

    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CityCData;->new_()Lcom/p1/mobile/putong/core/data/CityCData;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->cityCData:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 83
    .line 84
    return-object p0

    .line 85
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/data/CityCData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    check-cast v0, Lcom/p1/mobile/putong/core/data/CityCData;

    .line 92
    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->cityCData:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 97
    .line 98
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    check-cast v0, Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 103
    .line 104
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->likedMe:Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 108
    .line 109
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    check-cast v0, Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 114
    .line 115
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->cardStyle:Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardExtraInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 119
    .line 120
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Lcom/p1/mobile/putong/core/data/CardExtraInfo;

    .line 125
    .line 126
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->cardExtraInfo:Lcom/p1/mobile/putong/core/data/CardExtraInfo;

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    iput v0, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->position:I

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->userId:Ljava/lang/String;

    .line 142
    .line 143
    goto/16 :goto_0

    .line 144
    .line 145
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->userId:Ljava/lang/String;

    .line 146
    .line 147
    if-nez p1, :cond_b

    .line 148
    .line 149
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->userId:Ljava/lang/String;

    .line 150
    .line 151
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->cardExtraInfo:Lcom/p1/mobile/putong/core/data/CardExtraInfo;

    .line 152
    .line 153
    if-nez p1, :cond_c

    .line 154
    .line 155
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CardExtraInfo;->new_()Lcom/p1/mobile/putong/core/data/CardExtraInfo;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->cardExtraInfo:Lcom/p1/mobile/putong/core/data/CardExtraInfo;

    .line 160
    .line 161
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->cardStyle:Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 162
    .line 163
    if-nez p1, :cond_d

    .line 164
    .line 165
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CardStyle;->new_()Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->cardStyle:Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 170
    .line 171
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->likedMe:Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 172
    .line 173
    if-nez p1, :cond_e

    .line 174
    .line 175
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CardStyle;->new_()Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->likedMe:Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 180
    .line 181
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->cityCData:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 182
    .line 183
    if-nez p1, :cond_f

    .line 184
    .line 185
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CityCData;->new_()Lcom/p1/mobile/putong/core/data/CityCData;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->cityCData:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 190
    .line 191
    :cond_f
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 192
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ActionInsertPosition$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ActionInsertPosition;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/ActionInsertPosition;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->userId:Ljava/lang/String;

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
    iget v0, p1, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->position:I

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->cardExtraInfo:Lcom/p1/mobile/putong/core/data/CardExtraInfo;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardExtraInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 21
    .line 22
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->cardStyle:Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->likedMe:Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    const/4 v0, 0x5

    .line 40
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 41
    .line 42
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 43
    .line 44
    .line 45
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;->cityCData:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const/4 p1, 0x6

    .line 50
    sget-object v0, Lcom/p1/mobile/putong/core/data/CityCData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 51
    .line 52
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 53
    .line 54
    .line 55
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

    .line 56
    check-cast p1, Lcom/p1/mobile/putong/core/data/ActionInsertPosition;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ActionInsertPosition$1;->serialize(Lcom/p1/mobile/putong/core/data/ActionInsertPosition;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
