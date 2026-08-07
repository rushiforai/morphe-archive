.class Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
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
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getDataClass()Ljava/lang/Class;
    .locals 0

    .line 1
    const-class p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice$2;->newInstance()Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;",
            "Ljava/lang/String;",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/common/data/BaseData;",
            ">;",
            "Lcom/tantanapp/common/data/DataChecker;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, -0x1

    .line 11
    sparse-switch p0, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :sswitch_0
    const-string p0, "diamondSign"

    .line 17
    .line 18
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    goto/16 :goto_0

    .line 25
    .line 26
    :cond_0
    const/16 v2, 0x9

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "originalPrice"

    .line 31
    .line 32
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_1

    .line 37
    .line 38
    goto/16 :goto_0

    .line 39
    .line 40
    :cond_1
    const/16 v2, 0x8

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "price"

    .line 45
    .line 46
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-nez p0, :cond_2

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    const/4 v2, 0x7

    .line 54
    goto :goto_0

    .line 55
    :sswitch_3
    const-string p0, "promotionPrivilegePrices"

    .line 56
    .line 57
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-nez p0, :cond_3

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    const/4 v2, 0x6

    .line 65
    goto :goto_0

    .line 66
    :sswitch_4
    const-string p0, "type"

    .line 67
    .line 68
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-nez p0, :cond_4

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_4
    const/4 v2, 0x5

    .line 76
    goto :goto_0

    .line 77
    :sswitch_5
    const-string p0, "num"

    .line 78
    .line 79
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-nez p0, :cond_5

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_5
    const/4 v2, 0x4

    .line 87
    goto :goto_0

    .line 88
    :sswitch_6
    const-string p0, "id"

    .line 89
    .line 90
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    if-nez p0, :cond_6

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_6
    const/4 v2, 0x3

    .line 98
    goto :goto_0

    .line 99
    :sswitch_7
    const-string p0, "unitPrice"

    .line 100
    .line 101
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    if-nez p0, :cond_7

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_7
    const/4 v2, 0x2

    .line 109
    goto :goto_0

    .line 110
    :sswitch_8
    const-string p0, "coinSign"

    .line 111
    .line 112
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    if-nez p0, :cond_8

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_8
    move v2, v1

    .line 120
    goto :goto_0

    .line 121
    :sswitch_9
    const-string p0, "business"

    .line 122
    .line 123
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    if-nez p0, :cond_9

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_9
    move v2, v0

    .line 131
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 132
    .line 133
    .line 134
    return v0

    .line 135
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->diamondSign:Ljava/lang/String;

    .line 140
    .line 141
    return v1

    .line 142
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    iput p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->originalPrice:I

    .line 147
    .line 148
    return v1

    .line 149
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    iput p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->price:I

    .line 154
    .line 155
    return v1

    .line 156
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 157
    .line 158
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->promotionPrivilegePrices:Ljava/util/List;

    .line 163
    .line 164
    return v1

    .line 165
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->type:Ljava/lang/String;

    .line 170
    .line 171
    return v1

    .line 172
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 173
    .line 174
    .line 175
    move-result p0

    .line 176
    iput p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->num:I

    .line 177
    .line 178
    return v1

    .line 179
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 180
    .line 181
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    check-cast p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 186
    .line 187
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 188
    .line 189
    return v0

    .line 190
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 191
    .line 192
    .line 193
    move-result p0

    .line 194
    iput p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->unitPrice:I

    .line 195
    .line 196
    return v1

    .line 197
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->coinSign:Ljava/lang/String;

    .line 202
    .line 203
    return v1

    .line 204
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->business:Ljava/lang/String;

    .line 209
    .line 210
    return v1

    .line 211
    :sswitch_data_0
    .sparse-switch
        -0x445b4040 -> :sswitch_9
        -0x2ab5b012 -> :sswitch_8
        -0x1cfac5db -> :sswitch_7
        0xd1b -> :sswitch_6
        0x1ab86 -> :sswitch_5
        0x368f3a -> :sswitch_4
        0x4935338 -> :sswitch_3
        0x65fb149 -> :sswitch_2
        0x6e3cb1f8 -> :sswitch_1
        0x7574a931 -> :sswitch_0
    .end sparse-switch

    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseField(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 211
    check-cast p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice$2;->parseField(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;",
            "Ljava/lang/String;",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/common/data/BaseData;",
            ">;",
            "Lcom/tantanapp/common/data/DataChecker;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x1

    .line 10
    const/4 v3, -0x1

    .line 11
    sparse-switch v0, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :sswitch_0
    const-string v0, "diamondSign"

    .line 17
    .line 18
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    goto/16 :goto_0

    .line 25
    .line 26
    :cond_0
    const/16 v3, 0x9

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string v0, "originalPrice"

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    goto/16 :goto_0

    .line 39
    .line 40
    :cond_1
    const/16 v3, 0x8

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string v0, "price"

    .line 45
    .line 46
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_2

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    const/4 v3, 0x7

    .line 54
    goto :goto_0

    .line 55
    :sswitch_3
    const-string v0, "promotionPrivilegePrices"

    .line 56
    .line 57
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_3

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    const/4 v3, 0x6

    .line 65
    goto :goto_0

    .line 66
    :sswitch_4
    const-string v0, "type"

    .line 67
    .line 68
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-nez v0, :cond_4

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_4
    const/4 v3, 0x5

    .line 76
    goto :goto_0

    .line 77
    :sswitch_5
    const-string v0, "num"

    .line 78
    .line 79
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_5

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_5
    const/4 v3, 0x4

    .line 87
    goto :goto_0

    .line 88
    :sswitch_6
    const-string v0, "id"

    .line 89
    .line 90
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-nez v0, :cond_6

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_6
    const/4 v3, 0x3

    .line 98
    goto :goto_0

    .line 99
    :sswitch_7
    const-string v0, "unitPrice"

    .line 100
    .line 101
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_7

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_7
    const/4 v3, 0x2

    .line 109
    goto :goto_0

    .line 110
    :sswitch_8
    const-string v0, "coinSign"

    .line 111
    .line 112
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-nez v0, :cond_8

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_8
    move v3, v2

    .line 120
    goto :goto_0

    .line 121
    :sswitch_9
    const-string v0, "business"

    .line 122
    .line 123
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-nez v0, :cond_9

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_9
    move v3, v1

    .line 131
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 132
    .line 133
    .line 134
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    return p0

    .line 139
    :pswitch_0
    return v2

    .line 140
    :pswitch_1
    return v1

    .line 141
    :pswitch_2
    return v2

    .line 142
    nop

    .line 143
    :sswitch_data_0
    .sparse-switch
        -0x445b4040 -> :sswitch_9
        -0x2ab5b012 -> :sswitch_8
        -0x1cfac5db -> :sswitch_7
        0xd1b -> :sswitch_6
        0x1ab86 -> :sswitch_5
        0x368f3a -> :sswitch_4
        0x4935338 -> :sswitch_3
        0x65fb149 -> :sswitch_2
        0x6e3cb1f8 -> :sswitch_1
        0x7574a931 -> :sswitch_0
    .end sparse-switch

    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 143
    check-cast p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice$2;->parseFieldCheck(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;Lcom/fasterxml/jackson/core/JsonGenerator;)V
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
    const-string p0, "id"

    .line 6
    .line 7
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->id:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {p0, v0, p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->type:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    const-string v0, "type"

    .line 23
    .line 24
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    const-string p0, "unitPrice"

    .line 28
    .line 29
    iget v0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->unitPrice:I

    .line 30
    .line 31
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->coinSign:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    const-string v0, "coinSign"

    .line 39
    .line 40
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    const-string p0, "price"

    .line 44
    .line 45
    iget v0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->price:I

    .line 46
    .line 47
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 48
    .line 49
    .line 50
    const-string p0, "num"

    .line 51
    .line 52
    iget v0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->num:I

    .line 53
    .line 54
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 55
    .line 56
    .line 57
    const-string p0, "originalPrice"

    .line 58
    .line 59
    iget v0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->originalPrice:I

    .line 60
    .line 61
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->promotionPrivilegePrices:Ljava/util/List;

    .line 65
    .line 66
    if-eqz p0, :cond_3

    .line 67
    .line 68
    const-string p0, "promotionPrivilegePrices"

    .line 69
    .line 70
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->promotionPrivilegePrices:Ljava/util/List;

    .line 74
    .line 75
    sget-object v0, Lcom/p1/mobile/putong/core/data/PromotionPrivilegePrices;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 76
    .line 77
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 78
    .line 79
    .line 80
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->business:Ljava/lang/String;

    .line 81
    .line 82
    if-eqz p0, :cond_4

    .line 83
    .line 84
    const-string v0, "business"

    .line 85
    .line 86
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->diamondSign:Ljava/lang/String;

    .line 90
    .line 91
    if-eqz p0, :cond_5

    .line 92
    .line 93
    const-string p1, "diamondSign"

    .line 94
    .line 95
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    :cond_5
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 99
    check-cast p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice$2;->serializeFields(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
