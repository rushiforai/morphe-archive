.class Lcom/p1/mobile/putong/core/data/GrowthPushConfig$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/GrowthPushConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/GrowthPushConfig;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/GrowthPushConfig;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->name:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->url:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->buttonText:Ljava/lang/String;

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
    const/4 v0, 0x5

    .line 43
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->isPassive:Z

    .line 44
    .line 45
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->tracker:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x6

    .line 55
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    :cond_4
    const/4 v0, 0x7

    .line 61
    iget v1, p1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->distance:I

    .line 62
    .line 63
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->zodiac:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz v0, :cond_5

    .line 71
    .line 72
    const/16 v1, 0x8

    .line 73
    .line 74
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    add-int/2addr p0, v0

    .line 79
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 80
    .line 81
    if-eqz v0, :cond_6

    .line 82
    .line 83
    const/16 v1, 0x9

    .line 84
    .line 85
    sget-object v2, Lcom/p1/mobile/putong/data/Gender;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 86
    .line 87
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    add-int/2addr p0, v0

    .line 92
    :cond_6
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 93
    .line 94
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 95
    check-cast p1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/GrowthPushConfig$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/GrowthPushConfig;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/GrowthPushConfig;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;-><init>()V

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
    if-eqz v0, :cond_f

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_e

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_d

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_c

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_b

    .line 29
    .line 30
    const/16 v2, 0x28

    .line 31
    .line 32
    if-eq v0, v2, :cond_a

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_9

    .line 37
    .line 38
    const/16 v2, 0x38

    .line 39
    .line 40
    if-eq v0, v2, :cond_8

    .line 41
    .line 42
    const/16 v2, 0x42

    .line 43
    .line 44
    if-eq v0, v2, :cond_7

    .line 45
    .line 46
    const/16 v2, 0x4a

    .line 47
    .line 48
    if-eq v0, v2, :cond_6

    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->id:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->id:Ljava/lang/String;

    .line 55
    .line 56
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->name:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->name:Ljava/lang/String;

    .line 61
    .line 62
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->url:Ljava/lang/String;

    .line 63
    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->url:Ljava/lang/String;

    .line 67
    .line 68
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->zodiac:Ljava/lang/String;

    .line 69
    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->zodiac:Ljava/lang/String;

    .line 73
    .line 74
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->tracker:Ljava/lang/String;

    .line 75
    .line 76
    if-nez p1, :cond_4

    .line 77
    .line 78
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->tracker:Ljava/lang/String;

    .line 79
    .line 80
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->buttonText:Ljava/lang/String;

    .line 81
    .line 82
    if-nez p1, :cond_5

    .line 83
    .line 84
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->buttonText:Ljava/lang/String;

    .line 85
    .line 86
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 87
    .line 88
    if-nez p1, :cond_16

    .line 89
    .line 90
    sget-object p1, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 91
    .line 92
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    check-cast p1, Lcom/p1/mobile/putong/data/Gender;

    .line 97
    .line 98
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 99
    .line 100
    return-object p0

    .line 101
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/data/Gender;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 102
    .line 103
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Lcom/p1/mobile/putong/data/Gender;

    .line 108
    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->zodiac:Ljava/lang/String;

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    iput v0, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->distance:I

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->tracker:Ljava/lang/String;

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->isPassive:Z

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->buttonText:Ljava/lang/String;

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->url:Ljava/lang/String;

    .line 154
    .line 155
    goto/16 :goto_0

    .line 156
    .line 157
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->name:Ljava/lang/String;

    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :cond_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->id:Ljava/lang/String;

    .line 170
    .line 171
    goto/16 :goto_0

    .line 172
    .line 173
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->id:Ljava/lang/String;

    .line 174
    .line 175
    if-nez p1, :cond_10

    .line 176
    .line 177
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->id:Ljava/lang/String;

    .line 178
    .line 179
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->name:Ljava/lang/String;

    .line 180
    .line 181
    if-nez p1, :cond_11

    .line 182
    .line 183
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->name:Ljava/lang/String;

    .line 184
    .line 185
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->url:Ljava/lang/String;

    .line 186
    .line 187
    if-nez p1, :cond_12

    .line 188
    .line 189
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->url:Ljava/lang/String;

    .line 190
    .line 191
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->zodiac:Ljava/lang/String;

    .line 192
    .line 193
    if-nez p1, :cond_13

    .line 194
    .line 195
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->zodiac:Ljava/lang/String;

    .line 196
    .line 197
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->tracker:Ljava/lang/String;

    .line 198
    .line 199
    if-nez p1, :cond_14

    .line 200
    .line 201
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->tracker:Ljava/lang/String;

    .line 202
    .line 203
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->buttonText:Ljava/lang/String;

    .line 204
    .line 205
    if-nez p1, :cond_15

    .line 206
    .line 207
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->buttonText:Ljava/lang/String;

    .line 208
    .line 209
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 210
    .line 211
    if-nez p1, :cond_16

    .line 212
    .line 213
    sget-object p1, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 214
    .line 215
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    check-cast p1, Lcom/p1/mobile/putong/data/Gender;

    .line 220
    .line 221
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 222
    .line 223
    :cond_16
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 224
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/GrowthPushConfig$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/GrowthPushConfig;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->name:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->url:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->buttonText:Ljava/lang/String;

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
    const/4 p0, 0x5

    .line 34
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->isPassive:Z

    .line 35
    .line 36
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->tracker:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz p0, :cond_4

    .line 42
    .line 43
    const/4 v0, 0x6

    .line 44
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_4
    const/4 p0, 0x7

    .line 48
    iget v0, p1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->distance:I

    .line 49
    .line 50
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->zodiac:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz p0, :cond_5

    .line 56
    .line 57
    const/16 v0, 0x8

    .line 58
    .line 59
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 63
    .line 64
    if-eqz p0, :cond_6

    .line 65
    .line 66
    const/16 p1, 0x9

    .line 67
    .line 68
    sget-object v0, Lcom/p1/mobile/putong/data/Gender;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 69
    .line 70
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 71
    .line 72
    .line 73
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

    .line 74
    check-cast p1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/GrowthPushConfig$1;->serialize(Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
