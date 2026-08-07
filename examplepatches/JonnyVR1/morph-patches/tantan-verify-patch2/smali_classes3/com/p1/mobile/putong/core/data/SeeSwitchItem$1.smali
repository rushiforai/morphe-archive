.class Lcom/p1/mobile/putong/core/data/SeeSwitchItem$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/SeeSwitchItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/SeeSwitchItem;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/SeeSwitchItem;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->see_switch_name:Lcom/p1/mobile/putong/core/data/SeeSwitchName;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->is_open_for_new_user:Ljava/lang/Boolean;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->open_time:Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x3

    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->see_switch_name:Lcom/p1/mobile/putong/core/data/SeeSwitchName;

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x4

    .line 49
    sget-object v2, Lcom/p1/mobile/putong/core/data/SeeSwitchName;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->open_time:Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;

    .line 57
    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    const/4 v1, 0x5

    .line 61
    sget-object v2, Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 62
    .line 63
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    :cond_4
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 69
    .line 70
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 71
    check-cast p1, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/SeeSwitchItem$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/SeeSwitchItem;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/SeeSwitchItem;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;-><init>()V

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
    if-eqz v3, :cond_9

    .line 14
    .line 15
    const/16 v4, 0x8

    .line 16
    .line 17
    if-eq v3, v4, :cond_8

    .line 18
    .line 19
    const/16 v4, 0x10

    .line 20
    .line 21
    if-eq v3, v4, :cond_7

    .line 22
    .line 23
    const/16 v4, 0x18

    .line 24
    .line 25
    if-eq v3, v4, :cond_6

    .line 26
    .line 27
    const/16 v4, 0x22

    .line 28
    .line 29
    if-eq v3, v4, :cond_5

    .line 30
    .line 31
    const/16 v4, 0x2a

    .line 32
    .line 33
    if-eq v3, v4, :cond_4

    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->see_switch_name:Lcom/p1/mobile/putong/core/data/SeeSwitchName;

    .line 36
    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    sget-object p1, Lcom/p1/mobile/putong/core/data/SeeSwitchName;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Lcom/p1/mobile/putong/core/data/SeeSwitchName;

    .line 52
    .line 53
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->see_switch_name:Lcom/p1/mobile/putong/core/data/SeeSwitchName;

    .line 54
    .line 55
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->open_time:Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;

    .line 56
    .line 57
    if-nez p1, :cond_1

    .line 58
    .line 59
    if-eqz v2, :cond_1

    .line 60
    .line 61
    sget-object p1, Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 62
    .line 63
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    check-cast p1, Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;

    .line 72
    .line 73
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->open_time:Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;

    .line 74
    .line 75
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->see_switch_name:Lcom/p1/mobile/putong/core/data/SeeSwitchName;

    .line 76
    .line 77
    if-nez p1, :cond_2

    .line 78
    .line 79
    sget-object p1, Lcom/p1/mobile/putong/core/data/SeeSwitchName;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    check-cast p1, Lcom/p1/mobile/putong/core/data/SeeSwitchName;

    .line 86
    .line 87
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->see_switch_name:Lcom/p1/mobile/putong/core/data/SeeSwitchName;

    .line 88
    .line 89
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->is_open_for_new_user:Ljava/lang/Boolean;

    .line 90
    .line 91
    if-nez p1, :cond_3

    .line 92
    .line 93
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 94
    .line 95
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->is_open_for_new_user:Ljava/lang/Boolean;

    .line 96
    .line 97
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->open_time:Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;

    .line 98
    .line 99
    if-nez p1, :cond_e

    .line 100
    .line 101
    sget-object p1, Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 102
    .line 103
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    check-cast p1, Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;

    .line 108
    .line 109
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->open_time:Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;

    .line 110
    .line 111
    return-object p0

    .line 112
    :cond_4
    sget-object v3, Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 113
    .line 114
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    check-cast v3, Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;

    .line 119
    .line 120
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->open_time:Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_5
    sget-object v3, Lcom/p1/mobile/putong/core/data/SeeSwitchName;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 124
    .line 125
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    check-cast v3, Lcom/p1/mobile/putong/core/data/SeeSwitchName;

    .line 130
    .line 131
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->see_switch_name:Lcom/p1/mobile/putong/core/data/SeeSwitchName;

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
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 149
    .line 150
    .line 151
    move-result-object v3

    .line 152
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->is_open_for_new_user:Ljava/lang/Boolean;

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->see_switch_name:Lcom/p1/mobile/putong/core/data/SeeSwitchName;

    .line 167
    .line 168
    if-nez p1, :cond_a

    .line 169
    .line 170
    if-eqz v1, :cond_a

    .line 171
    .line 172
    sget-object p1, Lcom/p1/mobile/putong/core/data/SeeSwitchName;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 173
    .line 174
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    check-cast p1, Lcom/p1/mobile/putong/core/data/SeeSwitchName;

    .line 183
    .line 184
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->see_switch_name:Lcom/p1/mobile/putong/core/data/SeeSwitchName;

    .line 185
    .line 186
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->open_time:Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;

    .line 187
    .line 188
    if-nez p1, :cond_b

    .line 189
    .line 190
    if-eqz v2, :cond_b

    .line 191
    .line 192
    sget-object p1, Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 193
    .line 194
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    check-cast p1, Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;

    .line 203
    .line 204
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->open_time:Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;

    .line 205
    .line 206
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->see_switch_name:Lcom/p1/mobile/putong/core/data/SeeSwitchName;

    .line 207
    .line 208
    if-nez p1, :cond_c

    .line 209
    .line 210
    sget-object p1, Lcom/p1/mobile/putong/core/data/SeeSwitchName;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 211
    .line 212
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    check-cast p1, Lcom/p1/mobile/putong/core/data/SeeSwitchName;

    .line 217
    .line 218
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->see_switch_name:Lcom/p1/mobile/putong/core/data/SeeSwitchName;

    .line 219
    .line 220
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->is_open_for_new_user:Ljava/lang/Boolean;

    .line 221
    .line 222
    if-nez p1, :cond_d

    .line 223
    .line 224
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 225
    .line 226
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->is_open_for_new_user:Ljava/lang/Boolean;

    .line 227
    .line 228
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->open_time:Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;

    .line 229
    .line 230
    if-nez p1, :cond_e

    .line 231
    .line 232
    sget-object p1, Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 233
    .line 234
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    check-cast p1, Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;

    .line 239
    .line 240
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->open_time:Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;

    .line 241
    .line 242
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

    .line 243
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/SeeSwitchItem$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/SeeSwitchItem;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/SeeSwitchItem;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->see_switch_name:Lcom/p1/mobile/putong/core/data/SeeSwitchName;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->is_open_for_new_user:Ljava/lang/Boolean;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->open_time:Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    const/4 v0, 0x3

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->see_switch_name:Lcom/p1/mobile/putong/core/data/SeeSwitchName;

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    const/4 v0, 0x4

    .line 42
    sget-object v1, Lcom/p1/mobile/putong/core/data/SeeSwitchName;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 43
    .line 44
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 45
    .line 46
    .line 47
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;->open_time:Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;

    .line 48
    .line 49
    if-eqz p0, :cond_4

    .line 50
    .line 51
    const/4 p1, 0x5

    .line 52
    sget-object v0, Lcom/p1/mobile/putong/core/data/SeeSwitchOpenType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 53
    .line 54
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 55
    .line 56
    .line 57
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

    .line 58
    check-cast p1, Lcom/p1/mobile/putong/core/data/SeeSwitchItem;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/SeeSwitchItem$1;->serialize(Lcom/p1/mobile/putong/core/data/SeeSwitchItem;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
