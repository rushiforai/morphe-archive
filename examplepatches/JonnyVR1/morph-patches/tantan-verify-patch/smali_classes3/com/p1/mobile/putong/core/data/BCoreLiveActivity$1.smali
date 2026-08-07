.class Lcom/p1/mobile/putong/core/data/BCoreLiveActivity$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->title:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->value:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    sget-object v2, Lcom/p1/mobile/putong/data/IdBoxed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->reference:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 45
    .line 46
    if-eqz v0, :cond_4

    .line 47
    .line 48
    const/4 v1, 0x5

    .line 49
    sget-object v2, Lcom/p1/mobile/putong/data/IdBoxed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->type:Ljava/lang/String;

    .line 57
    .line 58
    if-eqz v0, :cond_5

    .line 59
    .line 60
    const/4 v1, 0x6

    .line 61
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->valueType:Ljava/lang/String;

    .line 67
    .line 68
    if-eqz v0, :cond_6

    .line 69
    .line 70
    const/4 v1, 0x7

    .line 71
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int/2addr p0, v0

    .line 76
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->category:Ljava/lang/String;

    .line 77
    .line 78
    if-eqz v0, :cond_7

    .line 79
    .line 80
    const/16 v1, 0x8

    .line 81
    .line 82
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    add-int/2addr p0, v0

    .line 87
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->valueColor:Ljava/lang/String;

    .line 88
    .line 89
    if-eqz v0, :cond_8

    .line 90
    .line 91
    const/16 v1, 0x9

    .line 92
    .line 93
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    add-int/2addr p0, v0

    .line 98
    :cond_8
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 99
    .line 100
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 101
    check-cast p1, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->id:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->id:Ljava/lang/String;

    .line 55
    .line 56
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->title:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->title:Ljava/lang/String;

    .line 61
    .line 62
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->value:Ljava/lang/String;

    .line 63
    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->value:Ljava/lang/String;

    .line 67
    .line 68
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 69
    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/data/IdBoxed;->new_()Lcom/p1/mobile/putong/data/IdBoxed;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 77
    .line 78
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->reference:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 79
    .line 80
    if-nez p1, :cond_4

    .line 81
    .line 82
    invoke-static {}, Lcom/p1/mobile/putong/data/IdBoxed;->new_()Lcom/p1/mobile/putong/data/IdBoxed;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->reference:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 87
    .line 88
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->type:Ljava/lang/String;

    .line 89
    .line 90
    if-nez p1, :cond_5

    .line 91
    .line 92
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->type:Ljava/lang/String;

    .line 93
    .line 94
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->valueType:Ljava/lang/String;

    .line 95
    .line 96
    if-nez p1, :cond_6

    .line 97
    .line 98
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->valueType:Ljava/lang/String;

    .line 99
    .line 100
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->category:Ljava/lang/String;

    .line 101
    .line 102
    if-nez p1, :cond_7

    .line 103
    .line 104
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->category:Ljava/lang/String;

    .line 105
    .line 106
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->valueColor:Ljava/lang/String;

    .line 107
    .line 108
    if-nez p1, :cond_1a

    .line 109
    .line 110
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->valueColor:Ljava/lang/String;

    .line 111
    .line 112
    return-object p0

    .line 113
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->valueColor:Ljava/lang/String;

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->category:Ljava/lang/String;

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->valueType:Ljava/lang/String;

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->type:Ljava/lang/String;

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :cond_c
    sget-object v0, Lcom/p1/mobile/putong/data/IdBoxed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 143
    .line 144
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    check-cast v0, Lcom/p1/mobile/putong/data/IdBoxed;

    .line 149
    .line 150
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->reference:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 151
    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :cond_d
    sget-object v0, Lcom/p1/mobile/putong/data/IdBoxed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 155
    .line 156
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    check-cast v0, Lcom/p1/mobile/putong/data/IdBoxed;

    .line 161
    .line 162
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :cond_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->value:Ljava/lang/String;

    .line 171
    .line 172
    goto/16 :goto_0

    .line 173
    .line 174
    :cond_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->title:Ljava/lang/String;

    .line 179
    .line 180
    goto/16 :goto_0

    .line 181
    .line 182
    :cond_10
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->id:Ljava/lang/String;

    .line 187
    .line 188
    goto/16 :goto_0

    .line 189
    .line 190
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->id:Ljava/lang/String;

    .line 191
    .line 192
    if-nez p1, :cond_12

    .line 193
    .line 194
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->id:Ljava/lang/String;

    .line 195
    .line 196
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->title:Ljava/lang/String;

    .line 197
    .line 198
    if-nez p1, :cond_13

    .line 199
    .line 200
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->title:Ljava/lang/String;

    .line 201
    .line 202
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->value:Ljava/lang/String;

    .line 203
    .line 204
    if-nez p1, :cond_14

    .line 205
    .line 206
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->value:Ljava/lang/String;

    .line 207
    .line 208
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 209
    .line 210
    if-nez p1, :cond_15

    .line 211
    .line 212
    invoke-static {}, Lcom/p1/mobile/putong/data/IdBoxed;->new_()Lcom/p1/mobile/putong/data/IdBoxed;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 217
    .line 218
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->reference:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 219
    .line 220
    if-nez p1, :cond_16

    .line 221
    .line 222
    invoke-static {}, Lcom/p1/mobile/putong/data/IdBoxed;->new_()Lcom/p1/mobile/putong/data/IdBoxed;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->reference:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 227
    .line 228
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->type:Ljava/lang/String;

    .line 229
    .line 230
    if-nez p1, :cond_17

    .line 231
    .line 232
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->type:Ljava/lang/String;

    .line 233
    .line 234
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->valueType:Ljava/lang/String;

    .line 235
    .line 236
    if-nez p1, :cond_18

    .line 237
    .line 238
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->valueType:Ljava/lang/String;

    .line 239
    .line 240
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->category:Ljava/lang/String;

    .line 241
    .line 242
    if-nez p1, :cond_19

    .line 243
    .line 244
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->category:Ljava/lang/String;

    .line 245
    .line 246
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->valueColor:Ljava/lang/String;

    .line 247
    .line 248
    if-nez p1, :cond_1a

    .line 249
    .line 250
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->valueColor:Ljava/lang/String;

    .line 251
    .line 252
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

    .line 253
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->title:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->value:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    sget-object v1, Lcom/p1/mobile/putong/data/IdBoxed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 33
    .line 34
    .line 35
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->reference:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 36
    .line 37
    if-eqz p0, :cond_4

    .line 38
    .line 39
    const/4 v0, 0x5

    .line 40
    sget-object v1, Lcom/p1/mobile/putong/data/IdBoxed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 41
    .line 42
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 43
    .line 44
    .line 45
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->type:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz p0, :cond_5

    .line 48
    .line 49
    const/4 v0, 0x6

    .line 50
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->valueType:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz p0, :cond_6

    .line 56
    .line 57
    const/4 v0, 0x7

    .line 58
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->category:Ljava/lang/String;

    .line 62
    .line 63
    if-eqz p0, :cond_7

    .line 64
    .line 65
    const/16 v0, 0x8

    .line 66
    .line 67
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->valueColor:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz p0, :cond_8

    .line 73
    .line 74
    const/16 p1, 0x9

    .line 75
    .line 76
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 77
    .line 78
    .line 79
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

    .line 80
    check-cast p1, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity$1;->serialize(Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
