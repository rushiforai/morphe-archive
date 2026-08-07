.class Lcom/p1/mobile/putong/feed/data/MomentSettings$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/MomentSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/MomentSettings;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/MomentSettings;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentSettings;->visibility:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

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
    const/4 v0, 0x2

    .line 17
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/MomentSettings;->muted:Z

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentSettings;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/MomentVisibleState;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    const/4 v1, 0x3

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
    :cond_1
    const/4 v0, 0x4

    .line 39
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/MomentSettings;->anonymous:Z

    .line 40
    .line 41
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentSettings;->visibility:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 47
    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    const/4 v1, 0x5

    .line 51
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 52
    .line 53
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentSettings;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/MomentVisibleState;

    .line 59
    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    const/4 v1, 0x6

    .line 63
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MomentVisibleState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 64
    .line 65
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    :cond_3
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 71
    .line 72
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 73
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentSettings;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/MomentSettings$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/MomentSettings;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/MomentSettings;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/MomentSettings;-><init>()V

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
    const/16 v4, 0x20

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
    const/16 v4, 0x32

    .line 36
    .line 37
    if-eq v3, v4, :cond_3

    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->visibility:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 40
    .line 41
    if-nez p1, :cond_0

    .line 42
    .line 43
    if-eqz v1, :cond_0

    .line 44
    .line 45
    sget-object p1, Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 56
    .line 57
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->visibility:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 58
    .line 59
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/MomentVisibleState;

    .line 60
    .line 61
    if-nez p1, :cond_1

    .line 62
    .line 63
    if-eqz v2, :cond_1

    .line 64
    .line 65
    sget-object p1, Lcom/p1/mobile/putong/feed/data/MomentVisibleState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 66
    .line 67
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentVisibleState;

    .line 76
    .line 77
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/MomentVisibleState;

    .line 78
    .line 79
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->visibility:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 80
    .line 81
    if-nez p1, :cond_2

    .line 82
    .line 83
    sget-object p1, Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 84
    .line 85
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 90
    .line 91
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->visibility:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 92
    .line 93
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/MomentVisibleState;

    .line 94
    .line 95
    if-nez p1, :cond_d

    .line 96
    .line 97
    sget-object p1, Lcom/p1/mobile/putong/feed/data/MomentVisibleState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 98
    .line 99
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentVisibleState;

    .line 104
    .line 105
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/MomentVisibleState;

    .line 106
    .line 107
    return-object p0

    .line 108
    :cond_3
    sget-object v3, Lcom/p1/mobile/putong/feed/data/MomentVisibleState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 109
    .line 110
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    check-cast v3, Lcom/p1/mobile/putong/feed/data/MomentVisibleState;

    .line 115
    .line 116
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/MomentVisibleState;

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_4
    sget-object v3, Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 120
    .line 121
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    check-cast v3, Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 126
    .line 127
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->visibility:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 131
    .line 132
    .line 133
    move-result v3

    .line 134
    iput-boolean v3, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->anonymous:Z

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    goto/16 :goto_0

    .line 146
    .line 147
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 148
    .line 149
    .line 150
    move-result v3

    .line 151
    iput-boolean v3, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->muted:Z

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->visibility:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 166
    .line 167
    if-nez p1, :cond_a

    .line 168
    .line 169
    if-eqz v1, :cond_a

    .line 170
    .line 171
    sget-object p1, Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 172
    .line 173
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 182
    .line 183
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->visibility:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 184
    .line 185
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/MomentVisibleState;

    .line 186
    .line 187
    if-nez p1, :cond_b

    .line 188
    .line 189
    if-eqz v2, :cond_b

    .line 190
    .line 191
    sget-object p1, Lcom/p1/mobile/putong/feed/data/MomentVisibleState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 192
    .line 193
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentVisibleState;

    .line 202
    .line 203
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/MomentVisibleState;

    .line 204
    .line 205
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->visibility:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 206
    .line 207
    if-nez p1, :cond_c

    .line 208
    .line 209
    sget-object p1, Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 210
    .line 211
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 216
    .line 217
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->visibility:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 218
    .line 219
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/MomentVisibleState;

    .line 220
    .line 221
    if-nez p1, :cond_d

    .line 222
    .line 223
    sget-object p1, Lcom/p1/mobile/putong/feed/data/MomentVisibleState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 224
    .line 225
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentVisibleState;

    .line 230
    .line 231
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/MomentVisibleState;

    .line 232
    .line 233
    :cond_d
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 234
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/MomentSettings$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/MomentSettings;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/MomentSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentSettings;->visibility:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

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
    const/4 p0, 0x2

    .line 14
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentSettings;->muted:Z

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentSettings;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/MomentVisibleState;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    const/4 v0, 0x3

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
    :cond_1
    const/4 p0, 0x4

    .line 32
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentSettings;->anonymous:Z

    .line 33
    .line 34
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentSettings;->visibility:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 38
    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    const/4 v0, 0x5

    .line 42
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 43
    .line 44
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentSettings;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/MomentVisibleState;

    .line 48
    .line 49
    if-eqz p0, :cond_3

    .line 50
    .line 51
    const/4 p1, 0x6

    .line 52
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentVisibleState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 53
    .line 54
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 55
    .line 56
    .line 57
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

    .line 58
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentSettings;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/MomentSettings$1;->serialize(Lcom/p1/mobile/putong/feed/data/MomentSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
