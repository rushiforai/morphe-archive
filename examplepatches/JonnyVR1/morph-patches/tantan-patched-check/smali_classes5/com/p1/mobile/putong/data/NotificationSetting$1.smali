.class Lcom/p1/mobile/putong/data/NotificationSetting$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/NotificationSetting;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/NotificationSetting;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/NotificationSetting;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->match:Z

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->conversation:Z

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    const/4 v0, 0x3

    .line 17
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->greeting:Z

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->teamAccount:Ljava/util/List;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const/4 v2, 0x4

    .line 35
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->momentUpdate:Ljava/util/List;

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    sget-object v1, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const/4 v2, 0x5

    .line 51
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->momentComment:Ljava/util/List;

    .line 57
    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    sget-object v1, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const/4 v2, 0x6

    .line 67
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLike:Ljava/util/List;

    .line 73
    .line 74
    if-eqz v0, :cond_3

    .line 75
    .line 76
    sget-object v1, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 77
    .line 78
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    const/4 v2, 0x7

    .line 83
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    add-int/2addr p0, v0

    .line 88
    :cond_3
    const/16 v0, 0x8

    .line 89
    .line 90
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLiked:Z

    .line 91
    .line 92
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    add-int/2addr p0, v0

    .line 97
    const/16 v0, 0x9

    .line 98
    .line 99
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->extremePick:Z

    .line 100
    .line 101
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    add-int/2addr p0, v0

    .line 106
    const/16 v0, 0xa

    .line 107
    .line 108
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->status:Z

    .line 109
    .line 110
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    add-int/2addr p0, v0

    .line 115
    const/16 v0, 0xb

    .line 116
    .line 117
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->group:Z

    .line 118
    .line 119
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    add-int/2addr p0, v0

    .line 124
    const/16 v0, 0xc

    .line 125
    .line 126
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->chatPartners:Z

    .line 127
    .line 128
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    add-int/2addr p0, v0

    .line 133
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 134
    .line 135
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 136
    check-cast p1, Lcom/p1/mobile/putong/data/NotificationSetting;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/NotificationSetting$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/NotificationSetting;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/NotificationSetting;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/NotificationSetting;-><init>()V

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
    sparse-switch v0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->teamAccount:Ljava/util/List;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    new-instance p1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->teamAccount:Ljava/util/List;

    .line 23
    .line 24
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentUpdate:Ljava/util/List;

    .line 25
    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    new-instance p1, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentUpdate:Ljava/util/List;

    .line 34
    .line 35
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentComment:Ljava/util/List;

    .line 36
    .line 37
    if-nez p1, :cond_2

    .line 38
    .line 39
    new-instance p1, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentComment:Ljava/util/List;

    .line 45
    .line 46
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLike:Ljava/util/List;

    .line 47
    .line 48
    if-nez p1, :cond_6

    .line 49
    .line 50
    new-instance p1, Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object p1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLike:Ljava/util/List;

    .line 56
    .line 57
    return-object p0

    .line 58
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->chatPartners:Z

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->group:Z

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->status:Z

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->extremePick:Z

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLiked:Z

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :sswitch_5
    sget-object v0, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 94
    .line 95
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Ljava/util/List;

    .line 104
    .line 105
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLike:Ljava/util/List;

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :sswitch_6
    sget-object v0, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 109
    .line 110
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    check-cast v0, Ljava/util/List;

    .line 119
    .line 120
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentComment:Ljava/util/List;

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :sswitch_7
    sget-object v0, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 124
    .line 125
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    check-cast v0, Ljava/util/List;

    .line 134
    .line 135
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentUpdate:Ljava/util/List;

    .line 136
    .line 137
    goto/16 :goto_0

    .line 138
    .line 139
    :sswitch_8
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 140
    .line 141
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    check-cast v0, Ljava/util/List;

    .line 150
    .line 151
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->teamAccount:Ljava/util/List;

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->greeting:Z

    .line 160
    .line 161
    goto/16 :goto_0

    .line 162
    .line 163
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->conversation:Z

    .line 168
    .line 169
    goto/16 :goto_0

    .line 170
    .line 171
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->match:Z

    .line 176
    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :sswitch_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->teamAccount:Ljava/util/List;

    .line 180
    .line 181
    if-nez p1, :cond_3

    .line 182
    .line 183
    new-instance p1, Ljava/util/ArrayList;

    .line 184
    .line 185
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 186
    .line 187
    .line 188
    iput-object p1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->teamAccount:Ljava/util/List;

    .line 189
    .line 190
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentUpdate:Ljava/util/List;

    .line 191
    .line 192
    if-nez p1, :cond_4

    .line 193
    .line 194
    new-instance p1, Ljava/util/ArrayList;

    .line 195
    .line 196
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 197
    .line 198
    .line 199
    iput-object p1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentUpdate:Ljava/util/List;

    .line 200
    .line 201
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentComment:Ljava/util/List;

    .line 202
    .line 203
    if-nez p1, :cond_5

    .line 204
    .line 205
    new-instance p1, Ljava/util/ArrayList;

    .line 206
    .line 207
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 208
    .line 209
    .line 210
    iput-object p1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentComment:Ljava/util/List;

    .line 211
    .line 212
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLike:Ljava/util/List;

    .line 213
    .line 214
    if-nez p1, :cond_6

    .line 215
    .line 216
    new-instance p1, Ljava/util/ArrayList;

    .line 217
    .line 218
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 219
    .line 220
    .line 221
    iput-object p1, p0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLike:Ljava/util/List;

    .line 222
    .line 223
    :cond_6
    return-object p0

    .line 224
    nop

    .line 225
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_c
        0x8 -> :sswitch_b
        0x10 -> :sswitch_a
        0x18 -> :sswitch_9
        0x22 -> :sswitch_8
        0x2a -> :sswitch_7
        0x32 -> :sswitch_6
        0x3a -> :sswitch_5
        0x40 -> :sswitch_4
        0x48 -> :sswitch_3
        0x50 -> :sswitch_2
        0x58 -> :sswitch_1
        0x60 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 225
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/NotificationSetting$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/NotificationSetting;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/NotificationSetting;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->match:Z

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->conversation:Z

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->greeting:Z

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->teamAccount:Ljava/util/List;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/4 v1, 0x4

    .line 30
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->momentUpdate:Ljava/util/List;

    .line 34
    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const/4 v1, 0x5

    .line 44
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->momentComment:Ljava/util/List;

    .line 48
    .line 49
    if-eqz p0, :cond_2

    .line 50
    .line 51
    sget-object v0, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const/4 v1, 0x6

    .line 58
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 59
    .line 60
    .line 61
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLike:Ljava/util/List;

    .line 62
    .line 63
    if-eqz p0, :cond_3

    .line 64
    .line 65
    sget-object v0, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const/4 v1, 0x7

    .line 72
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 73
    .line 74
    .line 75
    :cond_3
    const/16 p0, 0x8

    .line 76
    .line 77
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLiked:Z

    .line 78
    .line 79
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 80
    .line 81
    .line 82
    const/16 p0, 0x9

    .line 83
    .line 84
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->extremePick:Z

    .line 85
    .line 86
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 87
    .line 88
    .line 89
    const/16 p0, 0xa

    .line 90
    .line 91
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->status:Z

    .line 92
    .line 93
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 94
    .line 95
    .line 96
    const/16 p0, 0xb

    .line 97
    .line 98
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->group:Z

    .line 99
    .line 100
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 101
    .line 102
    .line 103
    const/16 p0, 0xc

    .line 104
    .line 105
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->chatPartners:Z

    .line 106
    .line 107
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 111
    check-cast p1, Lcom/p1/mobile/putong/data/NotificationSetting;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/NotificationSetting$1;->serialize(Lcom/p1/mobile/putong/data/NotificationSetting;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
