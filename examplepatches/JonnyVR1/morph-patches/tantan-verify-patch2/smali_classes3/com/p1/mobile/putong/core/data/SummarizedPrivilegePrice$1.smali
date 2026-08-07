.class Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->type:Ljava/lang/String;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_1
    const/4 v0, 0x3

    .line 27
    iget v1, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->unitPrice:I

    .line 28
    .line 29
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->coinSign:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v0, :cond_2

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
    :cond_2
    const/4 v0, 0x5

    .line 45
    iget v1, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->price:I

    .line 46
    .line 47
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    const/4 v0, 0x6

    .line 53
    iget v1, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->num:I

    .line 54
    .line 55
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 61
    .line 62
    if-eqz v0, :cond_3

    .line 63
    .line 64
    const/4 v1, 0x7

    .line 65
    sget-object v2, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 66
    .line 67
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->promotionPrivilegePrices:Ljava/util/List;

    .line 73
    .line 74
    if-eqz v0, :cond_4

    .line 75
    .line 76
    sget-object v1, Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 77
    .line 78
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    const/16 v2, 0x8

    .line 83
    .line 84
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    add-int/2addr p0, v0

    .line 89
    :cond_4
    const/16 v0, 0x9

    .line 90
    .line 91
    iget v1, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->originalPrice:I

    .line 92
    .line 93
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    add-int/2addr p0, v0

    .line 98
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->business:Ljava/lang/String;

    .line 99
    .line 100
    if-eqz v0, :cond_5

    .line 101
    .line 102
    const/16 v1, 0xa

    .line 103
    .line 104
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    add-int/2addr p0, v0

    .line 109
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->diamondSign:Ljava/lang/String;

    .line 110
    .line 111
    if-eqz v0, :cond_6

    .line 112
    .line 113
    const/16 v1, 0xb

    .line 114
    .line 115
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    add-int/2addr p0, v0

    .line 120
    :cond_6
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 121
    .line 122
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 123
    check-cast p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const-string v3, ""

    .line 13
    .line 14
    sparse-switch v2, :sswitch_data_0

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    sget-object p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 48
    .line 49
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 50
    .line 51
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->type:Ljava/lang/String;

    .line 52
    .line 53
    if-nez p1, :cond_2

    .line 54
    .line 55
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->type:Ljava/lang/String;

    .line 56
    .line 57
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->coinSign:Ljava/lang/String;

    .line 58
    .line 59
    if-nez p1, :cond_3

    .line 60
    .line 61
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->coinSign:Ljava/lang/String;

    .line 62
    .line 63
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->promotionPrivilegePrices:Ljava/util/List;

    .line 64
    .line 65
    if-nez p1, :cond_4

    .line 66
    .line 67
    new-instance p1, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->promotionPrivilegePrices:Ljava/util/List;

    .line 73
    .line 74
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->business:Ljava/lang/String;

    .line 75
    .line 76
    if-nez p1, :cond_5

    .line 77
    .line 78
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->business:Ljava/lang/String;

    .line 79
    .line 80
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->diamondSign:Ljava/lang/String;

    .line 81
    .line 82
    if-nez p1, :cond_c

    .line 83
    .line 84
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->diamondSign:Ljava/lang/String;

    .line 85
    .line 86
    return-object p0

    .line 87
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->diamondSign:Ljava/lang/String;

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->business:Ljava/lang/String;

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    iput v2, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->originalPrice:I

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :sswitch_3
    sget-object v2, Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 109
    .line 110
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    check-cast v2, Ljava/util/List;

    .line 119
    .line 120
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->promotionPrivilegePrices:Ljava/util/List;

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :sswitch_4
    sget-object v2, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 124
    .line 125
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    check-cast v2, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 130
    .line 131
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    iput v2, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->num:I

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    iput v2, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->price:I

    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->coinSign:Ljava/lang/String;

    .line 155
    .line 156
    goto/16 :goto_0

    .line 157
    .line 158
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    iput v2, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->unitPrice:I

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->type:Ljava/lang/String;

    .line 171
    .line 172
    goto/16 :goto_0

    .line 173
    .line 174
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 185
    .line 186
    if-nez p1, :cond_6

    .line 187
    .line 188
    if-eqz v1, :cond_6

    .line 189
    .line 190
    sget-object p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 191
    .line 192
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    check-cast p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 201
    .line 202
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 203
    .line 204
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 205
    .line 206
    if-nez p1, :cond_7

    .line 207
    .line 208
    sget-object p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 209
    .line 210
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    check-cast p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 215
    .line 216
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 217
    .line 218
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->type:Ljava/lang/String;

    .line 219
    .line 220
    if-nez p1, :cond_8

    .line 221
    .line 222
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->type:Ljava/lang/String;

    .line 223
    .line 224
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->coinSign:Ljava/lang/String;

    .line 225
    .line 226
    if-nez p1, :cond_9

    .line 227
    .line 228
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->coinSign:Ljava/lang/String;

    .line 229
    .line 230
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->promotionPrivilegePrices:Ljava/util/List;

    .line 231
    .line 232
    if-nez p1, :cond_a

    .line 233
    .line 234
    new-instance p1, Ljava/util/ArrayList;

    .line 235
    .line 236
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 237
    .line 238
    .line 239
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->promotionPrivilegePrices:Ljava/util/List;

    .line 240
    .line 241
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->business:Ljava/lang/String;

    .line 242
    .line 243
    if-nez p1, :cond_b

    .line 244
    .line 245
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->business:Ljava/lang/String;

    .line 246
    .line 247
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->diamondSign:Ljava/lang/String;

    .line 248
    .line 249
    if-nez p1, :cond_c

    .line 250
    .line 251
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->diamondSign:Ljava/lang/String;

    .line 252
    .line 253
    :cond_c
    return-object p0

    .line 254
    nop

    .line 255
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_b
        0x8 -> :sswitch_a
        0x12 -> :sswitch_9
        0x18 -> :sswitch_8
        0x22 -> :sswitch_7
        0x28 -> :sswitch_6
        0x30 -> :sswitch_5
        0x3a -> :sswitch_4
        0x42 -> :sswitch_3
        0x48 -> :sswitch_2
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

    .line 255
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->type:Ljava/lang/String;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    const/4 p0, 0x3

    .line 22
    iget v0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->unitPrice:I

    .line 23
    .line 24
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->coinSign:Ljava/lang/String;

    .line 28
    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const/4 v0, 0x4

    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    const/4 p0, 0x5

    .line 36
    iget v0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->price:I

    .line 37
    .line 38
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x6

    .line 42
    iget v0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->num:I

    .line 43
    .line 44
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 48
    .line 49
    if-eqz p0, :cond_3

    .line 50
    .line 51
    const/4 v0, 0x7

    .line 52
    sget-object v1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 53
    .line 54
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->promotionPrivilegePrices:Ljava/util/List;

    .line 58
    .line 59
    if-eqz p0, :cond_4

    .line 60
    .line 61
    sget-object v0, Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const/16 v1, 0x8

    .line 68
    .line 69
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 70
    .line 71
    .line 72
    :cond_4
    const/16 p0, 0x9

    .line 73
    .line 74
    iget v0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->originalPrice:I

    .line 75
    .line 76
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->business:Ljava/lang/String;

    .line 80
    .line 81
    if-eqz p0, :cond_5

    .line 82
    .line 83
    const/16 v0, 0xa

    .line 84
    .line 85
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->diamondSign:Ljava/lang/String;

    .line 89
    .line 90
    if-eqz p0, :cond_6

    .line 91
    .line 92
    const/16 p1, 0xb

    .line 93
    .line 94
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 95
    .line 96
    .line 97
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

    .line 98
    check-cast p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice$1;->serialize(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
