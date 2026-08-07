.class Lcom/p1/mobile/putong/core/data/MonetizationTreasure$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MonetizationTreasure;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/core/data/MonetizationTreasure;",
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
    const-class p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/core/data/MonetizationTreasure;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MonetizationTreasure$2;->newInstance()Lcom/p1/mobile/putong/core/data/MonetizationTreasure;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/core/data/MonetizationTreasure;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/MonetizationTreasure;",
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
    const-string p0, "prizeInfos"

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
    const-string p0, "coinRemaining"

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
    const-string p0, "gemConsumeAmount"

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
    const-string p0, "expiringCount"

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
    const-string p0, "bags"

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
    const-string p0, "freeTimes"

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
    const-string p0, "openAds"

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
    const-string p0, "coinConsumeAmount"

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
    const-string p0, "coinAmount"

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
    const-string p0, "gemRemaining"

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
    sget-object p0, Lcom/p1/mobile/putong/core/data/TreasurePrizeInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 136
    .line 137
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeInfos:Ljava/util/List;

    .line 142
    .line 143
    return v1

    .line 144
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 145
    .line 146
    .line 147
    move-result p0

    .line 148
    iput p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinRemaining:I

    .line 149
    .line 150
    return v1

    .line 151
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 152
    .line 153
    .line 154
    move-result p0

    .line 155
    iput p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->gemConsumeAmount:I

    .line 156
    .line 157
    return v1

    .line 158
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    iput p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->expiringCount:I

    .line 163
    .line 164
    return v1

    .line 165
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/core/data/Bags;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 166
    .line 167
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->bags:Ljava/util/List;

    .line 172
    .line 173
    return v1

    .line 174
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 175
    .line 176
    .line 177
    move-result p0

    .line 178
    iput p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->freeTimes:I

    .line 179
    .line 180
    return v1

    .line 181
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/core/data/TreasurePrizeAd;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 182
    .line 183
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeAds:Ljava/util/List;

    .line 188
    .line 189
    return v1

    .line 190
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 191
    .line 192
    .line 193
    move-result p0

    .line 194
    iput p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinConsumeAmount:I

    .line 195
    .line 196
    return v1

    .line 197
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 198
    .line 199
    .line 200
    move-result p0

    .line 201
    iput p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinAmount:I

    .line 202
    .line 203
    return v1

    .line 204
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 205
    .line 206
    .line 207
    move-result p0

    .line 208
    iput p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->gemRemaining:I

    .line 209
    .line 210
    return v1

    .line 211
    :sswitch_data_0
    .sparse-switch
        -0x7abbf899 -> :sswitch_9
        -0x728505b7 -> :sswitch_8
        -0x4c153f9d -> :sswitch_7
        -0x4b4b41fa -> :sswitch_6
        -0x1a75dbc6 -> :sswitch_5
        0x2e056b -> :sswitch_4
        0x1b8e8453 -> :sswitch_3
        0x2c5f8465 -> :sswitch_2
        0x4758f265 -> :sswitch_1
        0x68404893 -> :sswitch_0
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
    check-cast p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/MonetizationTreasure$2;->parseField(Lcom/p1/mobile/putong/core/data/MonetizationTreasure;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/core/data/MonetizationTreasure;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/MonetizationTreasure;",
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
    const/4 v1, 0x1

    .line 9
    const/4 v2, -0x1

    .line 10
    sparse-switch v0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :sswitch_0
    const-string v0, "prizeInfos"

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto/16 :goto_0

    .line 24
    .line 25
    :cond_0
    const/16 v2, 0x9

    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :sswitch_1
    const-string v0, "coinRemaining"

    .line 30
    .line 31
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    goto/16 :goto_0

    .line 38
    .line 39
    :cond_1
    const/16 v2, 0x8

    .line 40
    .line 41
    goto/16 :goto_0

    .line 42
    .line 43
    :sswitch_2
    const-string v0, "gemConsumeAmount"

    .line 44
    .line 45
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    const/4 v2, 0x7

    .line 53
    goto :goto_0

    .line 54
    :sswitch_3
    const-string v0, "expiringCount"

    .line 55
    .line 56
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-nez v0, :cond_3

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    const/4 v2, 0x6

    .line 64
    goto :goto_0

    .line 65
    :sswitch_4
    const-string v0, "bags"

    .line 66
    .line 67
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_4

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    const/4 v2, 0x5

    .line 75
    goto :goto_0

    .line 76
    :sswitch_5
    const-string v0, "freeTimes"

    .line 77
    .line 78
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_5

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_5
    const/4 v2, 0x4

    .line 86
    goto :goto_0

    .line 87
    :sswitch_6
    const-string v0, "openAds"

    .line 88
    .line 89
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_6

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_6
    const/4 v2, 0x3

    .line 97
    goto :goto_0

    .line 98
    :sswitch_7
    const-string v0, "coinConsumeAmount"

    .line 99
    .line 100
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-nez v0, :cond_7

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_7
    const/4 v2, 0x2

    .line 108
    goto :goto_0

    .line 109
    :sswitch_8
    const-string v0, "coinAmount"

    .line 110
    .line 111
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-nez v0, :cond_8

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_8
    move v2, v1

    .line 119
    goto :goto_0

    .line 120
    :sswitch_9
    const-string v0, "gemRemaining"

    .line 121
    .line 122
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-nez v0, :cond_9

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_9
    const/4 v2, 0x0

    .line 130
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 131
    .line 132
    .line 133
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 134
    .line 135
    .line 136
    move-result p0

    .line 137
    return p0

    .line 138
    :pswitch_0
    return v1

    .line 139
    :sswitch_data_0
    .sparse-switch
        -0x7abbf899 -> :sswitch_9
        -0x728505b7 -> :sswitch_8
        -0x4c153f9d -> :sswitch_7
        -0x4b4b41fa -> :sswitch_6
        -0x1a75dbc6 -> :sswitch_5
        0x2e056b -> :sswitch_4
        0x1b8e8453 -> :sswitch_3
        0x2c5f8465 -> :sswitch_2
        0x4758f265 -> :sswitch_1
        0x68404893 -> :sswitch_0
    .end sparse-switch

    .line 140
    .line 141
    .line 142
    .line 143
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
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
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

    .line 139
    check-cast p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/MonetizationTreasure$2;->parseFieldCheck(Lcom/p1/mobile/putong/core/data/MonetizationTreasure;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/core/data/MonetizationTreasure;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "freeTimes"

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->freeTimes:I

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 6
    .line 7
    .line 8
    const-string p0, "gemRemaining"

    .line 9
    .line 10
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->gemRemaining:I

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    const-string p0, "gemConsumeAmount"

    .line 16
    .line 17
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->gemConsumeAmount:I

    .line 18
    .line 19
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    const-string p0, "coinConsumeAmount"

    .line 23
    .line 24
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinConsumeAmount:I

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    const-string p0, "expiringCount"

    .line 30
    .line 31
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->expiringCount:I

    .line 32
    .line 33
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    const-string p0, "coinRemaining"

    .line 37
    .line 38
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinRemaining:I

    .line 39
    .line 40
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 41
    .line 42
    .line 43
    const-string p0, "coinAmount"

    .line 44
    .line 45
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinAmount:I

    .line 46
    .line 47
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeInfos:Ljava/util/List;

    .line 51
    .line 52
    if-eqz p0, :cond_0

    .line 53
    .line 54
    const-string p0, "prizeInfos"

    .line 55
    .line 56
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeInfos:Ljava/util/List;

    .line 60
    .line 61
    sget-object v0, Lcom/p1/mobile/putong/core/data/TreasurePrizeInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 62
    .line 63
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeAds:Ljava/util/List;

    .line 67
    .line 68
    if-eqz p0, :cond_1

    .line 69
    .line 70
    const-string p0, "openAds"

    .line 71
    .line 72
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeAds:Ljava/util/List;

    .line 76
    .line 77
    sget-object v0, Lcom/p1/mobile/putong/core/data/TreasurePrizeAd;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 78
    .line 79
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 80
    .line 81
    .line 82
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->bags:Ljava/util/List;

    .line 83
    .line 84
    if-eqz p0, :cond_2

    .line 85
    .line 86
    const-string p0, "bags"

    .line 87
    .line 88
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->bags:Ljava/util/List;

    .line 92
    .line 93
    sget-object p1, Lcom/p1/mobile/putong/core/data/Bags;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 94
    .line 95
    invoke-static {p0, p2, p1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 96
    .line 97
    .line 98
    :cond_2
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
    check-cast p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MonetizationTreasure$2;->serializeFields(Lcom/p1/mobile/putong/core/data/MonetizationTreasure;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
