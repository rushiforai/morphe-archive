.class Lcom/p1/mobile/putong/core/data/QuickChatCardInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->userID:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->secretKey:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->rsState:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    sget-object v2, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 28
    .line 29
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->biz:Lcom/p1/mobile/putong/core/data/QuickChatType;

    .line 35
    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    const/4 v1, 0x4

    .line 39
    sget-object v2, Lcom/p1/mobile/putong/core/data/QuickChatType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 40
    .line 41
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->stage:Ljava/lang/String;

    .line 47
    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    const/4 v1, 0x5

    .line 51
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->fitReason:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->friendPurpose:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->zodiacFitPercent:Ljava/lang/String;

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
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 88
    .line 89
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 90
    check-cast p1, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;-><init>()V

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
    const/16 v2, 0x2a

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
    const/16 v2, 0x3a

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->userID:Ljava/lang/String;

    .line 47
    .line 48
    if-nez p1, :cond_0

    .line 49
    .line 50
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->userID:Ljava/lang/String;

    .line 51
    .line 52
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->secretKey:Ljava/lang/String;

    .line 53
    .line 54
    if-nez p1, :cond_1

    .line 55
    .line 56
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->secretKey:Ljava/lang/String;

    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->rsState:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 69
    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->rsState:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 71
    .line 72
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->biz:Lcom/p1/mobile/putong/core/data/QuickChatType;

    .line 73
    .line 74
    if-nez p1, :cond_3

    .line 75
    .line 76
    sget-object p1, Lcom/p1/mobile/putong/core/data/QuickChatType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    check-cast p1, Lcom/p1/mobile/putong/core/data/QuickChatType;

    .line 83
    .line 84
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->biz:Lcom/p1/mobile/putong/core/data/QuickChatType;

    .line 85
    .line 86
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->stage:Ljava/lang/String;

    .line 87
    .line 88
    if-nez p1, :cond_4

    .line 89
    .line 90
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->stage:Ljava/lang/String;

    .line 91
    .line 92
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->fitReason:Ljava/lang/String;

    .line 93
    .line 94
    if-nez p1, :cond_5

    .line 95
    .line 96
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->fitReason:Ljava/lang/String;

    .line 97
    .line 98
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->friendPurpose:Ljava/lang/String;

    .line 99
    .line 100
    if-nez p1, :cond_6

    .line 101
    .line 102
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->friendPurpose:Ljava/lang/String;

    .line 103
    .line 104
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->zodiacFitPercent:Ljava/lang/String;

    .line 105
    .line 106
    if-nez p1, :cond_17

    .line 107
    .line 108
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->zodiacFitPercent:Ljava/lang/String;

    .line 109
    .line 110
    return-object p0

    .line 111
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->zodiacFitPercent:Ljava/lang/String;

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->friendPurpose:Ljava/lang/String;

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->fitReason:Ljava/lang/String;

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->stage:Ljava/lang/String;

    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :cond_b
    sget-object v0, Lcom/p1/mobile/putong/core/data/QuickChatType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 141
    .line 142
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    check-cast v0, Lcom/p1/mobile/putong/core/data/QuickChatType;

    .line 147
    .line 148
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->biz:Lcom/p1/mobile/putong/core/data/QuickChatType;

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :cond_c
    sget-object v0, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 153
    .line 154
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    check-cast v0, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 159
    .line 160
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->rsState:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 161
    .line 162
    goto/16 :goto_0

    .line 163
    .line 164
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->secretKey:Ljava/lang/String;

    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :cond_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->userID:Ljava/lang/String;

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->userID:Ljava/lang/String;

    .line 181
    .line 182
    if-nez p1, :cond_10

    .line 183
    .line 184
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->userID:Ljava/lang/String;

    .line 185
    .line 186
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->secretKey:Ljava/lang/String;

    .line 187
    .line 188
    if-nez p1, :cond_11

    .line 189
    .line 190
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->secretKey:Ljava/lang/String;

    .line 191
    .line 192
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->rsState:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 193
    .line 194
    if-nez p1, :cond_12

    .line 195
    .line 196
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 197
    .line 198
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 203
    .line 204
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->rsState:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 205
    .line 206
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->biz:Lcom/p1/mobile/putong/core/data/QuickChatType;

    .line 207
    .line 208
    if-nez p1, :cond_13

    .line 209
    .line 210
    sget-object p1, Lcom/p1/mobile/putong/core/data/QuickChatType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 211
    .line 212
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    check-cast p1, Lcom/p1/mobile/putong/core/data/QuickChatType;

    .line 217
    .line 218
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->biz:Lcom/p1/mobile/putong/core/data/QuickChatType;

    .line 219
    .line 220
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->stage:Ljava/lang/String;

    .line 221
    .line 222
    if-nez p1, :cond_14

    .line 223
    .line 224
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->stage:Ljava/lang/String;

    .line 225
    .line 226
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->fitReason:Ljava/lang/String;

    .line 227
    .line 228
    if-nez p1, :cond_15

    .line 229
    .line 230
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->fitReason:Ljava/lang/String;

    .line 231
    .line 232
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->friendPurpose:Ljava/lang/String;

    .line 233
    .line 234
    if-nez p1, :cond_16

    .line 235
    .line 236
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->friendPurpose:Ljava/lang/String;

    .line 237
    .line 238
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->zodiacFitPercent:Ljava/lang/String;

    .line 239
    .line 240
    if-nez p1, :cond_17

    .line 241
    .line 242
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->zodiacFitPercent:Ljava/lang/String;

    .line 243
    .line 244
    :cond_17
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 245
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->userID:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->secretKey:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->rsState:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 23
    .line 24
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 25
    .line 26
    .line 27
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->biz:Lcom/p1/mobile/putong/core/data/QuickChatType;

    .line 28
    .line 29
    if-eqz p0, :cond_3

    .line 30
    .line 31
    const/4 v0, 0x4

    .line 32
    sget-object v1, Lcom/p1/mobile/putong/core/data/QuickChatType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 33
    .line 34
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->stage:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    const/4 v0, 0x5

    .line 42
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->fitReason:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->friendPurpose:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->zodiacFitPercent:Ljava/lang/String;

    .line 62
    .line 63
    if-eqz p0, :cond_7

    .line 64
    .line 65
    const/16 p1, 0x8

    .line 66
    .line 67
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_7
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 71
    check-cast p1, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo$1;->serialize(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
