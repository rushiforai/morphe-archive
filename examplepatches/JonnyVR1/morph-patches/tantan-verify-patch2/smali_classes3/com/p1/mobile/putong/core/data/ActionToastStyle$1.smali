.class Lcom/p1/mobile/putong/core/data/ActionToastStyle$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ActionToastStyle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/ActionToastStyle;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ActionToastStyle;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->styleId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->mainImg:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->icons:Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    sget-object v2, Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->toastLink:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    const/4 v1, 0x4

    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->title:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v0, :cond_4

    .line 47
    .line 48
    const/4 v1, 0x5

    .line 49
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->message:Ljava/lang/String;

    .line 55
    .line 56
    if-eqz v0, :cond_5

    .line 57
    .line 58
    const/4 v1, 0x6

    .line 59
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    :cond_5
    const/4 v0, 0x7

    .line 65
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->showClose:Z

    .line 66
    .line 67
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->scenes:Ljava/util/List;

    .line 73
    .line 74
    if-eqz v0, :cond_6

    .line 75
    .line 76
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 77
    .line 78
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    const/16 v2, 0x8

    .line 83
    .line 84
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    add-int/2addr p0, v0

    .line 89
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->business:Ljava/lang/String;

    .line 90
    .line 91
    if-eqz v0, :cond_7

    .line 92
    .line 93
    const/16 v1, 0x9

    .line 94
    .line 95
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr p0, v0

    .line 100
    :cond_7
    const/16 v0, 0xa

    .line 101
    .line 102
    iget v1, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->showTime:I

    .line 103
    .line 104
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    add-int/2addr p0, v0

    .line 109
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->buttons:Ljava/util/List;

    .line 110
    .line 111
    if-eqz v0, :cond_8

    .line 112
    .line 113
    sget-object v1, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 114
    .line 115
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    const/16 v2, 0xb

    .line 120
    .line 121
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    add-int/2addr p0, v0

    .line 126
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->localReportId:Ljava/lang/String;

    .line 127
    .line 128
    if-eqz v0, :cond_9

    .line 129
    .line 130
    const/16 v1, 0xc

    .line 131
    .line 132
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    add-int/2addr p0, v0

    .line 137
    :cond_9
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 138
    .line 139
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 140
    check-cast p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ActionToastStyle$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ActionToastStyle;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ActionToastStyle;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ActionToastStyle;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->styleId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->styleId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->mainImg:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->mainImg:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->icons:Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;->new_()Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->icons:Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;

    .line 36
    .line 37
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->toastLink:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_3

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->toastLink:Ljava/lang/String;

    .line 42
    .line 43
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->title:Ljava/lang/String;

    .line 44
    .line 45
    if-nez p1, :cond_4

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->title:Ljava/lang/String;

    .line 48
    .line 49
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->message:Ljava/lang/String;

    .line 50
    .line 51
    if-nez p1, :cond_5

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->message:Ljava/lang/String;

    .line 54
    .line 55
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->buttons:Ljava/util/List;

    .line 56
    .line 57
    if-nez p1, :cond_6

    .line 58
    .line 59
    new-instance p1, Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 62
    .line 63
    .line 64
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->buttons:Ljava/util/List;

    .line 65
    .line 66
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->scenes:Ljava/util/List;

    .line 67
    .line 68
    if-nez p1, :cond_7

    .line 69
    .line 70
    new-instance p1, Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 73
    .line 74
    .line 75
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->scenes:Ljava/util/List;

    .line 76
    .line 77
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->business:Ljava/lang/String;

    .line 78
    .line 79
    if-nez p1, :cond_8

    .line 80
    .line 81
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->business:Ljava/lang/String;

    .line 82
    .line 83
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->localReportId:Ljava/lang/String;

    .line 84
    .line 85
    if-nez p1, :cond_12

    .line 86
    .line 87
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->localReportId:Ljava/lang/String;

    .line 88
    .line 89
    return-object p0

    .line 90
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->localReportId:Ljava/lang/String;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 98
    .line 99
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Ljava/util/List;

    .line 108
    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->buttons:Ljava/util/List;

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    iput v0, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->showTime:I

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->business:Ljava/lang/String;

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :sswitch_4
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 127
    .line 128
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    check-cast v0, Ljava/util/List;

    .line 137
    .line 138
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->scenes:Ljava/util/List;

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->showClose:Z

    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->message:Ljava/lang/String;

    .line 155
    .line 156
    goto/16 :goto_0

    .line 157
    .line 158
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->title:Ljava/lang/String;

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->toastLink:Ljava/lang/String;

    .line 171
    .line 172
    goto/16 :goto_0

    .line 173
    .line 174
    :sswitch_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 175
    .line 176
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    check-cast v0, Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;

    .line 181
    .line 182
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->icons:Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;

    .line 183
    .line 184
    goto/16 :goto_0

    .line 185
    .line 186
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->mainImg:Ljava/lang/String;

    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->styleId:Ljava/lang/String;

    .line 199
    .line 200
    goto/16 :goto_0

    .line 201
    .line 202
    :sswitch_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->styleId:Ljava/lang/String;

    .line 203
    .line 204
    if-nez p1, :cond_9

    .line 205
    .line 206
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->styleId:Ljava/lang/String;

    .line 207
    .line 208
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->mainImg:Ljava/lang/String;

    .line 209
    .line 210
    if-nez p1, :cond_a

    .line 211
    .line 212
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->mainImg:Ljava/lang/String;

    .line 213
    .line 214
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->icons:Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;

    .line 215
    .line 216
    if-nez p1, :cond_b

    .line 217
    .line 218
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;->new_()Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->icons:Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;

    .line 223
    .line 224
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->toastLink:Ljava/lang/String;

    .line 225
    .line 226
    if-nez p1, :cond_c

    .line 227
    .line 228
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->toastLink:Ljava/lang/String;

    .line 229
    .line 230
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->title:Ljava/lang/String;

    .line 231
    .line 232
    if-nez p1, :cond_d

    .line 233
    .line 234
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->title:Ljava/lang/String;

    .line 235
    .line 236
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->message:Ljava/lang/String;

    .line 237
    .line 238
    if-nez p1, :cond_e

    .line 239
    .line 240
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->message:Ljava/lang/String;

    .line 241
    .line 242
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->buttons:Ljava/util/List;

    .line 243
    .line 244
    if-nez p1, :cond_f

    .line 245
    .line 246
    new-instance p1, Ljava/util/ArrayList;

    .line 247
    .line 248
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 249
    .line 250
    .line 251
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->buttons:Ljava/util/List;

    .line 252
    .line 253
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->scenes:Ljava/util/List;

    .line 254
    .line 255
    if-nez p1, :cond_10

    .line 256
    .line 257
    new-instance p1, Ljava/util/ArrayList;

    .line 258
    .line 259
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 260
    .line 261
    .line 262
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->scenes:Ljava/util/List;

    .line 263
    .line 264
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->business:Ljava/lang/String;

    .line 265
    .line 266
    if-nez p1, :cond_11

    .line 267
    .line 268
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->business:Ljava/lang/String;

    .line 269
    .line 270
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->localReportId:Ljava/lang/String;

    .line 271
    .line 272
    if-nez p1, :cond_12

    .line 273
    .line 274
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->localReportId:Ljava/lang/String;

    .line 275
    .line 276
    :cond_12
    return-object p0

    .line 277
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_c
        0xa -> :sswitch_b
        0x12 -> :sswitch_a
        0x1a -> :sswitch_9
        0x22 -> :sswitch_8
        0x2a -> :sswitch_7
        0x32 -> :sswitch_6
        0x38 -> :sswitch_5
        0x42 -> :sswitch_4
        0x4a -> :sswitch_3
        0x50 -> :sswitch_2
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

    .line 277
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ActionToastStyle$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/ActionToastStyle;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->styleId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->mainImg:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->icons:Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 23
    .line 24
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 25
    .line 26
    .line 27
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->toastLink:Ljava/lang/String;

    .line 28
    .line 29
    if-eqz p0, :cond_3

    .line 30
    .line 31
    const/4 v0, 0x4

    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->title:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p0, :cond_4

    .line 38
    .line 39
    const/4 v0, 0x5

    .line 40
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->message:Ljava/lang/String;

    .line 44
    .line 45
    if-eqz p0, :cond_5

    .line 46
    .line 47
    const/4 v0, 0x6

    .line 48
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_5
    const/4 p0, 0x7

    .line 52
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->showClose:Z

    .line 53
    .line 54
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->scenes:Ljava/util/List;

    .line 58
    .line 59
    if-eqz p0, :cond_6

    .line 60
    .line 61
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const/16 v1, 0x8

    .line 68
    .line 69
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 70
    .line 71
    .line 72
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->business:Ljava/lang/String;

    .line 73
    .line 74
    if-eqz p0, :cond_7

    .line 75
    .line 76
    const/16 v0, 0x9

    .line 77
    .line 78
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_7
    const/16 p0, 0xa

    .line 82
    .line 83
    iget v0, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->showTime:I

    .line 84
    .line 85
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->buttons:Ljava/util/List;

    .line 89
    .line 90
    if-eqz p0, :cond_8

    .line 91
    .line 92
    sget-object v0, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 93
    .line 94
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    const/16 v1, 0xb

    .line 99
    .line 100
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 101
    .line 102
    .line 103
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->localReportId:Ljava/lang/String;

    .line 104
    .line 105
    if-eqz p0, :cond_9

    .line 106
    .line 107
    const/16 p1, 0xc

    .line 108
    .line 109
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 110
    .line 111
    .line 112
    :cond_9
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 113
    check-cast p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ActionToastStyle$1;->serialize(Lcom/p1/mobile/putong/core/data/ActionToastStyle;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
