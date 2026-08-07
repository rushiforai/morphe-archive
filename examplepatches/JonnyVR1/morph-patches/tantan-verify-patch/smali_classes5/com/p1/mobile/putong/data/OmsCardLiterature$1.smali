.class Lcom/p1/mobile/putong/data/OmsCardLiterature$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/OmsCardLiterature;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/OmsCardLiterature;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/OmsCardLiterature;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->pictures:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->color:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/4 v1, 0x2

    .line 23
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->topLeftTags:Ljava/util/List;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const/4 v2, 0x3

    .line 39
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->icons:Ljava/util/List;

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    const/4 v2, 0x4

    .line 55
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->title:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz v0, :cond_4

    .line 63
    .line 64
    const/4 v1, 0x5

    .line 65
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->guidance:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz v0, :cond_5

    .line 73
    .line 74
    const/4 v1, 0x6

    .line 75
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    add-int/2addr p0, v0

    .line 80
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->introduction:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->name:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->type:Ljava/lang/String;

    .line 102
    .line 103
    if-eqz v0, :cond_8

    .line 104
    .line 105
    const/16 v1, 0x9

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->author:Ljava/util/List;

    .line 113
    .line 114
    if-eqz v0, :cond_9

    .line 115
    .line 116
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 117
    .line 118
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    const/16 v2, 0xa

    .line 123
    .line 124
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    add-int/2addr p0, v0

    .line 129
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->buttons:Ljava/util/List;

    .line 130
    .line 131
    if-eqz v0, :cond_a

    .line 132
    .line 133
    sget-object v1, Lcom/p1/mobile/putong/data/Action;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 134
    .line 135
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    const/16 v2, 0xb

    .line 140
    .line 141
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    add-int/2addr p0, v0

    .line 146
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->literatureID:Ljava/lang/String;

    .line 147
    .line 148
    if-eqz v0, :cond_b

    .line 149
    .line 150
    const/16 v1, 0xc

    .line 151
    .line 152
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    add-int/2addr p0, v0

    .line 157
    :cond_b
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 158
    .line 159
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 160
    check-cast p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OmsCardLiterature$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/OmsCardLiterature;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OmsCardLiterature;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OmsCardLiterature;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->pictures:Ljava/util/List;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    new-instance p1, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->pictures:Ljava/util/List;

    .line 25
    .line 26
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->color:Ljava/lang/String;

    .line 27
    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->color:Ljava/lang/String;

    .line 31
    .line 32
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->topLeftTags:Ljava/util/List;

    .line 33
    .line 34
    if-nez p1, :cond_2

    .line 35
    .line 36
    new-instance p1, Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->topLeftTags:Ljava/util/List;

    .line 42
    .line 43
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->icons:Ljava/util/List;

    .line 44
    .line 45
    if-nez p1, :cond_3

    .line 46
    .line 47
    new-instance p1, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->icons:Ljava/util/List;

    .line 53
    .line 54
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->title:Ljava/lang/String;

    .line 55
    .line 56
    if-nez p1, :cond_4

    .line 57
    .line 58
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->title:Ljava/lang/String;

    .line 59
    .line 60
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->guidance:Ljava/lang/String;

    .line 61
    .line 62
    if-nez p1, :cond_5

    .line 63
    .line 64
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->guidance:Ljava/lang/String;

    .line 65
    .line 66
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->introduction:Ljava/lang/String;

    .line 67
    .line 68
    if-nez p1, :cond_6

    .line 69
    .line 70
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->introduction:Ljava/lang/String;

    .line 71
    .line 72
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->name:Ljava/lang/String;

    .line 73
    .line 74
    if-nez p1, :cond_7

    .line 75
    .line 76
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->name:Ljava/lang/String;

    .line 77
    .line 78
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->type:Ljava/lang/String;

    .line 79
    .line 80
    if-nez p1, :cond_8

    .line 81
    .line 82
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->type:Ljava/lang/String;

    .line 83
    .line 84
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->author:Ljava/util/List;

    .line 85
    .line 86
    if-nez p1, :cond_9

    .line 87
    .line 88
    new-instance p1, Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 91
    .line 92
    .line 93
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->author:Ljava/util/List;

    .line 94
    .line 95
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->buttons:Ljava/util/List;

    .line 96
    .line 97
    if-nez p1, :cond_a

    .line 98
    .line 99
    new-instance p1, Ljava/util/ArrayList;

    .line 100
    .line 101
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 102
    .line 103
    .line 104
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->buttons:Ljava/util/List;

    .line 105
    .line 106
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->literatureID:Ljava/lang/String;

    .line 107
    .line 108
    if-nez p1, :cond_16

    .line 109
    .line 110
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->literatureID:Ljava/lang/String;

    .line 111
    .line 112
    return-object p0

    .line 113
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->literatureID:Ljava/lang/String;

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/data/Action;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 121
    .line 122
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    check-cast v0, Ljava/util/List;

    .line 131
    .line 132
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->buttons:Ljava/util/List;

    .line 133
    .line 134
    goto/16 :goto_0

    .line 135
    .line 136
    :sswitch_2
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 137
    .line 138
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    check-cast v0, Ljava/util/List;

    .line 147
    .line 148
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->author:Ljava/util/List;

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->type:Ljava/lang/String;

    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->name:Ljava/lang/String;

    .line 165
    .line 166
    goto/16 :goto_0

    .line 167
    .line 168
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->introduction:Ljava/lang/String;

    .line 173
    .line 174
    goto/16 :goto_0

    .line 175
    .line 176
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->guidance:Ljava/lang/String;

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->title:Ljava/lang/String;

    .line 189
    .line 190
    goto/16 :goto_0

    .line 191
    .line 192
    :sswitch_8
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 193
    .line 194
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    check-cast v0, Ljava/util/List;

    .line 203
    .line 204
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->icons:Ljava/util/List;

    .line 205
    .line 206
    goto/16 :goto_0

    .line 207
    .line 208
    :sswitch_9
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 209
    .line 210
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    check-cast v0, Ljava/util/List;

    .line 219
    .line 220
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->topLeftTags:Ljava/util/List;

    .line 221
    .line 222
    goto/16 :goto_0

    .line 223
    .line 224
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->color:Ljava/lang/String;

    .line 229
    .line 230
    goto/16 :goto_0

    .line 231
    .line 232
    :sswitch_b
    sget-object v0, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 233
    .line 234
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    check-cast v0, Ljava/util/List;

    .line 243
    .line 244
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->pictures:Ljava/util/List;

    .line 245
    .line 246
    goto/16 :goto_0

    .line 247
    .line 248
    :sswitch_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->pictures:Ljava/util/List;

    .line 249
    .line 250
    if-nez p1, :cond_b

    .line 251
    .line 252
    new-instance p1, Ljava/util/ArrayList;

    .line 253
    .line 254
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 255
    .line 256
    .line 257
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->pictures:Ljava/util/List;

    .line 258
    .line 259
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->color:Ljava/lang/String;

    .line 260
    .line 261
    if-nez p1, :cond_c

    .line 262
    .line 263
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->color:Ljava/lang/String;

    .line 264
    .line 265
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->topLeftTags:Ljava/util/List;

    .line 266
    .line 267
    if-nez p1, :cond_d

    .line 268
    .line 269
    new-instance p1, Ljava/util/ArrayList;

    .line 270
    .line 271
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 272
    .line 273
    .line 274
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->topLeftTags:Ljava/util/List;

    .line 275
    .line 276
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->icons:Ljava/util/List;

    .line 277
    .line 278
    if-nez p1, :cond_e

    .line 279
    .line 280
    new-instance p1, Ljava/util/ArrayList;

    .line 281
    .line 282
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 283
    .line 284
    .line 285
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->icons:Ljava/util/List;

    .line 286
    .line 287
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->title:Ljava/lang/String;

    .line 288
    .line 289
    if-nez p1, :cond_f

    .line 290
    .line 291
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->title:Ljava/lang/String;

    .line 292
    .line 293
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->guidance:Ljava/lang/String;

    .line 294
    .line 295
    if-nez p1, :cond_10

    .line 296
    .line 297
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->guidance:Ljava/lang/String;

    .line 298
    .line 299
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->introduction:Ljava/lang/String;

    .line 300
    .line 301
    if-nez p1, :cond_11

    .line 302
    .line 303
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->introduction:Ljava/lang/String;

    .line 304
    .line 305
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->name:Ljava/lang/String;

    .line 306
    .line 307
    if-nez p1, :cond_12

    .line 308
    .line 309
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->name:Ljava/lang/String;

    .line 310
    .line 311
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->type:Ljava/lang/String;

    .line 312
    .line 313
    if-nez p1, :cond_13

    .line 314
    .line 315
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->type:Ljava/lang/String;

    .line 316
    .line 317
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->author:Ljava/util/List;

    .line 318
    .line 319
    if-nez p1, :cond_14

    .line 320
    .line 321
    new-instance p1, Ljava/util/ArrayList;

    .line 322
    .line 323
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 324
    .line 325
    .line 326
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->author:Ljava/util/List;

    .line 327
    .line 328
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->buttons:Ljava/util/List;

    .line 329
    .line 330
    if-nez p1, :cond_15

    .line 331
    .line 332
    new-instance p1, Ljava/util/ArrayList;

    .line 333
    .line 334
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 335
    .line 336
    .line 337
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->buttons:Ljava/util/List;

    .line 338
    .line 339
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->literatureID:Ljava/lang/String;

    .line 340
    .line 341
    if-nez p1, :cond_16

    .line 342
    .line 343
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardLiterature;->literatureID:Ljava/lang/String;

    .line 344
    .line 345
    :cond_16
    return-object p0

    .line 346
    nop

    .line 347
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_c
        0xa -> :sswitch_b
        0x12 -> :sswitch_a
        0x1a -> :sswitch_9
        0x22 -> :sswitch_8
        0x2a -> :sswitch_7
        0x32 -> :sswitch_6
        0x3a -> :sswitch_5
        0x42 -> :sswitch_4
        0x4a -> :sswitch_3
        0x52 -> :sswitch_2
        0x5a -> :sswitch_1
        0x62 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 347
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OmsCardLiterature$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OmsCardLiterature;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/OmsCardLiterature;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->pictures:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->color:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x2

    .line 20
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->topLeftTags:Ljava/util/List;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v1, 0x3

    .line 34
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->icons:Ljava/util/List;

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const/4 v1, 0x4

    .line 48
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 49
    .line 50
    .line 51
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->title:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz p0, :cond_4

    .line 54
    .line 55
    const/4 v0, 0x5

    .line 56
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->guidance:Ljava/lang/String;

    .line 60
    .line 61
    if-eqz p0, :cond_5

    .line 62
    .line 63
    const/4 v0, 0x6

    .line 64
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->introduction:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->name:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->type:Ljava/lang/String;

    .line 85
    .line 86
    if-eqz p0, :cond_8

    .line 87
    .line 88
    const/16 v0, 0x9

    .line 89
    .line 90
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->author:Ljava/util/List;

    .line 94
    .line 95
    if-eqz p0, :cond_9

    .line 96
    .line 97
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 98
    .line 99
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    const/16 v1, 0xa

    .line 104
    .line 105
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 106
    .line 107
    .line 108
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->buttons:Ljava/util/List;

    .line 109
    .line 110
    if-eqz p0, :cond_a

    .line 111
    .line 112
    sget-object v0, Lcom/p1/mobile/putong/data/Action;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 113
    .line 114
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    const/16 v1, 0xb

    .line 119
    .line 120
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 121
    .line 122
    .line 123
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;->literatureID:Ljava/lang/String;

    .line 124
    .line 125
    if-eqz p0, :cond_b

    .line 126
    .line 127
    const/16 p1, 0xc

    .line 128
    .line 129
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 130
    .line 131
    .line 132
    :cond_b
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 133
    check-cast p1, Lcom/p1/mobile/putong/data/OmsCardLiterature;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/OmsCardLiterature$1;->serialize(Lcom/p1/mobile/putong/data/OmsCardLiterature;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
