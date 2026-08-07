.class Lcom/p1/mobile/putong/core/data/CardPattern$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/CardPattern;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/CardPattern;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CardPattern;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->userId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->topleftIcon:Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 18
    .line 19
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->lowerRightIcon:Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const/4 v1, 0x3

    .line 29
    sget-object v2, Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 30
    .line 31
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->bottomContent:Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    sget-object v2, Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 42
    .line 43
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->realUser:Ljava/lang/String;

    .line 49
    .line 50
    if-eqz v0, :cond_4

    .line 51
    .line 52
    const/4 v1, 0x5

    .line 53
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->cover:Ljava/lang/String;

    .line 59
    .line 60
    if-eqz v0, :cond_5

    .line 61
    .line 62
    const/4 v1, 0x6

    .line 63
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->cardOptions:Ljava/util/List;

    .line 69
    .line 70
    if-eqz v0, :cond_6

    .line 71
    .line 72
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardOption;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 73
    .line 74
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    const/4 v2, 0x7

    .line 79
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    add-int/2addr p0, v0

    .line 84
    :cond_6
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 85
    .line 86
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 87
    check-cast p1, Lcom/p1/mobile/putong/core/data/CardPattern;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CardPattern$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CardPattern;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CardPattern;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/CardPattern;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/CardPattern;-><init>()V

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
    if-eqz v0, :cond_d

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_c

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_b

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_a

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_9

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_8

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_7

    .line 37
    .line 38
    const/16 v2, 0x3a

    .line 39
    .line 40
    if-eq v0, v2, :cond_6

    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->userId:Ljava/lang/String;

    .line 43
    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->userId:Ljava/lang/String;

    .line 47
    .line 48
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->topleftIcon:Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;

    .line 49
    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;->new_()Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->topleftIcon:Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;

    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->lowerRightIcon:Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;->new_()Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->lowerRightIcon:Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;

    .line 67
    .line 68
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->bottomContent:Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;

    .line 69
    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;->new_()Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->bottomContent:Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;

    .line 77
    .line 78
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->realUser:Ljava/lang/String;

    .line 79
    .line 80
    if-nez p1, :cond_4

    .line 81
    .line 82
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->realUser:Ljava/lang/String;

    .line 83
    .line 84
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->cover:Ljava/lang/String;

    .line 85
    .line 86
    if-nez p1, :cond_5

    .line 87
    .line 88
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->cover:Ljava/lang/String;

    .line 89
    .line 90
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->cardOptions:Ljava/util/List;

    .line 91
    .line 92
    if-nez p1, :cond_14

    .line 93
    .line 94
    new-instance p1, Ljava/util/ArrayList;

    .line 95
    .line 96
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 97
    .line 98
    .line 99
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->cardOptions:Ljava/util/List;

    .line 100
    .line 101
    return-object p0

    .line 102
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardOption;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 103
    .line 104
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    check-cast v0, Ljava/util/List;

    .line 113
    .line 114
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->cardOptions:Ljava/util/List;

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->cover:Ljava/lang/String;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->realUser:Ljava/lang/String;

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 132
    .line 133
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;

    .line 138
    .line 139
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->bottomContent:Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;

    .line 140
    .line 141
    goto/16 :goto_0

    .line 142
    .line 143
    :cond_a
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 144
    .line 145
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    check-cast v0, Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;

    .line 150
    .line 151
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->lowerRightIcon:Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :cond_b
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 156
    .line 157
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    check-cast v0, Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;

    .line 162
    .line 163
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->topleftIcon:Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;

    .line 164
    .line 165
    goto/16 :goto_0

    .line 166
    .line 167
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->userId:Ljava/lang/String;

    .line 172
    .line 173
    goto/16 :goto_0

    .line 174
    .line 175
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->userId:Ljava/lang/String;

    .line 176
    .line 177
    if-nez p1, :cond_e

    .line 178
    .line 179
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->userId:Ljava/lang/String;

    .line 180
    .line 181
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->topleftIcon:Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;

    .line 182
    .line 183
    if-nez p1, :cond_f

    .line 184
    .line 185
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;->new_()Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->topleftIcon:Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;

    .line 190
    .line 191
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->lowerRightIcon:Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;

    .line 192
    .line 193
    if-nez p1, :cond_10

    .line 194
    .line 195
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;->new_()Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->lowerRightIcon:Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;

    .line 200
    .line 201
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->bottomContent:Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;

    .line 202
    .line 203
    if-nez p1, :cond_11

    .line 204
    .line 205
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;->new_()Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->bottomContent:Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;

    .line 210
    .line 211
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->realUser:Ljava/lang/String;

    .line 212
    .line 213
    if-nez p1, :cond_12

    .line 214
    .line 215
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->realUser:Ljava/lang/String;

    .line 216
    .line 217
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->cover:Ljava/lang/String;

    .line 218
    .line 219
    if-nez p1, :cond_13

    .line 220
    .line 221
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->cover:Ljava/lang/String;

    .line 222
    .line 223
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->cardOptions:Ljava/util/List;

    .line 224
    .line 225
    if-nez p1, :cond_14

    .line 226
    .line 227
    new-instance p1, Ljava/util/ArrayList;

    .line 228
    .line 229
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 230
    .line 231
    .line 232
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->cardOptions:Ljava/util/List;

    .line 233
    .line 234
    :cond_14
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 235
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CardPattern$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CardPattern;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->userId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->topleftIcon:Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardPatternCombinedIcon;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->lowerRightIcon:Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 25
    .line 26
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->bottomContent:Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;

    .line 30
    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    const/4 v0, 0x4

    .line 34
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardPatternBottomContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 35
    .line 36
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 37
    .line 38
    .line 39
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->realUser:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz p0, :cond_4

    .line 42
    .line 43
    const/4 v0, 0x5

    .line 44
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->cover:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz p0, :cond_5

    .line 50
    .line 51
    const/4 v0, 0x6

    .line 52
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CardPattern;->cardOptions:Ljava/util/List;

    .line 56
    .line 57
    if-eqz p0, :cond_6

    .line 58
    .line 59
    sget-object p1, Lcom/p1/mobile/putong/core/data/CardOption;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    const/4 v0, 0x7

    .line 66
    invoke-virtual {p2, v0, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 67
    .line 68
    .line 69
    :cond_6
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 70
    check-cast p1, Lcom/p1/mobile/putong/core/data/CardPattern;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/CardPattern$1;->serialize(Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
