.class Lcom/p1/mobile/putong/core/data/PurposeItemData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/PurposeItemData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/PurposeItemData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/PurposeItemData;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PurposeItemData;->text:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PurposeItemData;->key:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PurposeItemData;->picSelected:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PurposeItemData;->pic:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PurposeItemData;->purposeReport:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    const/4 v1, 0x5

    .line 47
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PurposeItemData;->enableRule:Ljava/util/List;

    .line 53
    .line 54
    if-eqz v0, :cond_5

    .line 55
    .line 56
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    const/4 v2, 0x6

    .line 63
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PurposeItemData;->icon1:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz v0, :cond_6

    .line 71
    .line 72
    const/4 v1, 0x7

    .line 73
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    add-int/2addr p0, v0

    .line 78
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PurposeItemData;->icon2:Ljava/lang/String;

    .line 79
    .line 80
    if-eqz v0, :cond_7

    .line 81
    .line 82
    const/16 v1, 0x8

    .line 83
    .line 84
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    add-int/2addr p0, v0

    .line 89
    :cond_7
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 90
    .line 91
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 92
    check-cast p1, Lcom/p1/mobile/putong/core/data/PurposeItemData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/PurposeItemData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/PurposeItemData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/PurposeItemData;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/PurposeItemData;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->text:Ljava/lang/String;

    .line 47
    .line 48
    if-nez p1, :cond_0

    .line 49
    .line 50
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->text:Ljava/lang/String;

    .line 51
    .line 52
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->key:Ljava/lang/String;

    .line 53
    .line 54
    if-nez p1, :cond_1

    .line 55
    .line 56
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->key:Ljava/lang/String;

    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->picSelected:Ljava/lang/String;

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->picSelected:Ljava/lang/String;

    .line 63
    .line 64
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->pic:Ljava/lang/String;

    .line 65
    .line 66
    if-nez p1, :cond_3

    .line 67
    .line 68
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->pic:Ljava/lang/String;

    .line 69
    .line 70
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->purposeReport:Ljava/lang/String;

    .line 71
    .line 72
    if-nez p1, :cond_4

    .line 73
    .line 74
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->purposeReport:Ljava/lang/String;

    .line 75
    .line 76
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->enableRule:Ljava/util/List;

    .line 77
    .line 78
    if-nez p1, :cond_5

    .line 79
    .line 80
    new-instance p1, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .line 84
    .line 85
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->enableRule:Ljava/util/List;

    .line 86
    .line 87
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->icon1:Ljava/lang/String;

    .line 88
    .line 89
    if-nez p1, :cond_6

    .line 90
    .line 91
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->icon1:Ljava/lang/String;

    .line 92
    .line 93
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->icon2:Ljava/lang/String;

    .line 94
    .line 95
    if-nez p1, :cond_17

    .line 96
    .line 97
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->icon2:Ljava/lang/String;

    .line 98
    .line 99
    return-object p0

    .line 100
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->icon2:Ljava/lang/String;

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->icon1:Ljava/lang/String;

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_9
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 115
    .line 116
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Ljava/util/List;

    .line 125
    .line 126
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->enableRule:Ljava/util/List;

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->purposeReport:Ljava/lang/String;

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->pic:Ljava/lang/String;

    .line 142
    .line 143
    goto/16 :goto_0

    .line 144
    .line 145
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->picSelected:Ljava/lang/String;

    .line 150
    .line 151
    goto/16 :goto_0

    .line 152
    .line 153
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->key:Ljava/lang/String;

    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :cond_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->text:Ljava/lang/String;

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->text:Ljava/lang/String;

    .line 170
    .line 171
    if-nez p1, :cond_10

    .line 172
    .line 173
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->text:Ljava/lang/String;

    .line 174
    .line 175
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->key:Ljava/lang/String;

    .line 176
    .line 177
    if-nez p1, :cond_11

    .line 178
    .line 179
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->key:Ljava/lang/String;

    .line 180
    .line 181
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->picSelected:Ljava/lang/String;

    .line 182
    .line 183
    if-nez p1, :cond_12

    .line 184
    .line 185
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->picSelected:Ljava/lang/String;

    .line 186
    .line 187
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->pic:Ljava/lang/String;

    .line 188
    .line 189
    if-nez p1, :cond_13

    .line 190
    .line 191
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->pic:Ljava/lang/String;

    .line 192
    .line 193
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->purposeReport:Ljava/lang/String;

    .line 194
    .line 195
    if-nez p1, :cond_14

    .line 196
    .line 197
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->purposeReport:Ljava/lang/String;

    .line 198
    .line 199
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->enableRule:Ljava/util/List;

    .line 200
    .line 201
    if-nez p1, :cond_15

    .line 202
    .line 203
    new-instance p1, Ljava/util/ArrayList;

    .line 204
    .line 205
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 206
    .line 207
    .line 208
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->enableRule:Ljava/util/List;

    .line 209
    .line 210
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->icon1:Ljava/lang/String;

    .line 211
    .line 212
    if-nez p1, :cond_16

    .line 213
    .line 214
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->icon1:Ljava/lang/String;

    .line 215
    .line 216
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->icon2:Ljava/lang/String;

    .line 217
    .line 218
    if-nez p1, :cond_17

    .line 219
    .line 220
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/PurposeItemData;->icon2:Ljava/lang/String;

    .line 221
    .line 222
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

    .line 223
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/PurposeItemData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/PurposeItemData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/PurposeItemData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PurposeItemData;->text:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PurposeItemData;->key:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PurposeItemData;->picSelected:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PurposeItemData;->pic:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PurposeItemData;->purposeReport:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p0, :cond_4

    .line 36
    .line 37
    const/4 v0, 0x5

    .line 38
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PurposeItemData;->enableRule:Ljava/util/List;

    .line 42
    .line 43
    if-eqz p0, :cond_5

    .line 44
    .line 45
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const/4 v1, 0x6

    .line 52
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 53
    .line 54
    .line 55
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PurposeItemData;->icon1:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz p0, :cond_6

    .line 58
    .line 59
    const/4 v0, 0x7

    .line 60
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PurposeItemData;->icon2:Ljava/lang/String;

    .line 64
    .line 65
    if-eqz p0, :cond_7

    .line 66
    .line 67
    const/16 p1, 0x8

    .line 68
    .line 69
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 70
    .line 71
    .line 72
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

    .line 73
    check-cast p1, Lcom/p1/mobile/putong/core/data/PurposeItemData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/PurposeItemData$1;->serialize(Lcom/p1/mobile/putong/core/data/PurposeItemData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
