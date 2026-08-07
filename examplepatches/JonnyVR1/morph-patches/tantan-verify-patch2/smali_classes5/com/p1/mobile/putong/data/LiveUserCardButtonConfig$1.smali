.class Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->userJumpUrl:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->anchorJumpUrl:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->pictureConfig:Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    sget-object v2, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 28
    .line 29
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->contentConfig:Lcom/p1/mobile/putong/data/LiveUserCardButtonContent;

    .line 35
    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    const/4 v1, 0x4

    .line 39
    sget-object v2, Lcom/p1/mobile/putong/data/LiveUserCardButtonContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 40
    .line 41
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->backgroundColorConfig:Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;

    .line 47
    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    const/4 v1, 0x5

    .line 51
    sget-object v2, Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 52
    .line 53
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->borderColorConfig:Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;

    .line 59
    .line 60
    if-eqz v0, :cond_5

    .line 61
    .line 62
    const/4 v1, 0x6

    .line 63
    sget-object v2, Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 64
    .line 65
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    :cond_5
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 71
    .line 72
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 73
    check-cast p1, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;-><init>()V

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
    if-eqz v0, :cond_b

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_a

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_9

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_8

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_7

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_6

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_5

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->userJumpUrl:Ljava/lang/String;

    .line 39
    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->userJumpUrl:Ljava/lang/String;

    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->anchorJumpUrl:Ljava/lang/String;

    .line 45
    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->anchorJumpUrl:Ljava/lang/String;

    .line 49
    .line 50
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->pictureConfig:Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;

    .line 51
    .line 52
    if-nez p1, :cond_2

    .line 53
    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->new_()Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->pictureConfig:Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;

    .line 59
    .line 60
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->contentConfig:Lcom/p1/mobile/putong/data/LiveUserCardButtonContent;

    .line 61
    .line 62
    if-nez p1, :cond_3

    .line 63
    .line 64
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveUserCardButtonContent;->new_()Lcom/p1/mobile/putong/data/LiveUserCardButtonContent;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->contentConfig:Lcom/p1/mobile/putong/data/LiveUserCardButtonContent;

    .line 69
    .line 70
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->backgroundColorConfig:Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;

    .line 71
    .line 72
    if-nez p1, :cond_4

    .line 73
    .line 74
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;->new_()Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->backgroundColorConfig:Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;

    .line 79
    .line 80
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->borderColorConfig:Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;

    .line 81
    .line 82
    if-nez p1, :cond_11

    .line 83
    .line 84
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;->new_()Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->borderColorConfig:Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;

    .line 89
    .line 90
    return-object p0

    .line 91
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 92
    .line 93
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;

    .line 98
    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->borderColorConfig:Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 103
    .line 104
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    check-cast v0, Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;

    .line 109
    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->backgroundColorConfig:Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/data/LiveUserCardButtonContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 114
    .line 115
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    check-cast v0, Lcom/p1/mobile/putong/data/LiveUserCardButtonContent;

    .line 120
    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->contentConfig:Lcom/p1/mobile/putong/data/LiveUserCardButtonContent;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 125
    .line 126
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    check-cast v0, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;

    .line 131
    .line 132
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->pictureConfig:Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;

    .line 133
    .line 134
    goto/16 :goto_0

    .line 135
    .line 136
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->anchorJumpUrl:Ljava/lang/String;

    .line 141
    .line 142
    goto/16 :goto_0

    .line 143
    .line 144
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->userJumpUrl:Ljava/lang/String;

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->userJumpUrl:Ljava/lang/String;

    .line 153
    .line 154
    if-nez p1, :cond_c

    .line 155
    .line 156
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->userJumpUrl:Ljava/lang/String;

    .line 157
    .line 158
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->anchorJumpUrl:Ljava/lang/String;

    .line 159
    .line 160
    if-nez p1, :cond_d

    .line 161
    .line 162
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->anchorJumpUrl:Ljava/lang/String;

    .line 163
    .line 164
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->pictureConfig:Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;

    .line 165
    .line 166
    if-nez p1, :cond_e

    .line 167
    .line 168
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->new_()Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->pictureConfig:Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;

    .line 173
    .line 174
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->contentConfig:Lcom/p1/mobile/putong/data/LiveUserCardButtonContent;

    .line 175
    .line 176
    if-nez p1, :cond_f

    .line 177
    .line 178
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveUserCardButtonContent;->new_()Lcom/p1/mobile/putong/data/LiveUserCardButtonContent;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->contentConfig:Lcom/p1/mobile/putong/data/LiveUserCardButtonContent;

    .line 183
    .line 184
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->backgroundColorConfig:Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;

    .line 185
    .line 186
    if-nez p1, :cond_10

    .line 187
    .line 188
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;->new_()Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->backgroundColorConfig:Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;

    .line 193
    .line 194
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->borderColorConfig:Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;

    .line 195
    .line 196
    if-nez p1, :cond_11

    .line 197
    .line 198
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;->new_()Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->borderColorConfig:Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;

    .line 203
    .line 204
    :cond_11
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 205
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->userJumpUrl:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->anchorJumpUrl:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->pictureConfig:Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/data/LiveAvatarFrameConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 23
    .line 24
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 25
    .line 26
    .line 27
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->contentConfig:Lcom/p1/mobile/putong/data/LiveUserCardButtonContent;

    .line 28
    .line 29
    if-eqz p0, :cond_3

    .line 30
    .line 31
    const/4 v0, 0x4

    .line 32
    sget-object v1, Lcom/p1/mobile/putong/data/LiveUserCardButtonContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 33
    .line 34
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->backgroundColorConfig:Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;

    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    const/4 v0, 0x5

    .line 42
    sget-object v1, Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 43
    .line 44
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 45
    .line 46
    .line 47
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;->borderColorConfig:Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;

    .line 48
    .line 49
    if-eqz p0, :cond_5

    .line 50
    .line 51
    const/4 p1, 0x6

    .line 52
    sget-object v0, Lcom/p1/mobile/putong/data/LiveUserCardButtonColorConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 53
    .line 54
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 55
    .line 56
    .line 57
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

    .line 58
    check-cast p1, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig$1;->serialize(Lcom/p1/mobile/putong/data/LiveUserCardButtonConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
