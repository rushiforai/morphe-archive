.class Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->distance:I

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->minAge:I

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    const/4 v0, 0x3

    .line 17
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->maxAge:I

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/LikedUserFilter;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    const/4 v1, 0x4

    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/LikeFilterSortType;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    const/4 v1, 0x5

    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/LikedUserFilter;

    .line 53
    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    const/4 v1, 0x6

    .line 57
    sget-object v2, Lcom/p1/mobile/putong/core/data/LikedUserFilter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/LikeFilterSortType;

    .line 65
    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    const/4 v1, 0x7

    .line 69
    sget-object v2, Lcom/p1/mobile/putong/core/data/LikeFilterSortType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 70
    .line 71
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int/2addr p0, v0

    .line 76
    :cond_3
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 77
    .line 78
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 79
    check-cast p1, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;-><init>()V

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
    if-eqz v3, :cond_a

    .line 14
    .line 15
    const/16 v4, 0x8

    .line 16
    .line 17
    if-eq v3, v4, :cond_9

    .line 18
    .line 19
    const/16 v4, 0x10

    .line 20
    .line 21
    if-eq v3, v4, :cond_8

    .line 22
    .line 23
    const/16 v4, 0x18

    .line 24
    .line 25
    if-eq v3, v4, :cond_7

    .line 26
    .line 27
    const/16 v4, 0x20

    .line 28
    .line 29
    if-eq v3, v4, :cond_6

    .line 30
    .line 31
    const/16 v4, 0x28

    .line 32
    .line 33
    if-eq v3, v4, :cond_5

    .line 34
    .line 35
    const/16 v4, 0x32

    .line 36
    .line 37
    if-eq v3, v4, :cond_4

    .line 38
    .line 39
    const/16 v4, 0x3a

    .line 40
    .line 41
    if-eq v3, v4, :cond_3

    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/LikedUserFilter;

    .line 44
    .line 45
    if-nez p1, :cond_0

    .line 46
    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    sget-object p1, Lcom/p1/mobile/putong/core/data/LikedUserFilter;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Lcom/p1/mobile/putong/core/data/LikedUserFilter;

    .line 60
    .line 61
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/LikedUserFilter;

    .line 62
    .line 63
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/LikeFilterSortType;

    .line 64
    .line 65
    if-nez p1, :cond_1

    .line 66
    .line 67
    if-eqz v2, :cond_1

    .line 68
    .line 69
    sget-object p1, Lcom/p1/mobile/putong/core/data/LikeFilterSortType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 70
    .line 71
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    check-cast p1, Lcom/p1/mobile/putong/core/data/LikeFilterSortType;

    .line 80
    .line 81
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/LikeFilterSortType;

    .line 82
    .line 83
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/LikedUserFilter;

    .line 84
    .line 85
    if-nez p1, :cond_2

    .line 86
    .line 87
    sget-object p1, Lcom/p1/mobile/putong/core/data/LikedUserFilter;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    check-cast p1, Lcom/p1/mobile/putong/core/data/LikedUserFilter;

    .line 94
    .line 95
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/LikedUserFilter;

    .line 96
    .line 97
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/LikeFilterSortType;

    .line 98
    .line 99
    if-nez p1, :cond_e

    .line 100
    .line 101
    sget-object p1, Lcom/p1/mobile/putong/core/data/LikeFilterSortType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 102
    .line 103
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    check-cast p1, Lcom/p1/mobile/putong/core/data/LikeFilterSortType;

    .line 108
    .line 109
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/LikeFilterSortType;

    .line 110
    .line 111
    return-object p0

    .line 112
    :cond_3
    sget-object v3, Lcom/p1/mobile/putong/core/data/LikeFilterSortType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 113
    .line 114
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    check-cast v3, Lcom/p1/mobile/putong/core/data/LikeFilterSortType;

    .line 119
    .line 120
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/LikeFilterSortType;

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_4
    sget-object v3, Lcom/p1/mobile/putong/core/data/LikedUserFilter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 124
    .line 125
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    check-cast v3, Lcom/p1/mobile/putong/core/data/LikedUserFilter;

    .line 130
    .line 131
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/LikedUserFilter;

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_5
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
    :cond_6
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
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 155
    .line 156
    .line 157
    move-result v3

    .line 158
    iput v3, p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->maxAge:I

    .line 159
    .line 160
    goto/16 :goto_0

    .line 161
    .line 162
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    iput v3, p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->minAge:I

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 171
    .line 172
    .line 173
    move-result v3

    .line 174
    iput v3, p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->distance:I

    .line 175
    .line 176
    goto/16 :goto_0

    .line 177
    .line 178
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/LikedUserFilter;

    .line 179
    .line 180
    if-nez p1, :cond_b

    .line 181
    .line 182
    if-eqz v1, :cond_b

    .line 183
    .line 184
    sget-object p1, Lcom/p1/mobile/putong/core/data/LikedUserFilter;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 185
    .line 186
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 187
    .line 188
    .line 189
    move-result v1

    .line 190
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    check-cast p1, Lcom/p1/mobile/putong/core/data/LikedUserFilter;

    .line 195
    .line 196
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/LikedUserFilter;

    .line 197
    .line 198
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/LikeFilterSortType;

    .line 199
    .line 200
    if-nez p1, :cond_c

    .line 201
    .line 202
    if-eqz v2, :cond_c

    .line 203
    .line 204
    sget-object p1, Lcom/p1/mobile/putong/core/data/LikeFilterSortType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 205
    .line 206
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    check-cast p1, Lcom/p1/mobile/putong/core/data/LikeFilterSortType;

    .line 215
    .line 216
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/LikeFilterSortType;

    .line 217
    .line 218
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/LikedUserFilter;

    .line 219
    .line 220
    if-nez p1, :cond_d

    .line 221
    .line 222
    sget-object p1, Lcom/p1/mobile/putong/core/data/LikedUserFilter;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 223
    .line 224
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    check-cast p1, Lcom/p1/mobile/putong/core/data/LikedUserFilter;

    .line 229
    .line 230
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/LikedUserFilter;

    .line 231
    .line 232
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/LikeFilterSortType;

    .line 233
    .line 234
    if-nez p1, :cond_e

    .line 235
    .line 236
    sget-object p1, Lcom/p1/mobile/putong/core/data/LikeFilterSortType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 237
    .line 238
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    check-cast p1, Lcom/p1/mobile/putong/core/data/LikeFilterSortType;

    .line 243
    .line 244
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/LikeFilterSortType;

    .line 245
    .line 246
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

    .line 247
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->distance:I

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->minAge:I

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->maxAge:I

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/LikedUserFilter;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x4

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/LikeFilterSortType;

    .line 32
    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    const/4 v0, 0x5

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/LikedUserFilter;

    .line 44
    .line 45
    if-eqz p0, :cond_2

    .line 46
    .line 47
    const/4 v0, 0x6

    .line 48
    sget-object v1, Lcom/p1/mobile/putong/core/data/LikedUserFilter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 49
    .line 50
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 51
    .line 52
    .line 53
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/LikeFilterSortType;

    .line 54
    .line 55
    if-eqz p0, :cond_3

    .line 56
    .line 57
    const/4 p1, 0x7

    .line 58
    sget-object v0, Lcom/p1/mobile/putong/core/data/LikeFilterSortType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 59
    .line 60
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 61
    .line 62
    .line 63
    :cond_3
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 64
    check-cast p1, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings$1;->serialize(Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
