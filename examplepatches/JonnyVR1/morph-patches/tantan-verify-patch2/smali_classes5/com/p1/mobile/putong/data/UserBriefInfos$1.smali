.class Lcom/p1/mobile/putong/data/UserBriefInfos$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/UserBriefInfos;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/UserBriefInfos;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/UserBriefInfos;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserBriefInfos;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserBriefInfos;->name:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserBriefInfos;->url:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserBriefInfos;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_3
    const/4 v0, 0x5

    .line 47
    iget v1, p1, Lcom/p1/mobile/putong/data/UserBriefInfos;->age:I

    .line 48
    .line 49
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    const/4 v0, 0x6

    .line 55
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/UserBriefInfos;->isVip:Z

    .line 56
    .line 57
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserBriefInfos;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 63
    .line 64
    if-eqz v0, :cond_4

    .line 65
    .line 66
    const/4 v1, 0x7

    .line 67
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int/2addr p0, v0

    .line 76
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserBriefInfos;->occupation:Ljava/lang/String;

    .line 77
    .line 78
    if-eqz v0, :cond_5

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
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserBriefInfos;->department:Ljava/util/Map;

    .line 88
    .line 89
    if-eqz v0, :cond_6

    .line 90
    .line 91
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 92
    .line 93
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    const/16 v2, 0x9

    .line 102
    .line 103
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    add-int/2addr p0, v0

    .line 108
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserBriefInfos;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 109
    .line 110
    if-eqz v0, :cond_7

    .line 111
    .line 112
    const/16 v1, 0xa

    .line 113
    .line 114
    sget-object v2, Lcom/p1/mobile/putong/data/Gender;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 115
    .line 116
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    add-int/2addr p0, v0

    .line 121
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserBriefInfos;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 122
    .line 123
    if-eqz v0, :cond_8

    .line 124
    .line 125
    const/16 v1, 0xb

    .line 126
    .line 127
    sget-object v2, Lcom/p1/mobile/putong/data/ProfileZodiac;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 128
    .line 129
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    add-int/2addr p0, v0

    .line 134
    :cond_8
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 135
    .line 136
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 137
    check-cast p1, Lcom/p1/mobile/putong/data/UserBriefInfos;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/UserBriefInfos$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/UserBriefInfos;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/UserBriefInfos;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/UserBriefInfos;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/UserBriefInfos;-><init>()V

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
    sparse-switch v3, :sswitch_data_0

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    sget-object p1, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/data/Gender;

    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 37
    .line 38
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 39
    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    sget-object p1, Lcom/p1/mobile/putong/data/ProfileZodiac;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->id:Ljava/lang/String;

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    iput-object v4, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->id:Ljava/lang/String;

    .line 63
    .line 64
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->name:Ljava/lang/String;

    .line 65
    .line 66
    if-nez p1, :cond_3

    .line 67
    .line 68
    iput-object v4, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->name:Ljava/lang/String;

    .line 69
    .line 70
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->url:Ljava/lang/String;

    .line 71
    .line 72
    if-nez p1, :cond_4

    .line 73
    .line 74
    iput-object v4, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->url:Ljava/lang/String;

    .line 75
    .line 76
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 77
    .line 78
    if-nez p1, :cond_5

    .line 79
    .line 80
    sget-object p1, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    check-cast p1, Lcom/p1/mobile/putong/data/Gender;

    .line 87
    .line 88
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 89
    .line 90
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 91
    .line 92
    if-nez p1, :cond_6

    .line 93
    .line 94
    sget-object p1, Lcom/p1/mobile/putong/data/ProfileZodiac;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 95
    .line 96
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    check-cast p1, Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 101
    .line 102
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 103
    .line 104
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->occupation:Ljava/lang/String;

    .line 105
    .line 106
    if-nez p1, :cond_7

    .line 107
    .line 108
    iput-object v4, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->occupation:Ljava/lang/String;

    .line 109
    .line 110
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->department:Ljava/util/Map;

    .line 111
    .line 112
    if-nez p1, :cond_10

    .line 113
    .line 114
    sget-object p1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 115
    .line 116
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->department:Ljava/util/Map;

    .line 117
    .line 118
    return-object p0

    .line 119
    :sswitch_0
    sget-object v3, Lcom/p1/mobile/putong/data/ProfileZodiac;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 120
    .line 121
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    check-cast v3, Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 126
    .line 127
    iput-object v3, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :sswitch_1
    sget-object v3, Lcom/p1/mobile/putong/data/Gender;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 131
    .line 132
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    check-cast v3, Lcom/p1/mobile/putong/data/Gender;

    .line 137
    .line 138
    iput-object v3, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_2
    sget-object v3, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 143
    .line 144
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 149
    .line 150
    .line 151
    move-result-object v3

    .line 152
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    check-cast v3, Ljava/util/Map;

    .line 157
    .line 158
    iput-object v3, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->department:Ljava/util/Map;

    .line 159
    .line 160
    goto/16 :goto_0

    .line 161
    .line 162
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    iput-object v3, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->occupation:Ljava/lang/String;

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 171
    .line 172
    .line 173
    move-result v2

    .line 174
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 181
    .line 182
    .line 183
    move-result v3

    .line 184
    iput-boolean v3, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->isVip:Z

    .line 185
    .line 186
    goto/16 :goto_0

    .line 187
    .line 188
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 189
    .line 190
    .line 191
    move-result v3

    .line 192
    iput v3, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->age:I

    .line 193
    .line 194
    goto/16 :goto_0

    .line 195
    .line 196
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 197
    .line 198
    .line 199
    move-result v1

    .line 200
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v3

    .line 210
    iput-object v3, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->url:Ljava/lang/String;

    .line 211
    .line 212
    goto/16 :goto_0

    .line 213
    .line 214
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v3

    .line 218
    iput-object v3, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->name:Ljava/lang/String;

    .line 219
    .line 220
    goto/16 :goto_0

    .line 221
    .line 222
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v3

    .line 226
    iput-object v3, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->id:Ljava/lang/String;

    .line 227
    .line 228
    goto/16 :goto_0

    .line 229
    .line 230
    :sswitch_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 231
    .line 232
    if-nez p1, :cond_8

    .line 233
    .line 234
    if-eqz v1, :cond_8

    .line 235
    .line 236
    sget-object p1, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 237
    .line 238
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 239
    .line 240
    .line 241
    move-result v1

    .line 242
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 243
    .line 244
    .line 245
    move-result-object p1

    .line 246
    check-cast p1, Lcom/p1/mobile/putong/data/Gender;

    .line 247
    .line 248
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 249
    .line 250
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 251
    .line 252
    if-nez p1, :cond_9

    .line 253
    .line 254
    if-eqz v2, :cond_9

    .line 255
    .line 256
    sget-object p1, Lcom/p1/mobile/putong/data/ProfileZodiac;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 257
    .line 258
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 259
    .line 260
    .line 261
    move-result v1

    .line 262
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    check-cast p1, Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 267
    .line 268
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 269
    .line 270
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->id:Ljava/lang/String;

    .line 271
    .line 272
    if-nez p1, :cond_a

    .line 273
    .line 274
    iput-object v4, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->id:Ljava/lang/String;

    .line 275
    .line 276
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->name:Ljava/lang/String;

    .line 277
    .line 278
    if-nez p1, :cond_b

    .line 279
    .line 280
    iput-object v4, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->name:Ljava/lang/String;

    .line 281
    .line 282
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->url:Ljava/lang/String;

    .line 283
    .line 284
    if-nez p1, :cond_c

    .line 285
    .line 286
    iput-object v4, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->url:Ljava/lang/String;

    .line 287
    .line 288
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 289
    .line 290
    if-nez p1, :cond_d

    .line 291
    .line 292
    sget-object p1, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 293
    .line 294
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 295
    .line 296
    .line 297
    move-result-object p1

    .line 298
    check-cast p1, Lcom/p1/mobile/putong/data/Gender;

    .line 299
    .line 300
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 301
    .line 302
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 303
    .line 304
    if-nez p1, :cond_e

    .line 305
    .line 306
    sget-object p1, Lcom/p1/mobile/putong/data/ProfileZodiac;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 307
    .line 308
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 309
    .line 310
    .line 311
    move-result-object p1

    .line 312
    check-cast p1, Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 313
    .line 314
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 315
    .line 316
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->occupation:Ljava/lang/String;

    .line 317
    .line 318
    if-nez p1, :cond_f

    .line 319
    .line 320
    iput-object v4, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->occupation:Ljava/lang/String;

    .line 321
    .line 322
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->department:Ljava/util/Map;

    .line 323
    .line 324
    if-nez p1, :cond_10

    .line 325
    .line 326
    sget-object p1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 327
    .line 328
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserBriefInfos;->department:Ljava/util/Map;

    .line 329
    .line 330
    :cond_10
    return-object p0

    .line 331
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_b
        0xa -> :sswitch_a
        0x12 -> :sswitch_9
        0x1a -> :sswitch_8
        0x20 -> :sswitch_7
        0x28 -> :sswitch_6
        0x30 -> :sswitch_5
        0x38 -> :sswitch_4
        0x42 -> :sswitch_3
        0x4a -> :sswitch_2
        0x52 -> :sswitch_1
        0x5a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 331
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/UserBriefInfos$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/UserBriefInfos;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/UserBriefInfos;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserBriefInfos;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserBriefInfos;->name:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserBriefInfos;->url:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserBriefInfos;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x4

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
    :cond_3
    const/4 p0, 0x5

    .line 38
    iget v0, p1, Lcom/p1/mobile/putong/data/UserBriefInfos;->age:I

    .line 39
    .line 40
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x6

    .line 44
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/UserBriefInfos;->isVip:Z

    .line 45
    .line 46
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserBriefInfos;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 50
    .line 51
    if-eqz p0, :cond_4

    .line 52
    .line 53
    const/4 v0, 0x7

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 59
    .line 60
    .line 61
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserBriefInfos;->occupation:Ljava/lang/String;

    .line 62
    .line 63
    if-eqz p0, :cond_5

    .line 64
    .line 65
    const/16 v0, 0x8

    .line 66
    .line 67
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserBriefInfos;->department:Ljava/util/Map;

    .line 71
    .line 72
    if-eqz p0, :cond_6

    .line 73
    .line 74
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    const/16 v1, 0x9

    .line 85
    .line 86
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 87
    .line 88
    .line 89
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserBriefInfos;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 90
    .line 91
    if-eqz p0, :cond_7

    .line 92
    .line 93
    const/16 v0, 0xa

    .line 94
    .line 95
    sget-object v1, Lcom/p1/mobile/putong/data/Gender;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 96
    .line 97
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 98
    .line 99
    .line 100
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserBriefInfos;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 101
    .line 102
    if-eqz p0, :cond_8

    .line 103
    .line 104
    const/16 p1, 0xb

    .line 105
    .line 106
    sget-object v0, Lcom/p1/mobile/putong/data/ProfileZodiac;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 107
    .line 108
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 109
    .line 110
    .line 111
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

    .line 112
    check-cast p1, Lcom/p1/mobile/putong/data/UserBriefInfos;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/UserBriefInfos$1;->serialize(Lcom/p1/mobile/putong/data/UserBriefInfos;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
