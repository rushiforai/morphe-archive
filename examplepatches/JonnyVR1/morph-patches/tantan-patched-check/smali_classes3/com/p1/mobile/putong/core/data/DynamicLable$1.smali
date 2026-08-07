.class Lcom/p1/mobile/putong/core/data/DynamicLable$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/DynamicLable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/DynamicLable;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/DynamicLable;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/DynamicLable;->label:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/DynamicLable;->type:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/DynamicLable;->textColor:Ljava/lang/String;

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
    const/4 v0, 0x4

    .line 33
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/DynamicLable;->textBold:Z

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/DynamicLable;->deeplink:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    const/4 v1, 0x5

    .line 45
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/DynamicLable;->background:Lcom/p1/mobile/putong/core/data/LabelBackground;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x6

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/core/data/LabelBackground;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/DynamicLable;->iconStyle:Lcom/p1/mobile/putong/core/data/LabelIconStyle;

    .line 63
    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    const/4 v1, 0x7

    .line 67
    sget-object v2, Lcom/p1/mobile/putong/core/data/LabelIconStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 68
    .line 69
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/DynamicLable;->statistics:Lcom/p1/mobile/putong/core/data/LabelStatistics;

    .line 75
    .line 76
    if-eqz v0, :cond_6

    .line 77
    .line 78
    const/16 v1, 0x8

    .line 79
    .line 80
    sget-object v2, Lcom/p1/mobile/putong/core/data/LabelStatistics;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 81
    .line 82
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    add-int/2addr p0, v0

    .line 87
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/DynamicLable;->showTips:Lcom/p1/mobile/putong/core/data/LabelshowTips;

    .line 88
    .line 89
    if-eqz v0, :cond_7

    .line 90
    .line 91
    const/16 v1, 0x9

    .line 92
    .line 93
    sget-object v2, Lcom/p1/mobile/putong/core/data/LabelshowTips;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 94
    .line 95
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr p0, v0

    .line 100
    :cond_7
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 101
    .line 102
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 103
    check-cast p1, Lcom/p1/mobile/putong/core/data/DynamicLable;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/DynamicLable$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/DynamicLable;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/DynamicLable;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/DynamicLable;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/DynamicLable;-><init>()V

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
    if-eqz v0, :cond_10

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_f

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_e

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_d

    .line 25
    .line 26
    const/16 v2, 0x20

    .line 27
    .line 28
    if-eq v0, v2, :cond_c

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_b

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_a

    .line 37
    .line 38
    const/16 v2, 0x3a

    .line 39
    .line 40
    if-eq v0, v2, :cond_9

    .line 41
    .line 42
    const/16 v2, 0x42

    .line 43
    .line 44
    if-eq v0, v2, :cond_8

    .line 45
    .line 46
    const/16 v2, 0x4a

    .line 47
    .line 48
    if-eq v0, v2, :cond_7

    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->label:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->label:Ljava/lang/String;

    .line 55
    .line 56
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->type:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->type:Ljava/lang/String;

    .line 61
    .line 62
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->textColor:Ljava/lang/String;

    .line 63
    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->textColor:Ljava/lang/String;

    .line 67
    .line 68
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->deeplink:Ljava/lang/String;

    .line 69
    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->deeplink:Ljava/lang/String;

    .line 73
    .line 74
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->background:Lcom/p1/mobile/putong/core/data/LabelBackground;

    .line 75
    .line 76
    if-nez p1, :cond_4

    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LabelBackground;->new_()Lcom/p1/mobile/putong/core/data/LabelBackground;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->background:Lcom/p1/mobile/putong/core/data/LabelBackground;

    .line 83
    .line 84
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->iconStyle:Lcom/p1/mobile/putong/core/data/LabelIconStyle;

    .line 85
    .line 86
    if-nez p1, :cond_5

    .line 87
    .line 88
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LabelIconStyle;->new_()Lcom/p1/mobile/putong/core/data/LabelIconStyle;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->iconStyle:Lcom/p1/mobile/putong/core/data/LabelIconStyle;

    .line 93
    .line 94
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->statistics:Lcom/p1/mobile/putong/core/data/LabelStatistics;

    .line 95
    .line 96
    if-nez p1, :cond_6

    .line 97
    .line 98
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LabelStatistics;->new_()Lcom/p1/mobile/putong/core/data/LabelStatistics;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->statistics:Lcom/p1/mobile/putong/core/data/LabelStatistics;

    .line 103
    .line 104
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->showTips:Lcom/p1/mobile/putong/core/data/LabelshowTips;

    .line 105
    .line 106
    if-nez p1, :cond_18

    .line 107
    .line 108
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LabelshowTips;->new_()Lcom/p1/mobile/putong/core/data/LabelshowTips;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->showTips:Lcom/p1/mobile/putong/core/data/LabelshowTips;

    .line 113
    .line 114
    return-object p0

    .line 115
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/core/data/LabelshowTips;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 116
    .line 117
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    check-cast v0, Lcom/p1/mobile/putong/core/data/LabelshowTips;

    .line 122
    .line 123
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->showTips:Lcom/p1/mobile/putong/core/data/LabelshowTips;

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/core/data/LabelStatistics;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 127
    .line 128
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    check-cast v0, Lcom/p1/mobile/putong/core/data/LabelStatistics;

    .line 133
    .line 134
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->statistics:Lcom/p1/mobile/putong/core/data/LabelStatistics;

    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :cond_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/LabelIconStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 139
    .line 140
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    check-cast v0, Lcom/p1/mobile/putong/core/data/LabelIconStyle;

    .line 145
    .line 146
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->iconStyle:Lcom/p1/mobile/putong/core/data/LabelIconStyle;

    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :cond_a
    sget-object v0, Lcom/p1/mobile/putong/core/data/LabelBackground;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 151
    .line 152
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    check-cast v0, Lcom/p1/mobile/putong/core/data/LabelBackground;

    .line 157
    .line 158
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->background:Lcom/p1/mobile/putong/core/data/LabelBackground;

    .line 159
    .line 160
    goto/16 :goto_0

    .line 161
    .line 162
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->deeplink:Ljava/lang/String;

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->textBold:Z

    .line 175
    .line 176
    goto/16 :goto_0

    .line 177
    .line 178
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->textColor:Ljava/lang/String;

    .line 183
    .line 184
    goto/16 :goto_0

    .line 185
    .line 186
    :cond_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->type:Ljava/lang/String;

    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :cond_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->label:Ljava/lang/String;

    .line 199
    .line 200
    goto/16 :goto_0

    .line 201
    .line 202
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->label:Ljava/lang/String;

    .line 203
    .line 204
    if-nez p1, :cond_11

    .line 205
    .line 206
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->label:Ljava/lang/String;

    .line 207
    .line 208
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->type:Ljava/lang/String;

    .line 209
    .line 210
    if-nez p1, :cond_12

    .line 211
    .line 212
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->type:Ljava/lang/String;

    .line 213
    .line 214
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->textColor:Ljava/lang/String;

    .line 215
    .line 216
    if-nez p1, :cond_13

    .line 217
    .line 218
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->textColor:Ljava/lang/String;

    .line 219
    .line 220
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->deeplink:Ljava/lang/String;

    .line 221
    .line 222
    if-nez p1, :cond_14

    .line 223
    .line 224
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->deeplink:Ljava/lang/String;

    .line 225
    .line 226
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->background:Lcom/p1/mobile/putong/core/data/LabelBackground;

    .line 227
    .line 228
    if-nez p1, :cond_15

    .line 229
    .line 230
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LabelBackground;->new_()Lcom/p1/mobile/putong/core/data/LabelBackground;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->background:Lcom/p1/mobile/putong/core/data/LabelBackground;

    .line 235
    .line 236
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->iconStyle:Lcom/p1/mobile/putong/core/data/LabelIconStyle;

    .line 237
    .line 238
    if-nez p1, :cond_16

    .line 239
    .line 240
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LabelIconStyle;->new_()Lcom/p1/mobile/putong/core/data/LabelIconStyle;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->iconStyle:Lcom/p1/mobile/putong/core/data/LabelIconStyle;

    .line 245
    .line 246
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->statistics:Lcom/p1/mobile/putong/core/data/LabelStatistics;

    .line 247
    .line 248
    if-nez p1, :cond_17

    .line 249
    .line 250
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LabelStatistics;->new_()Lcom/p1/mobile/putong/core/data/LabelStatistics;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->statistics:Lcom/p1/mobile/putong/core/data/LabelStatistics;

    .line 255
    .line 256
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->showTips:Lcom/p1/mobile/putong/core/data/LabelshowTips;

    .line 257
    .line 258
    if-nez p1, :cond_18

    .line 259
    .line 260
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LabelshowTips;->new_()Lcom/p1/mobile/putong/core/data/LabelshowTips;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/DynamicLable;->showTips:Lcom/p1/mobile/putong/core/data/LabelshowTips;

    .line 265
    .line 266
    :cond_18
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 267
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/DynamicLable$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/DynamicLable;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/DynamicLable;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/DynamicLable;->label:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/DynamicLable;->type:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/DynamicLable;->textColor:Ljava/lang/String;

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
    const/4 p0, 0x4

    .line 26
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/DynamicLable;->textBold:Z

    .line 27
    .line 28
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/DynamicLable;->deeplink:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x5

    .line 36
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/DynamicLable;->background:Lcom/p1/mobile/putong/core/data/LabelBackground;

    .line 40
    .line 41
    if-eqz p0, :cond_4

    .line 42
    .line 43
    const/4 v0, 0x6

    .line 44
    sget-object v1, Lcom/p1/mobile/putong/core/data/LabelBackground;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 45
    .line 46
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 47
    .line 48
    .line 49
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/DynamicLable;->iconStyle:Lcom/p1/mobile/putong/core/data/LabelIconStyle;

    .line 50
    .line 51
    if-eqz p0, :cond_5

    .line 52
    .line 53
    const/4 v0, 0x7

    .line 54
    sget-object v1, Lcom/p1/mobile/putong/core/data/LabelIconStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 55
    .line 56
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 57
    .line 58
    .line 59
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/DynamicLable;->statistics:Lcom/p1/mobile/putong/core/data/LabelStatistics;

    .line 60
    .line 61
    if-eqz p0, :cond_6

    .line 62
    .line 63
    const/16 v0, 0x8

    .line 64
    .line 65
    sget-object v1, Lcom/p1/mobile/putong/core/data/LabelStatistics;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 66
    .line 67
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 68
    .line 69
    .line 70
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/DynamicLable;->showTips:Lcom/p1/mobile/putong/core/data/LabelshowTips;

    .line 71
    .line 72
    if-eqz p0, :cond_7

    .line 73
    .line 74
    const/16 p1, 0x9

    .line 75
    .line 76
    sget-object v0, Lcom/p1/mobile/putong/core/data/LabelshowTips;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 77
    .line 78
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 79
    .line 80
    .line 81
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

    .line 82
    check-cast p1, Lcom/p1/mobile/putong/core/data/DynamicLable;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/DynamicLable$1;->serialize(Lcom/p1/mobile/putong/core/data/DynamicLable;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
