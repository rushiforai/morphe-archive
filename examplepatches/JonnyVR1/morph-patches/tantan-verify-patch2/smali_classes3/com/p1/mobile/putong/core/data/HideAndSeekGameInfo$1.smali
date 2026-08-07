.class Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameIcon:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameIdentity:Lcom/p1/mobile/putong/core/data/GameIdentity;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/core/data/GameIdentity;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameTitle:Ljava/lang/String;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const/4 v1, 0x3

    .line 29
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameDesc:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    const/4 v1, 0x4

    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameTime:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v0, :cond_4

    .line 47
    .line 48
    const/4 v1, 0x5

    .line 49
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameAddress:Ljava/lang/String;

    .line 55
    .line 56
    if-eqz v0, :cond_5

    .line 57
    .line 58
    const/4 v1, 0x6

    .line 59
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameStage:Lcom/p1/mobile/putong/core/data/GameStage;

    .line 65
    .line 66
    if-eqz v0, :cond_6

    .line 67
    .line 68
    const/4 v1, 0x7

    .line 69
    sget-object v2, Lcom/p1/mobile/putong/core/data/GameStage;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerState:Lcom/p1/mobile/putong/core/data/GamePlayerState;

    .line 77
    .line 78
    if-eqz v0, :cond_7

    .line 79
    .line 80
    const/16 v1, 0x8

    .line 81
    .line 82
    sget-object v2, Lcom/p1/mobile/putong/core/data/GamePlayerState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 83
    .line 84
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    add-int/2addr p0, v0

    .line 89
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerIcons:Ljava/util/List;

    .line 90
    .line 91
    if-eqz v0, :cond_8

    .line 92
    .line 93
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 94
    .line 95
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    const/16 v2, 0x9

    .line 100
    .line 101
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    add-int/2addr p0, v0

    .line 106
    :cond_8
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 107
    .line 108
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 109
    check-cast p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameIcon:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameIcon:Ljava/lang/String;

    .line 55
    .line 56
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameIdentity:Lcom/p1/mobile/putong/core/data/GameIdentity;

    .line 57
    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    sget-object p1, Lcom/p1/mobile/putong/core/data/GameIdentity;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Lcom/p1/mobile/putong/core/data/GameIdentity;

    .line 67
    .line 68
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameIdentity:Lcom/p1/mobile/putong/core/data/GameIdentity;

    .line 69
    .line 70
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameTitle:Ljava/lang/String;

    .line 71
    .line 72
    if-nez p1, :cond_2

    .line 73
    .line 74
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameTitle:Ljava/lang/String;

    .line 75
    .line 76
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameDesc:Ljava/lang/String;

    .line 77
    .line 78
    if-nez p1, :cond_3

    .line 79
    .line 80
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameDesc:Ljava/lang/String;

    .line 81
    .line 82
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameTime:Ljava/lang/String;

    .line 83
    .line 84
    if-nez p1, :cond_4

    .line 85
    .line 86
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameTime:Ljava/lang/String;

    .line 87
    .line 88
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameAddress:Ljava/lang/String;

    .line 89
    .line 90
    if-nez p1, :cond_5

    .line 91
    .line 92
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameAddress:Ljava/lang/String;

    .line 93
    .line 94
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameStage:Lcom/p1/mobile/putong/core/data/GameStage;

    .line 95
    .line 96
    if-nez p1, :cond_6

    .line 97
    .line 98
    sget-object p1, Lcom/p1/mobile/putong/core/data/GameStage;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    check-cast p1, Lcom/p1/mobile/putong/core/data/GameStage;

    .line 105
    .line 106
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameStage:Lcom/p1/mobile/putong/core/data/GameStage;

    .line 107
    .line 108
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerState:Lcom/p1/mobile/putong/core/data/GamePlayerState;

    .line 109
    .line 110
    if-nez p1, :cond_7

    .line 111
    .line 112
    sget-object p1, Lcom/p1/mobile/putong/core/data/GamePlayerState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 113
    .line 114
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    check-cast p1, Lcom/p1/mobile/putong/core/data/GamePlayerState;

    .line 119
    .line 120
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerState:Lcom/p1/mobile/putong/core/data/GamePlayerState;

    .line 121
    .line 122
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerIcons:Ljava/util/List;

    .line 123
    .line 124
    if-nez p1, :cond_1a

    .line 125
    .line 126
    new-instance p1, Ljava/util/ArrayList;

    .line 127
    .line 128
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 129
    .line 130
    .line 131
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerIcons:Ljava/util/List;

    .line 132
    .line 133
    return-object p0

    .line 134
    :cond_8
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 135
    .line 136
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    check-cast v0, Ljava/util/List;

    .line 145
    .line 146
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerIcons:Ljava/util/List;

    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :cond_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/GamePlayerState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 151
    .line 152
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    check-cast v0, Lcom/p1/mobile/putong/core/data/GamePlayerState;

    .line 157
    .line 158
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerState:Lcom/p1/mobile/putong/core/data/GamePlayerState;

    .line 159
    .line 160
    goto/16 :goto_0

    .line 161
    .line 162
    :cond_a
    sget-object v0, Lcom/p1/mobile/putong/core/data/GameStage;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 163
    .line 164
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    check-cast v0, Lcom/p1/mobile/putong/core/data/GameStage;

    .line 169
    .line 170
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameStage:Lcom/p1/mobile/putong/core/data/GameStage;

    .line 171
    .line 172
    goto/16 :goto_0

    .line 173
    .line 174
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameAddress:Ljava/lang/String;

    .line 179
    .line 180
    goto/16 :goto_0

    .line 181
    .line 182
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameTime:Ljava/lang/String;

    .line 187
    .line 188
    goto/16 :goto_0

    .line 189
    .line 190
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameDesc:Ljava/lang/String;

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :cond_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameTitle:Ljava/lang/String;

    .line 203
    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :cond_f
    sget-object v0, Lcom/p1/mobile/putong/core/data/GameIdentity;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 207
    .line 208
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    check-cast v0, Lcom/p1/mobile/putong/core/data/GameIdentity;

    .line 213
    .line 214
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameIdentity:Lcom/p1/mobile/putong/core/data/GameIdentity;

    .line 215
    .line 216
    goto/16 :goto_0

    .line 217
    .line 218
    :cond_10
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameIcon:Ljava/lang/String;

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameIcon:Ljava/lang/String;

    .line 227
    .line 228
    if-nez p1, :cond_12

    .line 229
    .line 230
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameIcon:Ljava/lang/String;

    .line 231
    .line 232
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameIdentity:Lcom/p1/mobile/putong/core/data/GameIdentity;

    .line 233
    .line 234
    if-nez p1, :cond_13

    .line 235
    .line 236
    sget-object p1, Lcom/p1/mobile/putong/core/data/GameIdentity;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 237
    .line 238
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    check-cast p1, Lcom/p1/mobile/putong/core/data/GameIdentity;

    .line 243
    .line 244
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameIdentity:Lcom/p1/mobile/putong/core/data/GameIdentity;

    .line 245
    .line 246
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameTitle:Ljava/lang/String;

    .line 247
    .line 248
    if-nez p1, :cond_14

    .line 249
    .line 250
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameTitle:Ljava/lang/String;

    .line 251
    .line 252
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameDesc:Ljava/lang/String;

    .line 253
    .line 254
    if-nez p1, :cond_15

    .line 255
    .line 256
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameDesc:Ljava/lang/String;

    .line 257
    .line 258
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameTime:Ljava/lang/String;

    .line 259
    .line 260
    if-nez p1, :cond_16

    .line 261
    .line 262
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameTime:Ljava/lang/String;

    .line 263
    .line 264
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameAddress:Ljava/lang/String;

    .line 265
    .line 266
    if-nez p1, :cond_17

    .line 267
    .line 268
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameAddress:Ljava/lang/String;

    .line 269
    .line 270
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameStage:Lcom/p1/mobile/putong/core/data/GameStage;

    .line 271
    .line 272
    if-nez p1, :cond_18

    .line 273
    .line 274
    sget-object p1, Lcom/p1/mobile/putong/core/data/GameStage;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 275
    .line 276
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 277
    .line 278
    .line 279
    move-result-object p1

    .line 280
    check-cast p1, Lcom/p1/mobile/putong/core/data/GameStage;

    .line 281
    .line 282
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameStage:Lcom/p1/mobile/putong/core/data/GameStage;

    .line 283
    .line 284
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerState:Lcom/p1/mobile/putong/core/data/GamePlayerState;

    .line 285
    .line 286
    if-nez p1, :cond_19

    .line 287
    .line 288
    sget-object p1, Lcom/p1/mobile/putong/core/data/GamePlayerState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 289
    .line 290
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 291
    .line 292
    .line 293
    move-result-object p1

    .line 294
    check-cast p1, Lcom/p1/mobile/putong/core/data/GamePlayerState;

    .line 295
    .line 296
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerState:Lcom/p1/mobile/putong/core/data/GamePlayerState;

    .line 297
    .line 298
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerIcons:Ljava/util/List;

    .line 299
    .line 300
    if-nez p1, :cond_1a

    .line 301
    .line 302
    new-instance p1, Ljava/util/ArrayList;

    .line 303
    .line 304
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 305
    .line 306
    .line 307
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerIcons:Ljava/util/List;

    .line 308
    .line 309
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

    .line 310
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameIcon:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameIdentity:Lcom/p1/mobile/putong/core/data/GameIdentity;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/data/GameIdentity;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameTitle:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameDesc:Ljava/lang/String;

    .line 28
    .line 29
    if-eqz p0, :cond_3

    .line 30
    .line 31
    const/4 v0, 0x4

    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameTime:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p0, :cond_4

    .line 38
    .line 39
    const/4 v0, 0x5

    .line 40
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameAddress:Ljava/lang/String;

    .line 44
    .line 45
    if-eqz p0, :cond_5

    .line 46
    .line 47
    const/4 v0, 0x6

    .line 48
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gameStage:Lcom/p1/mobile/putong/core/data/GameStage;

    .line 52
    .line 53
    if-eqz p0, :cond_6

    .line 54
    .line 55
    const/4 v0, 0x7

    .line 56
    sget-object v1, Lcom/p1/mobile/putong/core/data/GameStage;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 57
    .line 58
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 59
    .line 60
    .line 61
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerState:Lcom/p1/mobile/putong/core/data/GamePlayerState;

    .line 62
    .line 63
    if-eqz p0, :cond_7

    .line 64
    .line 65
    const/16 v0, 0x8

    .line 66
    .line 67
    sget-object v1, Lcom/p1/mobile/putong/core/data/GamePlayerState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 68
    .line 69
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 70
    .line 71
    .line 72
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;->gamePlayerIcons:Ljava/util/List;

    .line 73
    .line 74
    if-eqz p0, :cond_8

    .line 75
    .line 76
    sget-object p1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    const/16 v0, 0x9

    .line 83
    .line 84
    invoke-virtual {p2, v0, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 85
    .line 86
    .line 87
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

    .line 88
    check-cast p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo$1;->serialize(Lcom/p1/mobile/putong/core/data/HideAndSeekGameInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
