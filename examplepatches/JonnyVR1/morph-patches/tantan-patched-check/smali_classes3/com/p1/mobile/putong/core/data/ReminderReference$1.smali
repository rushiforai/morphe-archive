.class Lcom/p1/mobile/putong/core/data/ReminderReference$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ReminderReference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/ReminderReference;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ReminderReference;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ReminderReference;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ReminderReference;->type:Lcom/p1/mobile/putong/core/data/ReminderSource;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ReminderReference;->action:Lcom/p1/mobile/putong/core/data/ReminderAction;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ReminderReference;->type:Lcom/p1/mobile/putong/core/data/ReminderSource;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    const/4 v1, 0x4

    .line 45
    sget-object v2, Lcom/p1/mobile/putong/core/data/ReminderSource;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 46
    .line 47
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ReminderReference;->action:Lcom/p1/mobile/putong/core/data/ReminderAction;

    .line 53
    .line 54
    if-eqz v0, :cond_4

    .line 55
    .line 56
    const/4 v1, 0x5

    .line 57
    sget-object v2, Lcom/p1/mobile/putong/core/data/ReminderAction;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 58
    .line 59
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    :cond_4
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 65
    .line 66
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 67
    check-cast p1, Lcom/p1/mobile/putong/core/data/ReminderReference;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ReminderReference$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ReminderReference;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ReminderReference;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ReminderReference;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ReminderReference;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    move-object v2, v1

    .line 9
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    const-string v4, ""

    .line 14
    .line 15
    if-eqz v3, :cond_9

    .line 16
    .line 17
    const/16 v5, 0xa

    .line 18
    .line 19
    if-eq v3, v5, :cond_8

    .line 20
    .line 21
    const/16 v5, 0x10

    .line 22
    .line 23
    if-eq v3, v5, :cond_7

    .line 24
    .line 25
    const/16 v5, 0x18

    .line 26
    .line 27
    if-eq v3, v5, :cond_6

    .line 28
    .line 29
    const/16 v5, 0x22

    .line 30
    .line 31
    if-eq v3, v5, :cond_5

    .line 32
    .line 33
    const/16 v5, 0x2a

    .line 34
    .line 35
    if-eq v3, v5, :cond_4

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->type:Lcom/p1/mobile/putong/core/data/ReminderSource;

    .line 38
    .line 39
    if-nez p1, :cond_0

    .line 40
    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    sget-object p1, Lcom/p1/mobile/putong/core/data/ReminderSource;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Lcom/p1/mobile/putong/core/data/ReminderSource;

    .line 54
    .line 55
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->type:Lcom/p1/mobile/putong/core/data/ReminderSource;

    .line 56
    .line 57
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->action:Lcom/p1/mobile/putong/core/data/ReminderAction;

    .line 58
    .line 59
    if-nez p1, :cond_1

    .line 60
    .line 61
    if-eqz v2, :cond_1

    .line 62
    .line 63
    sget-object p1, Lcom/p1/mobile/putong/core/data/ReminderAction;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 64
    .line 65
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    check-cast p1, Lcom/p1/mobile/putong/core/data/ReminderAction;

    .line 74
    .line 75
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->action:Lcom/p1/mobile/putong/core/data/ReminderAction;

    .line 76
    .line 77
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->id:Ljava/lang/String;

    .line 78
    .line 79
    if-nez p1, :cond_2

    .line 80
    .line 81
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->id:Ljava/lang/String;

    .line 82
    .line 83
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->type:Lcom/p1/mobile/putong/core/data/ReminderSource;

    .line 84
    .line 85
    if-nez p1, :cond_3

    .line 86
    .line 87
    sget-object p1, Lcom/p1/mobile/putong/core/data/ReminderSource;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    check-cast p1, Lcom/p1/mobile/putong/core/data/ReminderSource;

    .line 94
    .line 95
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->type:Lcom/p1/mobile/putong/core/data/ReminderSource;

    .line 96
    .line 97
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->action:Lcom/p1/mobile/putong/core/data/ReminderAction;

    .line 98
    .line 99
    if-nez p1, :cond_e

    .line 100
    .line 101
    sget-object p1, Lcom/p1/mobile/putong/core/data/ReminderAction;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 102
    .line 103
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    check-cast p1, Lcom/p1/mobile/putong/core/data/ReminderAction;

    .line 108
    .line 109
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->action:Lcom/p1/mobile/putong/core/data/ReminderAction;

    .line 110
    .line 111
    return-object p0

    .line 112
    :cond_4
    sget-object v3, Lcom/p1/mobile/putong/core/data/ReminderAction;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 113
    .line 114
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    check-cast v3, Lcom/p1/mobile/putong/core/data/ReminderAction;

    .line 119
    .line 120
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->action:Lcom/p1/mobile/putong/core/data/ReminderAction;

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_5
    sget-object v3, Lcom/p1/mobile/putong/core/data/ReminderSource;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 124
    .line 125
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    check-cast v3, Lcom/p1/mobile/putong/core/data/ReminderSource;

    .line 130
    .line 131
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->type:Lcom/p1/mobile/putong/core/data/ReminderSource;

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    goto/16 :goto_0

    .line 143
    .line 144
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->id:Ljava/lang/String;

    .line 159
    .line 160
    goto/16 :goto_0

    .line 161
    .line 162
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->type:Lcom/p1/mobile/putong/core/data/ReminderSource;

    .line 163
    .line 164
    if-nez p1, :cond_a

    .line 165
    .line 166
    if-eqz v1, :cond_a

    .line 167
    .line 168
    sget-object p1, Lcom/p1/mobile/putong/core/data/ReminderSource;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 169
    .line 170
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    check-cast p1, Lcom/p1/mobile/putong/core/data/ReminderSource;

    .line 179
    .line 180
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->type:Lcom/p1/mobile/putong/core/data/ReminderSource;

    .line 181
    .line 182
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->action:Lcom/p1/mobile/putong/core/data/ReminderAction;

    .line 183
    .line 184
    if-nez p1, :cond_b

    .line 185
    .line 186
    if-eqz v2, :cond_b

    .line 187
    .line 188
    sget-object p1, Lcom/p1/mobile/putong/core/data/ReminderAction;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 189
    .line 190
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    check-cast p1, Lcom/p1/mobile/putong/core/data/ReminderAction;

    .line 199
    .line 200
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->action:Lcom/p1/mobile/putong/core/data/ReminderAction;

    .line 201
    .line 202
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->id:Ljava/lang/String;

    .line 203
    .line 204
    if-nez p1, :cond_c

    .line 205
    .line 206
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->id:Ljava/lang/String;

    .line 207
    .line 208
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->type:Lcom/p1/mobile/putong/core/data/ReminderSource;

    .line 209
    .line 210
    if-nez p1, :cond_d

    .line 211
    .line 212
    sget-object p1, Lcom/p1/mobile/putong/core/data/ReminderSource;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 213
    .line 214
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    check-cast p1, Lcom/p1/mobile/putong/core/data/ReminderSource;

    .line 219
    .line 220
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->type:Lcom/p1/mobile/putong/core/data/ReminderSource;

    .line 221
    .line 222
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->action:Lcom/p1/mobile/putong/core/data/ReminderAction;

    .line 223
    .line 224
    if-nez p1, :cond_e

    .line 225
    .line 226
    sget-object p1, Lcom/p1/mobile/putong/core/data/ReminderAction;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 227
    .line 228
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    check-cast p1, Lcom/p1/mobile/putong/core/data/ReminderAction;

    .line 233
    .line 234
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ReminderReference;->action:Lcom/p1/mobile/putong/core/data/ReminderAction;

    .line 235
    .line 236
    :cond_e
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 237
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ReminderReference$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ReminderReference;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/ReminderReference;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ReminderReference;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ReminderReference;->type:Lcom/p1/mobile/putong/core/data/ReminderSource;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ReminderReference;->action:Lcom/p1/mobile/putong/core/data/ReminderAction;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ReminderReference;->type:Lcom/p1/mobile/putong/core/data/ReminderSource;

    .line 34
    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    const/4 v0, 0x4

    .line 38
    sget-object v1, Lcom/p1/mobile/putong/core/data/ReminderSource;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 39
    .line 40
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 41
    .line 42
    .line 43
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ReminderReference;->action:Lcom/p1/mobile/putong/core/data/ReminderAction;

    .line 44
    .line 45
    if-eqz p0, :cond_4

    .line 46
    .line 47
    const/4 p1, 0x5

    .line 48
    sget-object v0, Lcom/p1/mobile/putong/core/data/ReminderAction;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 49
    .line 50
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 51
    .line 52
    .line 53
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

    .line 54
    check-cast p1, Lcom/p1/mobile/putong/core/data/ReminderReference;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ReminderReference$1;->serialize(Lcom/p1/mobile/putong/core/data/ReminderReference;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
