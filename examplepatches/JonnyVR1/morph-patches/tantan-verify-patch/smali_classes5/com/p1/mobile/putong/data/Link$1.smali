.class Lcom/p1/mobile/putong/data/Link$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Link;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/Link;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/Link;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Link;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Link;->intent:Lcom/p1/mobile/putong/data/LinkIntent;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Link;->channel:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Link;->resources:Ljava/util/List;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    sget-object v1, Lcom/p1/mobile/putong/data/IdBoxed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const/4 v2, 0x4

    .line 51
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 57
    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    const/4 v1, 0x5

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Link;->state:Lcom/p1/mobile/putong/data/LinkState;

    .line 67
    .line 68
    if-eqz v0, :cond_5

    .line 69
    .line 70
    const/4 v1, 0x6

    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    add-int/2addr p0, v0

    .line 80
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Link;->title:Ljava/lang/String;

    .line 81
    .line 82
    if-eqz v0, :cond_6

    .line 83
    .line 84
    const/4 v1, 0x7

    .line 85
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    add-int/2addr p0, v0

    .line 90
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Link;->owner:Ljava/lang/String;

    .line 91
    .line 92
    if-eqz v0, :cond_7

    .line 93
    .line 94
    const/16 v1, 0x8

    .line 95
    .line 96
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    add-int/2addr p0, v0

    .line 101
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Link;->intent:Lcom/p1/mobile/putong/data/LinkIntent;

    .line 102
    .line 103
    if-eqz v0, :cond_8

    .line 104
    .line 105
    const/16 v1, 0x9

    .line 106
    .line 107
    sget-object v2, Lcom/p1/mobile/putong/data/LinkIntent;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 108
    .line 109
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    add-int/2addr p0, v0

    .line 114
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Link;->channel:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 115
    .line 116
    if-eqz v0, :cond_9

    .line 117
    .line 118
    const/16 v1, 0xa

    .line 119
    .line 120
    sget-object v2, Lcom/p1/mobile/putong/data/LinkChannel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 121
    .line 122
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    add-int/2addr p0, v0

    .line 127
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Link;->state:Lcom/p1/mobile/putong/data/LinkState;

    .line 128
    .line 129
    if-eqz v0, :cond_a

    .line 130
    .line 131
    const/16 v1, 0xb

    .line 132
    .line 133
    sget-object v2, Lcom/p1/mobile/putong/data/LinkState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 134
    .line 135
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    add-int/2addr p0, v0

    .line 140
    :cond_a
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 141
    .line 142
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 143
    check-cast p1, Lcom/p1/mobile/putong/data/Link;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Link$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/Link;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Link;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Link;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Link;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    move-object v2, v1

    .line 9
    move-object v3, v2

    .line 10
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    const-string v5, ""

    .line 15
    .line 16
    sparse-switch v4, :sswitch_data_0

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Link;->intent:Lcom/p1/mobile/putong/data/LinkIntent;

    .line 20
    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    sget-object p1, Lcom/p1/mobile/putong/data/LinkIntent;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Lcom/p1/mobile/putong/data/LinkIntent;

    .line 36
    .line 37
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Link;->intent:Lcom/p1/mobile/putong/data/LinkIntent;

    .line 38
    .line 39
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Link;->channel:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 40
    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    sget-object p1, Lcom/p1/mobile/putong/data/LinkChannel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    check-cast p1, Lcom/p1/mobile/putong/data/LinkChannel;

    .line 56
    .line 57
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Link;->channel:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 58
    .line 59
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Link;->state:Lcom/p1/mobile/putong/data/LinkState;

    .line 60
    .line 61
    if-nez p1, :cond_2

    .line 62
    .line 63
    if-eqz v3, :cond_2

    .line 64
    .line 65
    sget-object p1, Lcom/p1/mobile/putong/data/LinkState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 66
    .line 67
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    check-cast p1, Lcom/p1/mobile/putong/data/LinkState;

    .line 76
    .line 77
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Link;->state:Lcom/p1/mobile/putong/data/LinkState;

    .line 78
    .line 79
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Link;->id:Ljava/lang/String;

    .line 80
    .line 81
    if-nez p1, :cond_3

    .line 82
    .line 83
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Link;->id:Ljava/lang/String;

    .line 84
    .line 85
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Link;->intent:Lcom/p1/mobile/putong/data/LinkIntent;

    .line 86
    .line 87
    if-nez p1, :cond_4

    .line 88
    .line 89
    sget-object p1, Lcom/p1/mobile/putong/data/LinkIntent;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 90
    .line 91
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    check-cast p1, Lcom/p1/mobile/putong/data/LinkIntent;

    .line 96
    .line 97
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Link;->intent:Lcom/p1/mobile/putong/data/LinkIntent;

    .line 98
    .line 99
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Link;->channel:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 100
    .line 101
    if-nez p1, :cond_5

    .line 102
    .line 103
    sget-object p1, Lcom/p1/mobile/putong/data/LinkChannel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 104
    .line 105
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    check-cast p1, Lcom/p1/mobile/putong/data/LinkChannel;

    .line 110
    .line 111
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Link;->channel:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 112
    .line 113
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Link;->resources:Ljava/util/List;

    .line 114
    .line 115
    if-nez p1, :cond_6

    .line 116
    .line 117
    new-instance p1, Ljava/util/ArrayList;

    .line 118
    .line 119
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 120
    .line 121
    .line 122
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Link;->resources:Ljava/util/List;

    .line 123
    .line 124
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 125
    .line 126
    if-nez p1, :cond_7

    .line 127
    .line 128
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 129
    .line 130
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Link;->state:Lcom/p1/mobile/putong/data/LinkState;

    .line 131
    .line 132
    if-nez p1, :cond_8

    .line 133
    .line 134
    sget-object p1, Lcom/p1/mobile/putong/data/LinkState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 135
    .line 136
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    check-cast p1, Lcom/p1/mobile/putong/data/LinkState;

    .line 141
    .line 142
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Link;->state:Lcom/p1/mobile/putong/data/LinkState;

    .line 143
    .line 144
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Link;->title:Ljava/lang/String;

    .line 145
    .line 146
    if-nez p1, :cond_9

    .line 147
    .line 148
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Link;->title:Ljava/lang/String;

    .line 149
    .line 150
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Link;->owner:Ljava/lang/String;

    .line 151
    .line 152
    if-nez p1, :cond_14

    .line 153
    .line 154
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Link;->owner:Ljava/lang/String;

    .line 155
    .line 156
    return-object p0

    .line 157
    :sswitch_0
    sget-object v4, Lcom/p1/mobile/putong/data/LinkState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 158
    .line 159
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    check-cast v4, Lcom/p1/mobile/putong/data/LinkState;

    .line 164
    .line 165
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Link;->state:Lcom/p1/mobile/putong/data/LinkState;

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :sswitch_1
    sget-object v4, Lcom/p1/mobile/putong/data/LinkChannel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 170
    .line 171
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v4

    .line 175
    check-cast v4, Lcom/p1/mobile/putong/data/LinkChannel;

    .line 176
    .line 177
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Link;->channel:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 178
    .line 179
    goto/16 :goto_0

    .line 180
    .line 181
    :sswitch_2
    sget-object v4, Lcom/p1/mobile/putong/data/LinkIntent;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 182
    .line 183
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object v4

    .line 187
    check-cast v4, Lcom/p1/mobile/putong/data/LinkIntent;

    .line 188
    .line 189
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Link;->intent:Lcom/p1/mobile/putong/data/LinkIntent;

    .line 190
    .line 191
    goto/16 :goto_0

    .line 192
    .line 193
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v4

    .line 197
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Link;->owner:Ljava/lang/String;

    .line 198
    .line 199
    goto/16 :goto_0

    .line 200
    .line 201
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v4

    .line 205
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Link;->title:Ljava/lang/String;

    .line 206
    .line 207
    goto/16 :goto_0

    .line 208
    .line 209
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 210
    .line 211
    .line 212
    move-result v3

    .line 213
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    goto/16 :goto_0

    .line 218
    .line 219
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v4

    .line 223
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 224
    .line 225
    goto/16 :goto_0

    .line 226
    .line 227
    :sswitch_7
    sget-object v4, Lcom/p1/mobile/putong/data/IdBoxed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 228
    .line 229
    invoke-virtual {v4}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 230
    .line 231
    .line 232
    move-result-object v4

    .line 233
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object v4

    .line 237
    check-cast v4, Ljava/util/List;

    .line 238
    .line 239
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Link;->resources:Ljava/util/List;

    .line 240
    .line 241
    goto/16 :goto_0

    .line 242
    .line 243
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 244
    .line 245
    .line 246
    move-result v2

    .line 247
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 248
    .line 249
    .line 250
    move-result-object v2

    .line 251
    goto/16 :goto_0

    .line 252
    .line 253
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 254
    .line 255
    .line 256
    move-result v1

    .line 257
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    goto/16 :goto_0

    .line 262
    .line 263
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v4

    .line 267
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Link;->id:Ljava/lang/String;

    .line 268
    .line 269
    goto/16 :goto_0

    .line 270
    .line 271
    :sswitch_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Link;->intent:Lcom/p1/mobile/putong/data/LinkIntent;

    .line 272
    .line 273
    if-nez p1, :cond_a

    .line 274
    .line 275
    if-eqz v1, :cond_a

    .line 276
    .line 277
    sget-object p1, Lcom/p1/mobile/putong/data/LinkIntent;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 278
    .line 279
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 280
    .line 281
    .line 282
    move-result v1

    .line 283
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 284
    .line 285
    .line 286
    move-result-object p1

    .line 287
    check-cast p1, Lcom/p1/mobile/putong/data/LinkIntent;

    .line 288
    .line 289
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Link;->intent:Lcom/p1/mobile/putong/data/LinkIntent;

    .line 290
    .line 291
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Link;->channel:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 292
    .line 293
    if-nez p1, :cond_b

    .line 294
    .line 295
    if-eqz v2, :cond_b

    .line 296
    .line 297
    sget-object p1, Lcom/p1/mobile/putong/data/LinkChannel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 298
    .line 299
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 300
    .line 301
    .line 302
    move-result v1

    .line 303
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 304
    .line 305
    .line 306
    move-result-object p1

    .line 307
    check-cast p1, Lcom/p1/mobile/putong/data/LinkChannel;

    .line 308
    .line 309
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Link;->channel:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 310
    .line 311
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Link;->state:Lcom/p1/mobile/putong/data/LinkState;

    .line 312
    .line 313
    if-nez p1, :cond_c

    .line 314
    .line 315
    if-eqz v3, :cond_c

    .line 316
    .line 317
    sget-object p1, Lcom/p1/mobile/putong/data/LinkState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 318
    .line 319
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 320
    .line 321
    .line 322
    move-result v1

    .line 323
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 324
    .line 325
    .line 326
    move-result-object p1

    .line 327
    check-cast p1, Lcom/p1/mobile/putong/data/LinkState;

    .line 328
    .line 329
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Link;->state:Lcom/p1/mobile/putong/data/LinkState;

    .line 330
    .line 331
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Link;->id:Ljava/lang/String;

    .line 332
    .line 333
    if-nez p1, :cond_d

    .line 334
    .line 335
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Link;->id:Ljava/lang/String;

    .line 336
    .line 337
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Link;->intent:Lcom/p1/mobile/putong/data/LinkIntent;

    .line 338
    .line 339
    if-nez p1, :cond_e

    .line 340
    .line 341
    sget-object p1, Lcom/p1/mobile/putong/data/LinkIntent;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 342
    .line 343
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 344
    .line 345
    .line 346
    move-result-object p1

    .line 347
    check-cast p1, Lcom/p1/mobile/putong/data/LinkIntent;

    .line 348
    .line 349
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Link;->intent:Lcom/p1/mobile/putong/data/LinkIntent;

    .line 350
    .line 351
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Link;->channel:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 352
    .line 353
    if-nez p1, :cond_f

    .line 354
    .line 355
    sget-object p1, Lcom/p1/mobile/putong/data/LinkChannel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 356
    .line 357
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 358
    .line 359
    .line 360
    move-result-object p1

    .line 361
    check-cast p1, Lcom/p1/mobile/putong/data/LinkChannel;

    .line 362
    .line 363
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Link;->channel:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 364
    .line 365
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Link;->resources:Ljava/util/List;

    .line 366
    .line 367
    if-nez p1, :cond_10

    .line 368
    .line 369
    new-instance p1, Ljava/util/ArrayList;

    .line 370
    .line 371
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 372
    .line 373
    .line 374
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Link;->resources:Ljava/util/List;

    .line 375
    .line 376
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 377
    .line 378
    if-nez p1, :cond_11

    .line 379
    .line 380
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 381
    .line 382
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Link;->state:Lcom/p1/mobile/putong/data/LinkState;

    .line 383
    .line 384
    if-nez p1, :cond_12

    .line 385
    .line 386
    sget-object p1, Lcom/p1/mobile/putong/data/LinkState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 387
    .line 388
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 389
    .line 390
    .line 391
    move-result-object p1

    .line 392
    check-cast p1, Lcom/p1/mobile/putong/data/LinkState;

    .line 393
    .line 394
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Link;->state:Lcom/p1/mobile/putong/data/LinkState;

    .line 395
    .line 396
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Link;->title:Ljava/lang/String;

    .line 397
    .line 398
    if-nez p1, :cond_13

    .line 399
    .line 400
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Link;->title:Ljava/lang/String;

    .line 401
    .line 402
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Link;->owner:Ljava/lang/String;

    .line 403
    .line 404
    if-nez p1, :cond_14

    .line 405
    .line 406
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Link;->owner:Ljava/lang/String;

    .line 407
    .line 408
    :cond_14
    return-object p0

    .line 409
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_b
        0xa -> :sswitch_a
        0x10 -> :sswitch_9
        0x18 -> :sswitch_8
        0x22 -> :sswitch_7
        0x2a -> :sswitch_6
        0x30 -> :sswitch_5
        0x3a -> :sswitch_4
        0x42 -> :sswitch_3
        0x4a -> :sswitch_2
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

    .line 409
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Link$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Link;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/Link;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Link;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Link;->intent:Lcom/p1/mobile/putong/data/LinkIntent;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Link;->channel:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Link;->resources:Ljava/util/List;

    .line 34
    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/data/IdBoxed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const/4 v1, 0x4

    .line 44
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 45
    .line 46
    .line 47
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz p0, :cond_4

    .line 50
    .line 51
    const/4 v0, 0x5

    .line 52
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Link;->state:Lcom/p1/mobile/putong/data/LinkState;

    .line 56
    .line 57
    if-eqz p0, :cond_5

    .line 58
    .line 59
    const/4 v0, 0x6

    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 65
    .line 66
    .line 67
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Link;->title:Ljava/lang/String;

    .line 68
    .line 69
    if-eqz p0, :cond_6

    .line 70
    .line 71
    const/4 v0, 0x7

    .line 72
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Link;->owner:Ljava/lang/String;

    .line 76
    .line 77
    if-eqz p0, :cond_7

    .line 78
    .line 79
    const/16 v0, 0x8

    .line 80
    .line 81
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Link;->intent:Lcom/p1/mobile/putong/data/LinkIntent;

    .line 85
    .line 86
    if-eqz p0, :cond_8

    .line 87
    .line 88
    const/16 v0, 0x9

    .line 89
    .line 90
    sget-object v1, Lcom/p1/mobile/putong/data/LinkIntent;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 91
    .line 92
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 93
    .line 94
    .line 95
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Link;->channel:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 96
    .line 97
    if-eqz p0, :cond_9

    .line 98
    .line 99
    const/16 v0, 0xa

    .line 100
    .line 101
    sget-object v1, Lcom/p1/mobile/putong/data/LinkChannel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 102
    .line 103
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 104
    .line 105
    .line 106
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Link;->state:Lcom/p1/mobile/putong/data/LinkState;

    .line 107
    .line 108
    if-eqz p0, :cond_a

    .line 109
    .line 110
    const/16 p1, 0xb

    .line 111
    .line 112
    sget-object v0, Lcom/p1/mobile/putong/data/LinkState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 113
    .line 114
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 115
    .line 116
    .line 117
    :cond_a
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 118
    check-cast p1, Lcom/p1/mobile/putong/data/Link;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Link$1;->serialize(Lcom/p1/mobile/putong/data/Link;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
