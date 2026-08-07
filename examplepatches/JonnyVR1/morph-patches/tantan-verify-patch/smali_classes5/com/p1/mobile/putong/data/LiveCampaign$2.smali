.class Lcom/p1/mobile/putong/data/LiveCampaign$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/LiveCampaign;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/data/LiveCampaign;",
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
    const-class p0, Lcom/p1/mobile/putong/data/LiveCampaign;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/data/LiveCampaign;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/LiveCampaign;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/LiveCampaign;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LiveCampaign$2;->newInstance()Lcom/p1/mobile/putong/data/LiveCampaign;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/data/LiveCampaign;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/LiveCampaign;",
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
    const-string p0, "position"

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
    const/16 v2, 0x8

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "campaignType"

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
    goto :goto_0

    .line 39
    :cond_1
    const/4 v2, 0x7

    .line 40
    goto :goto_0

    .line 41
    :sswitch_2
    const-string p0, "type"

    .line 42
    .line 43
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    const/4 v2, 0x6

    .line 51
    goto :goto_0

    .line 52
    :sswitch_3
    const-string p0, "id"

    .line 53
    .line 54
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-nez p0, :cond_3

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    const/4 v2, 0x5

    .line 62
    goto :goto_0

    .line 63
    :sswitch_4
    const-string p0, "entranceUrl"

    .line 64
    .line 65
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-nez p0, :cond_4

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_4
    const/4 v2, 0x4

    .line 73
    goto :goto_0

    .line 74
    :sswitch_5
    const-string p0, "validPeriod"

    .line 75
    .line 76
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-nez p0, :cond_5

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_5
    const/4 v2, 0x3

    .line 84
    goto :goto_0

    .line 85
    :sswitch_6
    const-string p0, "detailUrl"

    .line 86
    .line 87
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-nez p0, :cond_6

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_6
    const/4 v2, 0x2

    .line 95
    goto :goto_0

    .line 96
    :sswitch_7
    const-string p0, "detailInset"

    .line 97
    .line 98
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    if-nez p0, :cond_7

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_7
    move v2, v1

    .line 106
    goto :goto_0

    .line 107
    :sswitch_8
    const-string p0, "entranceSize"

    .line 108
    .line 109
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-nez p0, :cond_8

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_8
    move v2, v0

    .line 117
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 118
    .line 119
    .line 120
    return v0

    .line 121
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    iput p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->position:I

    .line 126
    .line 127
    return v1

    .line 128
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    iput-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->campaignType:Ljava/lang/String;

    .line 133
    .line 134
    return v1

    .line 135
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    iput-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->type:Ljava/lang/String;

    .line 140
    .line 141
    return v1

    .line 142
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    iput-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->id:Ljava/lang/String;

    .line 147
    .line 148
    return v0

    .line 149
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    iput-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->entranceUrl:Ljava/lang/String;

    .line 154
    .line 155
    return v1

    .line 156
    :pswitch_5
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->LONG_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 157
    .line 158
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    iput-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->validPeriod:Ljava/util/List;

    .line 163
    .line 164
    return v1

    .line 165
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    iput-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->detailUrl:Ljava/lang/String;

    .line 170
    .line 171
    return v1

    .line 172
    :pswitch_7
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->DOUBLE_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 173
    .line 174
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    iput-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->detailInset:Ljava/util/List;

    .line 179
    .line 180
    return v1

    .line 181
    :pswitch_8
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 182
    .line 183
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    iput-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->entranceSize:Ljava/util/List;

    .line 188
    .line 189
    return v1

    .line 190
    nop

    .line 191
    :sswitch_data_0
    .sparse-switch
        -0x7efe6c29 -> :sswitch_8
        -0x7b6a1cb4 -> :sswitch_7
        -0x759af8a2 -> :sswitch_6
        -0x6e4ffb23 -> :sswitch_5
        -0xc5ac127 -> :sswitch_4
        0xd1b -> :sswitch_3
        0x368f3a -> :sswitch_2
        0xa49fc6a -> :sswitch_1
        0x2c929929 -> :sswitch_0
    .end sparse-switch

    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
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
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 191
    check-cast p1, Lcom/p1/mobile/putong/data/LiveCampaign;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/LiveCampaign$2;->parseField(Lcom/p1/mobile/putong/data/LiveCampaign;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/data/LiveCampaign;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/LiveCampaign;",
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
    const-string v0, "position"

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
    const/16 v3, 0x8

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string v0, "campaignType"

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
    goto :goto_0

    .line 39
    :cond_1
    const/4 v3, 0x7

    .line 40
    goto :goto_0

    .line 41
    :sswitch_2
    const-string v0, "type"

    .line 42
    .line 43
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    const/4 v3, 0x6

    .line 51
    goto :goto_0

    .line 52
    :sswitch_3
    const-string v0, "id"

    .line 53
    .line 54
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_3

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    const/4 v3, 0x5

    .line 62
    goto :goto_0

    .line 63
    :sswitch_4
    const-string v0, "entranceUrl"

    .line 64
    .line 65
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_4

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_4
    const/4 v3, 0x4

    .line 73
    goto :goto_0

    .line 74
    :sswitch_5
    const-string v0, "validPeriod"

    .line 75
    .line 76
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_5

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_5
    const/4 v3, 0x3

    .line 84
    goto :goto_0

    .line 85
    :sswitch_6
    const-string v0, "detailUrl"

    .line 86
    .line 87
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_6

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_6
    const/4 v3, 0x2

    .line 95
    goto :goto_0

    .line 96
    :sswitch_7
    const-string v0, "detailInset"

    .line 97
    .line 98
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-nez v0, :cond_7

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_7
    move v3, v2

    .line 106
    goto :goto_0

    .line 107
    :sswitch_8
    const-string v0, "entranceSize"

    .line 108
    .line 109
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-nez v0, :cond_8

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_8
    move v3, v1

    .line 117
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 118
    .line 119
    .line 120
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 121
    .line 122
    .line 123
    move-result p0

    .line 124
    return p0

    .line 125
    :pswitch_0
    return v2

    .line 126
    :pswitch_1
    return v1

    .line 127
    :pswitch_2
    return v2

    .line 128
    nop

    .line 129
    :sswitch_data_0
    .sparse-switch
        -0x7efe6c29 -> :sswitch_8
        -0x7b6a1cb4 -> :sswitch_7
        -0x759af8a2 -> :sswitch_6
        -0x6e4ffb23 -> :sswitch_5
        -0xc5ac127 -> :sswitch_4
        0xd1b -> :sswitch_3
        0x368f3a -> :sswitch_2
        0xa49fc6a -> :sswitch_1
        0x2c929929 -> :sswitch_0
    .end sparse-switch

    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
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
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 129
    check-cast p1, Lcom/p1/mobile/putong/data/LiveCampaign;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/LiveCampaign$2;->parseFieldCheck(Lcom/p1/mobile/putong/data/LiveCampaign;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/data/LiveCampaign;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->id:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "id"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->type:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "type"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    const-string p0, "position"

    .line 20
    .line 21
    iget v0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->position:I

    .line 22
    .line 23
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->entranceUrl:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz p0, :cond_2

    .line 29
    .line 30
    const-string v0, "entranceUrl"

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->entranceSize:Ljava/util/List;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    const-string p0, "entranceSize"

    .line 40
    .line 41
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->entranceSize:Ljava/util/List;

    .line 45
    .line 46
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 47
    .line 48
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 49
    .line 50
    .line 51
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->detailUrl:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz p0, :cond_4

    .line 54
    .line 55
    const-string v0, "detailUrl"

    .line 56
    .line 57
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->detailInset:Ljava/util/List;

    .line 61
    .line 62
    if-eqz p0, :cond_5

    .line 63
    .line 64
    const-string p0, "detailInset"

    .line 65
    .line 66
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->detailInset:Ljava/util/List;

    .line 70
    .line 71
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->DOUBLE_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 72
    .line 73
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 74
    .line 75
    .line 76
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->validPeriod:Ljava/util/List;

    .line 77
    .line 78
    if-eqz p0, :cond_6

    .line 79
    .line 80
    const-string p0, "validPeriod"

    .line 81
    .line 82
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->validPeriod:Ljava/util/List;

    .line 86
    .line 87
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->LONG_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 88
    .line 89
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 90
    .line 91
    .line 92
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->campaignType:Ljava/lang/String;

    .line 93
    .line 94
    if-eqz p0, :cond_7

    .line 95
    .line 96
    const-string p1, "campaignType"

    .line 97
    .line 98
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_7
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 102
    check-cast p1, Lcom/p1/mobile/putong/data/LiveCampaign;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/LiveCampaign$2;->serializeFields(Lcom/p1/mobile/putong/data/LiveCampaign;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
