.class Lcom/p1/mobile/putong/data/MiniWidgetData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/MiniWidgetData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/MiniWidgetData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/MiniWidgetData;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->type:Lcom/p1/mobile/putong/data/MiniWidgetDataType;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/MiniWidgetDataType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 7
    .line 8
    invoke-static {v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->leftTopText:Ljava/lang/String;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->backgroundImage:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->avatar:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->line1textNearAvatar:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->line2textNearAvatar:Ljava/lang/String;

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
    const/4 v0, 0x7

    .line 65
    iget v1, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->sustainSeconds:I

    .line 66
    .line 67
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->deeplink:Ljava/lang/String;

    .line 73
    .line 74
    if-eqz v0, :cond_6

    .line 75
    .line 76
    const/16 v1, 0x8

    .line 77
    .line 78
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    add-int/2addr p0, v0

    .line 83
    :cond_6
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 84
    .line 85
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 86
    check-cast p1, Lcom/p1/mobile/putong/data/MiniWidgetData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/MiniWidgetData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/MiniWidgetData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/MiniWidgetData;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/MiniWidgetData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/MiniWidgetData;-><init>()V

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
    if-eqz v0, :cond_e

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_d

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_c

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_b

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_a

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_9

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_8

    .line 37
    .line 38
    const/16 v2, 0x38

    .line 39
    .line 40
    if-eq v0, v2, :cond_7

    .line 41
    .line 42
    const/16 v2, 0x42

    .line 43
    .line 44
    if-eq v0, v2, :cond_6

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->type:Lcom/p1/mobile/putong/data/MiniWidgetDataType;

    .line 47
    .line 48
    if-nez p1, :cond_0

    .line 49
    .line 50
    sget-object p1, Lcom/p1/mobile/putong/data/MiniWidgetDataType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Lcom/p1/mobile/putong/data/MiniWidgetDataType;

    .line 57
    .line 58
    iput-object p1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->type:Lcom/p1/mobile/putong/data/MiniWidgetDataType;

    .line 59
    .line 60
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->leftTopText:Ljava/lang/String;

    .line 61
    .line 62
    if-nez p1, :cond_1

    .line 63
    .line 64
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->leftTopText:Ljava/lang/String;

    .line 65
    .line 66
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->backgroundImage:Ljava/lang/String;

    .line 67
    .line 68
    if-nez p1, :cond_2

    .line 69
    .line 70
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->backgroundImage:Ljava/lang/String;

    .line 71
    .line 72
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->avatar:Ljava/lang/String;

    .line 73
    .line 74
    if-nez p1, :cond_3

    .line 75
    .line 76
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->avatar:Ljava/lang/String;

    .line 77
    .line 78
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->line1textNearAvatar:Ljava/lang/String;

    .line 79
    .line 80
    if-nez p1, :cond_4

    .line 81
    .line 82
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->line1textNearAvatar:Ljava/lang/String;

    .line 83
    .line 84
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->line2textNearAvatar:Ljava/lang/String;

    .line 85
    .line 86
    if-nez p1, :cond_5

    .line 87
    .line 88
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->line2textNearAvatar:Ljava/lang/String;

    .line 89
    .line 90
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->deeplink:Ljava/lang/String;

    .line 91
    .line 92
    if-nez p1, :cond_15

    .line 93
    .line 94
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->deeplink:Ljava/lang/String;

    .line 95
    .line 96
    return-object p0

    .line 97
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iput-object v0, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->deeplink:Ljava/lang/String;

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    iput v0, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->sustainSeconds:I

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iput-object v0, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->line2textNearAvatar:Ljava/lang/String;

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iput-object v0, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->line1textNearAvatar:Ljava/lang/String;

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iput-object v0, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->avatar:Ljava/lang/String;

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iput-object v0, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->backgroundImage:Ljava/lang/String;

    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    iput-object v0, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->leftTopText:Ljava/lang/String;

    .line 145
    .line 146
    goto/16 :goto_0

    .line 147
    .line 148
    :cond_d
    sget-object v0, Lcom/p1/mobile/putong/data/MiniWidgetDataType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 149
    .line 150
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    check-cast v0, Lcom/p1/mobile/putong/data/MiniWidgetDataType;

    .line 155
    .line 156
    iput-object v0, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->type:Lcom/p1/mobile/putong/data/MiniWidgetDataType;

    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->type:Lcom/p1/mobile/putong/data/MiniWidgetDataType;

    .line 161
    .line 162
    if-nez p1, :cond_f

    .line 163
    .line 164
    sget-object p1, Lcom/p1/mobile/putong/data/MiniWidgetDataType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 165
    .line 166
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    check-cast p1, Lcom/p1/mobile/putong/data/MiniWidgetDataType;

    .line 171
    .line 172
    iput-object p1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->type:Lcom/p1/mobile/putong/data/MiniWidgetDataType;

    .line 173
    .line 174
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->leftTopText:Ljava/lang/String;

    .line 175
    .line 176
    if-nez p1, :cond_10

    .line 177
    .line 178
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->leftTopText:Ljava/lang/String;

    .line 179
    .line 180
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->backgroundImage:Ljava/lang/String;

    .line 181
    .line 182
    if-nez p1, :cond_11

    .line 183
    .line 184
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->backgroundImage:Ljava/lang/String;

    .line 185
    .line 186
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->avatar:Ljava/lang/String;

    .line 187
    .line 188
    if-nez p1, :cond_12

    .line 189
    .line 190
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->avatar:Ljava/lang/String;

    .line 191
    .line 192
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->line1textNearAvatar:Ljava/lang/String;

    .line 193
    .line 194
    if-nez p1, :cond_13

    .line 195
    .line 196
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->line1textNearAvatar:Ljava/lang/String;

    .line 197
    .line 198
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->line2textNearAvatar:Ljava/lang/String;

    .line 199
    .line 200
    if-nez p1, :cond_14

    .line 201
    .line 202
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->line2textNearAvatar:Ljava/lang/String;

    .line 203
    .line 204
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->deeplink:Ljava/lang/String;

    .line 205
    .line 206
    if-nez p1, :cond_15

    .line 207
    .line 208
    iput-object v1, p0, Lcom/p1/mobile/putong/data/MiniWidgetData;->deeplink:Ljava/lang/String;

    .line 209
    .line 210
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

    .line 211
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/MiniWidgetData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/MiniWidgetData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/MiniWidgetData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->type:Lcom/p1/mobile/putong/data/MiniWidgetDataType;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/MiniWidgetDataType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->leftTopText:Ljava/lang/String;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->backgroundImage:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->avatar:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->line1textNearAvatar:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->line2textNearAvatar:Ljava/lang/String;

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
    const/4 p0, 0x7

    .line 52
    iget v0, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->sustainSeconds:I

    .line 53
    .line 54
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->deeplink:Ljava/lang/String;

    .line 58
    .line 59
    if-eqz p0, :cond_6

    .line 60
    .line 61
    const/16 p1, 0x8

    .line 62
    .line 63
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 64
    .line 65
    .line 66
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

    .line 67
    check-cast p1, Lcom/p1/mobile/putong/data/MiniWidgetData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/MiniWidgetData$1;->serialize(Lcom/p1/mobile/putong/data/MiniWidgetData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
