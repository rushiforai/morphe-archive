.class Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->repeatPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-static {v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->netPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 20
    .line 21
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->swipeLimitDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 32
    .line 33
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->trigger:Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x4

    .line 43
    sget-object v2, Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 44
    .line 45
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->aiPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x5

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 56
    .line 57
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_4
    const/4 v0, 0x6

    .line 63
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->enable:Z

    .line 64
    .line 65
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 71
    .line 72
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 73
    check-cast p1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;-><init>()V

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
    if-eqz v0, :cond_a

    .line 11
    .line 12
    const/16 v1, 0xa

    .line 13
    .line 14
    if-eq v0, v1, :cond_9

    .line 15
    .line 16
    const/16 v1, 0x12

    .line 17
    .line 18
    if-eq v0, v1, :cond_8

    .line 19
    .line 20
    const/16 v1, 0x1a

    .line 21
    .line 22
    if-eq v0, v1, :cond_7

    .line 23
    .line 24
    const/16 v1, 0x22

    .line 25
    .line 26
    if-eq v0, v1, :cond_6

    .line 27
    .line 28
    const/16 v1, 0x2a

    .line 29
    .line 30
    if-eq v0, v1, :cond_5

    .line 31
    .line 32
    const/16 v1, 0x30

    .line 33
    .line 34
    if-eq v0, v1, :cond_4

    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->repeatPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 37
    .line 38
    if-nez p1, :cond_0

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->new_()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->repeatPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 45
    .line 46
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->netPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 47
    .line 48
    if-nez p1, :cond_1

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->new_()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->netPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 55
    .line 56
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->swipeLimitDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 57
    .line 58
    if-nez p1, :cond_2

    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->new_()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->swipeLimitDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 65
    .line 66
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->trigger:Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 67
    .line 68
    if-nez p1, :cond_3

    .line 69
    .line 70
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;->new_()Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->trigger:Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 75
    .line 76
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->aiPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 77
    .line 78
    if-nez p1, :cond_f

    .line 79
    .line 80
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->new_()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->aiPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 85
    .line 86
    return-object p0

    .line 87
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->enable:Z

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 95
    .line 96
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 101
    .line 102
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->aiPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 106
    .line 107
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    check-cast v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 112
    .line 113
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->trigger:Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 117
    .line 118
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    check-cast v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 123
    .line 124
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->swipeLimitDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 128
    .line 129
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    check-cast v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 134
    .line 135
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->netPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 136
    .line 137
    goto/16 :goto_0

    .line 138
    .line 139
    :cond_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 140
    .line 141
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    check-cast v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 146
    .line 147
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->repeatPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 148
    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->repeatPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 152
    .line 153
    if-nez p1, :cond_b

    .line 154
    .line 155
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->new_()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->repeatPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 160
    .line 161
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->netPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 162
    .line 163
    if-nez p1, :cond_c

    .line 164
    .line 165
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->new_()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->netPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 170
    .line 171
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->swipeLimitDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 172
    .line 173
    if-nez p1, :cond_d

    .line 174
    .line 175
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->new_()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->swipeLimitDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 180
    .line 181
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->trigger:Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 182
    .line 183
    if-nez p1, :cond_e

    .line 184
    .line 185
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;->new_()Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->trigger:Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 190
    .line 191
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->aiPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 192
    .line 193
    if-nez p1, :cond_f

    .line 194
    .line 195
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->new_()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->aiPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 200
    .line 201
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

    .line 202
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->repeatPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->netPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->swipeLimitDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->trigger:Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 37
    .line 38
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->aiPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 42
    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    const/4 v0, 0x5

    .line 46
    sget-object v1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 49
    .line 50
    .line 51
    :cond_4
    const/4 p0, 0x6

    .line 52
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->enable:Z

    .line 53
    .line 54
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 55
    .line 56
    .line 57
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
    check-cast p1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig$1;->serialize(Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
