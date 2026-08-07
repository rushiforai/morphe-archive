.class Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->heading:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->heading_font_color:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->bg_url:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_bg_url:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_focus_bg_url:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    const/4 v1, 0x5

    .line 47
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_focus_logo_url:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v0, :cond_5

    .line 55
    .line 56
    const/4 v1, 0x6

    .line 57
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->options:Ljava/util/List;

    .line 63
    .line 64
    if-eqz v0, :cond_6

    .line 65
    .line 66
    sget-object v1, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionOptionsData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    const/4 v2, 0x7

    .line 73
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    add-int/2addr p0, v0

    .line 78
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_focus_font_color:Ljava/lang/String;

    .line 79
    .line 80
    if-eqz v0, :cond_7

    .line 81
    .line 82
    const/16 v1, 0x8

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
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_font_color:Ljava/lang/String;

    .line 90
    .line 91
    if-eqz v0, :cond_8

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
    :cond_8
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 101
    .line 102
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 103
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;-><init>()V

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
    if-eqz v0, :cond_11

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_10

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_f

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_e

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_d

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_c

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_b

    .line 37
    .line 38
    const/16 v2, 0x3a

    .line 39
    .line 40
    if-eq v0, v2, :cond_a

    .line 41
    .line 42
    const/16 v2, 0x42

    .line 43
    .line 44
    if-eq v0, v2, :cond_9

    .line 45
    .line 46
    const/16 v2, 0x4a

    .line 47
    .line 48
    if-eq v0, v2, :cond_8

    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->heading:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->heading:Ljava/lang/String;

    .line 55
    .line 56
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->heading_font_color:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->heading_font_color:Ljava/lang/String;

    .line 61
    .line 62
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->bg_url:Ljava/lang/String;

    .line 63
    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->bg_url:Ljava/lang/String;

    .line 67
    .line 68
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_bg_url:Ljava/lang/String;

    .line 69
    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_bg_url:Ljava/lang/String;

    .line 73
    .line 74
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_focus_bg_url:Ljava/lang/String;

    .line 75
    .line 76
    if-nez p1, :cond_4

    .line 77
    .line 78
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_focus_bg_url:Ljava/lang/String;

    .line 79
    .line 80
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_focus_font_color:Ljava/lang/String;

    .line 81
    .line 82
    if-nez p1, :cond_5

    .line 83
    .line 84
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_focus_font_color:Ljava/lang/String;

    .line 85
    .line 86
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_font_color:Ljava/lang/String;

    .line 87
    .line 88
    if-nez p1, :cond_6

    .line 89
    .line 90
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_font_color:Ljava/lang/String;

    .line 91
    .line 92
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_focus_logo_url:Ljava/lang/String;

    .line 93
    .line 94
    if-nez p1, :cond_7

    .line 95
    .line 96
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_focus_logo_url:Ljava/lang/String;

    .line 97
    .line 98
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->options:Ljava/util/List;

    .line 99
    .line 100
    if-nez p1, :cond_1a

    .line 101
    .line 102
    new-instance p1, Ljava/util/ArrayList;

    .line 103
    .line 104
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 105
    .line 106
    .line 107
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->options:Ljava/util/List;

    .line 108
    .line 109
    return-object p0

    .line 110
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_font_color:Ljava/lang/String;

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_focus_font_color:Ljava/lang/String;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_a
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionOptionsData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 125
    .line 126
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    check-cast v0, Ljava/util/List;

    .line 135
    .line 136
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->options:Ljava/util/List;

    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_focus_logo_url:Ljava/lang/String;

    .line 145
    .line 146
    goto/16 :goto_0

    .line 147
    .line 148
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_focus_bg_url:Ljava/lang/String;

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_bg_url:Ljava/lang/String;

    .line 161
    .line 162
    goto/16 :goto_0

    .line 163
    .line 164
    :cond_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->bg_url:Ljava/lang/String;

    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :cond_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->heading_font_color:Ljava/lang/String;

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :cond_10
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->heading:Ljava/lang/String;

    .line 185
    .line 186
    goto/16 :goto_0

    .line 187
    .line 188
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->heading:Ljava/lang/String;

    .line 189
    .line 190
    if-nez p1, :cond_12

    .line 191
    .line 192
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->heading:Ljava/lang/String;

    .line 193
    .line 194
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->heading_font_color:Ljava/lang/String;

    .line 195
    .line 196
    if-nez p1, :cond_13

    .line 197
    .line 198
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->heading_font_color:Ljava/lang/String;

    .line 199
    .line 200
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->bg_url:Ljava/lang/String;

    .line 201
    .line 202
    if-nez p1, :cond_14

    .line 203
    .line 204
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->bg_url:Ljava/lang/String;

    .line 205
    .line 206
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_bg_url:Ljava/lang/String;

    .line 207
    .line 208
    if-nez p1, :cond_15

    .line 209
    .line 210
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_bg_url:Ljava/lang/String;

    .line 211
    .line 212
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_focus_bg_url:Ljava/lang/String;

    .line 213
    .line 214
    if-nez p1, :cond_16

    .line 215
    .line 216
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_focus_bg_url:Ljava/lang/String;

    .line 217
    .line 218
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_focus_font_color:Ljava/lang/String;

    .line 219
    .line 220
    if-nez p1, :cond_17

    .line 221
    .line 222
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_focus_font_color:Ljava/lang/String;

    .line 223
    .line 224
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_font_color:Ljava/lang/String;

    .line 225
    .line 226
    if-nez p1, :cond_18

    .line 227
    .line 228
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_font_color:Ljava/lang/String;

    .line 229
    .line 230
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_focus_logo_url:Ljava/lang/String;

    .line 231
    .line 232
    if-nez p1, :cond_19

    .line 233
    .line 234
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_focus_logo_url:Ljava/lang/String;

    .line 235
    .line 236
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->options:Ljava/util/List;

    .line 237
    .line 238
    if-nez p1, :cond_1a

    .line 239
    .line 240
    new-instance p1, Ljava/util/ArrayList;

    .line 241
    .line 242
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 243
    .line 244
    .line 245
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->options:Ljava/util/List;

    .line 246
    .line 247
    :cond_1a
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 248
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->heading:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->heading_font_color:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->bg_url:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_bg_url:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_focus_bg_url:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p0, :cond_4

    .line 36
    .line 37
    const/4 v0, 0x5

    .line 38
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_focus_logo_url:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz p0, :cond_5

    .line 44
    .line 45
    const/4 v0, 0x6

    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->options:Ljava/util/List;

    .line 50
    .line 51
    if-eqz p0, :cond_6

    .line 52
    .line 53
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionOptionsData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const/4 v1, 0x7

    .line 60
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 61
    .line 62
    .line 63
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_focus_font_color:Ljava/lang/String;

    .line 64
    .line 65
    if-eqz p0, :cond_7

    .line 66
    .line 67
    const/16 v0, 0x8

    .line 68
    .line 69
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 70
    .line 71
    .line 72
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;->opt_font_color:Ljava/lang/String;

    .line 73
    .line 74
    if-eqz p0, :cond_8

    .line 75
    .line 76
    const/16 p1, 0x9

    .line 77
    .line 78
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_8
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
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData$1;->serialize(Lcom/p1/mobile/putong/core/data/IntlCampingQuestionsData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
