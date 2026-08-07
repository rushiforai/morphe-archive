.class Lcom/p1/mobile/putong/core/data/ComStatusAward$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ComStatusAward;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/ComStatusAward;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ComStatusAward;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;->businessName:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;->awards:Ljava/util/List;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    sget-object v1, Lcom/p1/mobile/putong/core/data/AwardType;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const/4 v2, 0x3

    .line 37
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_2
    const/4 v0, 0x4

    .line 43
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;->updateTime:J

    .line 44
    .line 45
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;->nextStatus:Lcom/p1/mobile/putong/core/data/NextStatus;

    .line 51
    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    const/4 v1, 0x5

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/core/data/NextStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_3
    const/4 v0, 0x6

    .line 63
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;->hide:Z

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 71
    .line 72
    if-eqz v0, :cond_4

    .line 73
    .line 74
    const/4 v1, 0x7

    .line 75
    sget-object v2, Lcom/p1/mobile/putong/core/data/AwardStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 76
    .line 77
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    add-int/2addr p0, v0

    .line 82
    :cond_4
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 83
    .line 84
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 85
    check-cast p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ComStatusAward$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ComStatusAward;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ComStatusAward;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ComStatusAward;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const-string v3, ""

    .line 13
    .line 14
    if-eqz v2, :cond_b

    .line 15
    .line 16
    const/16 v4, 0xa

    .line 17
    .line 18
    if-eq v2, v4, :cond_a

    .line 19
    .line 20
    const/16 v4, 0x10

    .line 21
    .line 22
    if-eq v2, v4, :cond_9

    .line 23
    .line 24
    const/16 v4, 0x1a

    .line 25
    .line 26
    if-eq v2, v4, :cond_8

    .line 27
    .line 28
    const/16 v4, 0x20

    .line 29
    .line 30
    if-eq v2, v4, :cond_7

    .line 31
    .line 32
    const/16 v4, 0x2a

    .line 33
    .line 34
    if-eq v2, v4, :cond_6

    .line 35
    .line 36
    const/16 v4, 0x30

    .line 37
    .line 38
    if-eq v2, v4, :cond_5

    .line 39
    .line 40
    const/16 v4, 0x3a

    .line 41
    .line 42
    if-eq v2, v4, :cond_4

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 45
    .line 46
    if-nez p1, :cond_0

    .line 47
    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    sget-object p1, Lcom/p1/mobile/putong/core/data/AwardStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 61
    .line 62
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 63
    .line 64
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->businessName:Ljava/lang/String;

    .line 65
    .line 66
    if-nez p1, :cond_1

    .line 67
    .line 68
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->businessName:Ljava/lang/String;

    .line 69
    .line 70
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 71
    .line 72
    if-nez p1, :cond_2

    .line 73
    .line 74
    sget-object p1, Lcom/p1/mobile/putong/core/data/AwardStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    check-cast p1, Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 81
    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 83
    .line 84
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->awards:Ljava/util/List;

    .line 85
    .line 86
    if-nez p1, :cond_3

    .line 87
    .line 88
    new-instance p1, Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 91
    .line 92
    .line 93
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->awards:Ljava/util/List;

    .line 94
    .line 95
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->nextStatus:Lcom/p1/mobile/putong/core/data/NextStatus;

    .line 96
    .line 97
    if-nez p1, :cond_10

    .line 98
    .line 99
    invoke-static {}, Lcom/p1/mobile/putong/core/data/NextStatus;->new_()Lcom/p1/mobile/putong/core/data/NextStatus;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->nextStatus:Lcom/p1/mobile/putong/core/data/NextStatus;

    .line 104
    .line 105
    return-object p0

    .line 106
    :cond_4
    sget-object v2, Lcom/p1/mobile/putong/core/data/AwardStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 107
    .line 108
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    check-cast v2, Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 113
    .line 114
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->hide:Z

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_6
    sget-object v2, Lcom/p1/mobile/putong/core/data/NextStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 125
    .line 126
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    check-cast v2, Lcom/p1/mobile/putong/core/data/NextStatus;

    .line 131
    .line 132
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->nextStatus:Lcom/p1/mobile/putong/core/data/NextStatus;

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 136
    .line 137
    .line 138
    move-result-wide v2

    .line 139
    iput-wide v2, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->updateTime:J

    .line 140
    .line 141
    goto/16 :goto_0

    .line 142
    .line 143
    :cond_8
    sget-object v2, Lcom/p1/mobile/putong/core/data/AwardType;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 144
    .line 145
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    check-cast v2, Ljava/util/List;

    .line 154
    .line 155
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->awards:Ljava/util/List;

    .line 156
    .line 157
    goto/16 :goto_0

    .line 158
    .line 159
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->businessName:Ljava/lang/String;

    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 178
    .line 179
    if-nez p1, :cond_c

    .line 180
    .line 181
    if-eqz v1, :cond_c

    .line 182
    .line 183
    sget-object p1, Lcom/p1/mobile/putong/core/data/AwardStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 184
    .line 185
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    check-cast p1, Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 194
    .line 195
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 196
    .line 197
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->businessName:Ljava/lang/String;

    .line 198
    .line 199
    if-nez p1, :cond_d

    .line 200
    .line 201
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->businessName:Ljava/lang/String;

    .line 202
    .line 203
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 204
    .line 205
    if-nez p1, :cond_e

    .line 206
    .line 207
    sget-object p1, Lcom/p1/mobile/putong/core/data/AwardStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 208
    .line 209
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    check-cast p1, Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 214
    .line 215
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 216
    .line 217
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->awards:Ljava/util/List;

    .line 218
    .line 219
    if-nez p1, :cond_f

    .line 220
    .line 221
    new-instance p1, Ljava/util/ArrayList;

    .line 222
    .line 223
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 224
    .line 225
    .line 226
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->awards:Ljava/util/List;

    .line 227
    .line 228
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->nextStatus:Lcom/p1/mobile/putong/core/data/NextStatus;

    .line 229
    .line 230
    if-nez p1, :cond_10

    .line 231
    .line 232
    invoke-static {}, Lcom/p1/mobile/putong/core/data/NextStatus;->new_()Lcom/p1/mobile/putong/core/data/NextStatus;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->nextStatus:Lcom/p1/mobile/putong/core/data/NextStatus;

    .line 237
    .line 238
    :cond_10
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 239
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ComStatusAward$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ComStatusAward;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/ComStatusAward;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;->businessName:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;->awards:Ljava/util/List;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/data/AwardType;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v1, 0x3

    .line 32
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    const/4 p0, 0x4

    .line 36
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;->updateTime:J

    .line 37
    .line 38
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;->nextStatus:Lcom/p1/mobile/putong/core/data/NextStatus;

    .line 42
    .line 43
    if-eqz p0, :cond_3

    .line 44
    .line 45
    const/4 v0, 0x5

    .line 46
    sget-object v1, Lcom/p1/mobile/putong/core/data/NextStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 49
    .line 50
    .line 51
    :cond_3
    const/4 p0, 0x6

    .line 52
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;->hide:Z

    .line 53
    .line 54
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 58
    .line 59
    if-eqz p0, :cond_4

    .line 60
    .line 61
    const/4 p1, 0x7

    .line 62
    sget-object v0, Lcom/p1/mobile/putong/core/data/AwardStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 63
    .line 64
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 65
    .line 66
    .line 67
    :cond_4
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 68
    check-cast p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ComStatusAward$1;->serialize(Lcom/p1/mobile/putong/core/data/ComStatusAward;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
