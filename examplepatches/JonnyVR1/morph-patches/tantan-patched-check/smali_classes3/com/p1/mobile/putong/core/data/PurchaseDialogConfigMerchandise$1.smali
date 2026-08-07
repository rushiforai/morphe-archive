.class Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->order:Ljava/util/List;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const/4 v2, 0x2

    .line 27
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    :cond_1
    const/4 v0, 0x3

    .line 33
    iget v1, p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->defaultQuantity:I

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 41
    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    const/4 v1, 0x4

    .line 45
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProductCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 46
    .line 47
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->orderUnit:Ljava/util/List;

    .line 53
    .line 54
    if-eqz v0, :cond_3

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
    const/4 v2, 0x5

    .line 63
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->defaultUnit:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz v0, :cond_4

    .line 71
    .line 72
    const/4 v1, 0x6

    .line 73
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    add-int/2addr p0, v0

    .line 78
    :cond_4
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 79
    .line 80
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 81
    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;-><init>()V

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
    if-eqz v2, :cond_a

    .line 15
    .line 16
    const/16 v4, 0x8

    .line 17
    .line 18
    if-eq v2, v4, :cond_9

    .line 19
    .line 20
    const/16 v4, 0x12

    .line 21
    .line 22
    if-eq v2, v4, :cond_8

    .line 23
    .line 24
    const/16 v4, 0x18

    .line 25
    .line 26
    if-eq v2, v4, :cond_7

    .line 27
    .line 28
    const/16 v4, 0x22

    .line 29
    .line 30
    if-eq v2, v4, :cond_6

    .line 31
    .line 32
    const/16 v4, 0x2a

    .line 33
    .line 34
    if-eq v2, v4, :cond_5

    .line 35
    .line 36
    const/16 v4, 0x32

    .line 37
    .line 38
    if-eq v2, v4, :cond_4

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 41
    .line 42
    if-nez p1, :cond_0

    .line 43
    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 57
    .line 58
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 59
    .line 60
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 61
    .line 62
    if-nez p1, :cond_1

    .line 63
    .line 64
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 71
    .line 72
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 73
    .line 74
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->order:Ljava/util/List;

    .line 75
    .line 76
    if-nez p1, :cond_2

    .line 77
    .line 78
    new-instance p1, Ljava/util/ArrayList;

    .line 79
    .line 80
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->order:Ljava/util/List;

    .line 84
    .line 85
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->orderUnit:Ljava/util/List;

    .line 86
    .line 87
    if-nez p1, :cond_3

    .line 88
    .line 89
    new-instance p1, Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 92
    .line 93
    .line 94
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->orderUnit:Ljava/util/List;

    .line 95
    .line 96
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->defaultUnit:Ljava/lang/String;

    .line 97
    .line 98
    if-nez p1, :cond_f

    .line 99
    .line 100
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->defaultUnit:Ljava/lang/String;

    .line 101
    .line 102
    return-object p0

    .line 103
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->defaultUnit:Ljava/lang/String;

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_5
    sget-object v2, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 111
    .line 112
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    check-cast v2, Ljava/util/List;

    .line 121
    .line 122
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->orderUnit:Ljava/util/List;

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_6
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProductCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 126
    .line 127
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    check-cast v2, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 132
    .line 133
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    iput v2, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->defaultQuantity:I

    .line 141
    .line 142
    goto/16 :goto_0

    .line 143
    .line 144
    :cond_8
    sget-object v2, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 145
    .line 146
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    check-cast v2, Ljava/util/List;

    .line 155
    .line 156
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->order:Ljava/util/List;

    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 171
    .line 172
    if-nez p1, :cond_b

    .line 173
    .line 174
    if-eqz v1, :cond_b

    .line 175
    .line 176
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 177
    .line 178
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 187
    .line 188
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 189
    .line 190
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 191
    .line 192
    if-nez p1, :cond_c

    .line 193
    .line 194
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 195
    .line 196
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 201
    .line 202
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 203
    .line 204
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->order:Ljava/util/List;

    .line 205
    .line 206
    if-nez p1, :cond_d

    .line 207
    .line 208
    new-instance p1, Ljava/util/ArrayList;

    .line 209
    .line 210
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 211
    .line 212
    .line 213
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->order:Ljava/util/List;

    .line 214
    .line 215
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->orderUnit:Ljava/util/List;

    .line 216
    .line 217
    if-nez p1, :cond_e

    .line 218
    .line 219
    new-instance p1, Ljava/util/ArrayList;

    .line 220
    .line 221
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 222
    .line 223
    .line 224
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->orderUnit:Ljava/util/List;

    .line 225
    .line 226
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->defaultUnit:Ljava/lang/String;

    .line 227
    .line 228
    if-nez p1, :cond_f

    .line 229
    .line 230
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->defaultUnit:Ljava/lang/String;

    .line 231
    .line 232
    :cond_f
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 233
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->order:Ljava/util/List;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x2

    .line 24
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    const/4 p0, 0x3

    .line 28
    iget v0, p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->defaultQuantity:I

    .line 29
    .line 30
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 34
    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    const/4 v0, 0x4

    .line 38
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProductCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 39
    .line 40
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->orderUnit:Ljava/util/List;

    .line 44
    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const/4 v1, 0x5

    .line 54
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;->defaultUnit:Ljava/lang/String;

    .line 58
    .line 59
    if-eqz p0, :cond_4

    .line 60
    .line 61
    const/4 p1, 0x6

    .line 62
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 63
    .line 64
    .line 65
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

    .line 66
    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise$1;->serialize(Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigMerchandise;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
