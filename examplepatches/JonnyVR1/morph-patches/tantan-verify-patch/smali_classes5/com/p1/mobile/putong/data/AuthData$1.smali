.class Lcom/p1/mobile/putong/data/AuthData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/AuthData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/AuthData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/AuthData;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AuthData;->tokenType:Ljava/lang/String;

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
    const/4 v0, 0x3

    .line 23
    iget v1, p1, Lcom/p1/mobile/putong/data/AuthData;->expiresIn:I

    .line 24
    .line 25
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AuthData;->userId:Ljava/lang/String;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x4

    .line 35
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    const/4 v1, 0x5

    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AuthData;->finishedStages:Ljava/util/List;

    .line 55
    .line 56
    if-eqz v0, :cond_4

    .line 57
    .line 58
    invoke-static {v0}, Lcom/p1/mobile/putong/data/StepSignupStage;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    const/4 v2, 0x6

    .line 69
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 75
    .line 76
    if-eqz v0, :cond_5

    .line 77
    .line 78
    const/4 v1, 0x7

    .line 79
    sget-object v2, Lcom/p1/mobile/putong/data/SignupStage;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 80
    .line 81
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    add-int/2addr p0, v0

    .line 86
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AuthData;->finishedStages:Ljava/util/List;

    .line 87
    .line 88
    if-eqz v0, :cond_6

    .line 89
    .line 90
    sget-object v1, Lcom/p1/mobile/putong/data/StepSignupStage;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 91
    .line 92
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    const/16 v2, 0x8

    .line 97
    .line 98
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    add-int/2addr p0, v0

    .line 103
    :cond_6
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 104
    .line 105
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 106
    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/AuthData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/AuthData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/AuthData;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/AuthData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/AuthData;-><init>()V

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
    if-eqz v3, :cond_e

    .line 16
    .line 17
    const/16 v5, 0xa

    .line 18
    .line 19
    if-eq v3, v5, :cond_d

    .line 20
    .line 21
    const/16 v5, 0x12

    .line 22
    .line 23
    if-eq v3, v5, :cond_c

    .line 24
    .line 25
    const/16 v5, 0x18

    .line 26
    .line 27
    if-eq v3, v5, :cond_b

    .line 28
    .line 29
    const/16 v5, 0x22

    .line 30
    .line 31
    if-eq v3, v5, :cond_a

    .line 32
    .line 33
    const/16 v5, 0x28

    .line 34
    .line 35
    if-eq v3, v5, :cond_9

    .line 36
    .line 37
    const/16 v5, 0x32

    .line 38
    .line 39
    if-eq v3, v5, :cond_8

    .line 40
    .line 41
    const/16 v5, 0x3a

    .line 42
    .line 43
    if-eq v3, v5, :cond_7

    .line 44
    .line 45
    const/16 v5, 0x42

    .line 46
    .line 47
    if-eq v3, v5, :cond_6

    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 50
    .line 51
    if-nez p1, :cond_0

    .line 52
    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    sget-object p1, Lcom/p1/mobile/putong/data/SignupStage;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Lcom/p1/mobile/putong/data/SignupStage;

    .line 66
    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 68
    .line 69
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->finishedStages:Ljava/util/List;

    .line 70
    .line 71
    if-nez p1, :cond_1

    .line 72
    .line 73
    if-eqz v2, :cond_1

    .line 74
    .line 75
    invoke-static {v2}, Lcom/p1/mobile/putong/data/StepSignupStage;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    iput-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->finishedStages:Ljava/util/List;

    .line 80
    .line 81
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 82
    .line 83
    if-nez p1, :cond_2

    .line 84
    .line 85
    iput-object v4, p0, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 86
    .line 87
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->tokenType:Ljava/lang/String;

    .line 88
    .line 89
    if-nez p1, :cond_3

    .line 90
    .line 91
    iput-object v4, p0, Lcom/p1/mobile/putong/data/AuthData;->tokenType:Ljava/lang/String;

    .line 92
    .line 93
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->userId:Ljava/lang/String;

    .line 94
    .line 95
    if-nez p1, :cond_4

    .line 96
    .line 97
    iput-object v4, p0, Lcom/p1/mobile/putong/data/AuthData;->userId:Ljava/lang/String;

    .line 98
    .line 99
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 100
    .line 101
    if-nez p1, :cond_5

    .line 102
    .line 103
    sget-object p1, Lcom/p1/mobile/putong/data/SignupStage;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 104
    .line 105
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    check-cast p1, Lcom/p1/mobile/putong/data/SignupStage;

    .line 110
    .line 111
    iput-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 112
    .line 113
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->finishedStages:Ljava/util/List;

    .line 114
    .line 115
    if-nez p1, :cond_15

    .line 116
    .line 117
    new-instance p1, Ljava/util/ArrayList;

    .line 118
    .line 119
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 120
    .line 121
    .line 122
    iput-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->finishedStages:Ljava/util/List;

    .line 123
    .line 124
    return-object p0

    .line 125
    :cond_6
    sget-object v3, Lcom/p1/mobile/putong/data/StepSignupStage;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 126
    .line 127
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    check-cast v3, Ljava/util/List;

    .line 136
    .line 137
    iput-object v3, p0, Lcom/p1/mobile/putong/data/AuthData;->finishedStages:Ljava/util/List;

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :cond_7
    sget-object v3, Lcom/p1/mobile/putong/data/SignupStage;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 142
    .line 143
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    check-cast v3, Lcom/p1/mobile/putong/data/SignupStage;

    .line 148
    .line 149
    iput-object v3, p0, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 150
    .line 151
    goto/16 :goto_0

    .line 152
    .line 153
    :cond_8
    sget-object v2, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 154
    .line 155
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    check-cast v2, Ljava/util/List;

    .line 164
    .line 165
    goto/16 :goto_0

    .line 166
    .line 167
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v3

    .line 181
    iput-object v3, p0, Lcom/p1/mobile/putong/data/AuthData;->userId:Ljava/lang/String;

    .line 182
    .line 183
    goto/16 :goto_0

    .line 184
    .line 185
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 186
    .line 187
    .line 188
    move-result v3

    .line 189
    iput v3, p0, Lcom/p1/mobile/putong/data/AuthData;->expiresIn:I

    .line 190
    .line 191
    goto/16 :goto_0

    .line 192
    .line 193
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    iput-object v3, p0, Lcom/p1/mobile/putong/data/AuthData;->tokenType:Ljava/lang/String;

    .line 198
    .line 199
    goto/16 :goto_0

    .line 200
    .line 201
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    iput-object v3, p0, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 206
    .line 207
    goto/16 :goto_0

    .line 208
    .line 209
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 210
    .line 211
    if-nez p1, :cond_f

    .line 212
    .line 213
    if-eqz v1, :cond_f

    .line 214
    .line 215
    sget-object p1, Lcom/p1/mobile/putong/data/SignupStage;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 216
    .line 217
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    check-cast p1, Lcom/p1/mobile/putong/data/SignupStage;

    .line 226
    .line 227
    iput-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 228
    .line 229
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->finishedStages:Ljava/util/List;

    .line 230
    .line 231
    if-nez p1, :cond_10

    .line 232
    .line 233
    if-eqz v2, :cond_10

    .line 234
    .line 235
    invoke-static {v2}, Lcom/p1/mobile/putong/data/StepSignupStage;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    iput-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->finishedStages:Ljava/util/List;

    .line 240
    .line 241
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 242
    .line 243
    if-nez p1, :cond_11

    .line 244
    .line 245
    iput-object v4, p0, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 246
    .line 247
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->tokenType:Ljava/lang/String;

    .line 248
    .line 249
    if-nez p1, :cond_12

    .line 250
    .line 251
    iput-object v4, p0, Lcom/p1/mobile/putong/data/AuthData;->tokenType:Ljava/lang/String;

    .line 252
    .line 253
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->userId:Ljava/lang/String;

    .line 254
    .line 255
    if-nez p1, :cond_13

    .line 256
    .line 257
    iput-object v4, p0, Lcom/p1/mobile/putong/data/AuthData;->userId:Ljava/lang/String;

    .line 258
    .line 259
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 260
    .line 261
    if-nez p1, :cond_14

    .line 262
    .line 263
    sget-object p1, Lcom/p1/mobile/putong/data/SignupStage;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 264
    .line 265
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    check-cast p1, Lcom/p1/mobile/putong/data/SignupStage;

    .line 270
    .line 271
    iput-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 272
    .line 273
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->finishedStages:Ljava/util/List;

    .line 274
    .line 275
    if-nez p1, :cond_15

    .line 276
    .line 277
    new-instance p1, Ljava/util/ArrayList;

    .line 278
    .line 279
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 280
    .line 281
    .line 282
    iput-object p1, p0, Lcom/p1/mobile/putong/data/AuthData;->finishedStages:Ljava/util/List;

    .line 283
    .line 284
    :cond_15
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 285
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/AuthData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/AuthData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/AuthData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AuthData;->tokenType:Ljava/lang/String;

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
    const/4 p0, 0x3

    .line 18
    iget v0, p1, Lcom/p1/mobile/putong/data/AuthData;->expiresIn:I

    .line 19
    .line 20
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AuthData;->userId:Ljava/lang/String;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x4

    .line 28
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 32
    .line 33
    if-eqz p0, :cond_3

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
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AuthData;->finishedStages:Ljava/util/List;

    .line 44
    .line 45
    if-eqz p0, :cond_4

    .line 46
    .line 47
    invoke-static {p0}, Lcom/p1/mobile/putong/data/StepSignupStage;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    sget-object v0, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const/4 v1, 0x6

    .line 58
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 59
    .line 60
    .line 61
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 62
    .line 63
    if-eqz p0, :cond_5

    .line 64
    .line 65
    const/4 v0, 0x7

    .line 66
    sget-object v1, Lcom/p1/mobile/putong/data/SignupStage;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 67
    .line 68
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 69
    .line 70
    .line 71
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AuthData;->finishedStages:Ljava/util/List;

    .line 72
    .line 73
    if-eqz p0, :cond_6

    .line 74
    .line 75
    sget-object p1, Lcom/p1/mobile/putong/data/StepSignupStage;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 76
    .line 77
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    const/16 v0, 0x8

    .line 82
    .line 83
    invoke-virtual {p2, v0, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 84
    .line 85
    .line 86
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

    .line 87
    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/AuthData$1;->serialize(Lcom/p1/mobile/putong/data/AuthData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
