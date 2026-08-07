.class Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;",
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
    const-string p0, "memberCount"

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
    const-string p0, "joinFanbase"

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
    const-string p0, "icons"

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
    const-string p0, "name"

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
    const-string p0, "id"

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
    const-string p0, "defaultMedal"

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
    const-string p0, "anchorId"

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
    const-string p0, "activityScore"

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
    const-string p0, "avatar"

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
    const-string p0, "summary"

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
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->memberCount:I

    .line 140
    .line 141
    return v1

    .line 142
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBase;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 143
    .line 144
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBase;

    .line 149
    .line 150
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->joinFanbase:Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBase;

    .line 151
    .line 152
    return v1

    .line 153
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 154
    .line 155
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->icons:Ljava/util/List;

    .line 160
    .line 161
    return v1

    .line 162
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->name:Ljava/lang/String;

    .line 167
    .line 168
    return v1

    .line 169
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->id:Ljava/lang/String;

    .line 174
    .line 175
    return v0

    .line 176
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 177
    .line 178
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;

    .line 183
    .line 184
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->defaultMedal:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;

    .line 185
    .line 186
    return v1

    .line 187
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->anchorId:Ljava/lang/String;

    .line 192
    .line 193
    return v1

    .line 194
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseActivityScores;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 195
    .line 196
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseActivityScores;

    .line 201
    .line 202
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->activityScore:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseActivityScores;

    .line 203
    .line 204
    return v1

    .line 205
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->avatar:Ljava/lang/String;

    .line 210
    .line 211
    return v1

    .line 212
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetailSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 213
    .line 214
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetailSummary;

    .line 219
    .line 220
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->summary:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetailSummary;

    .line 221
    .line 222
    return v1

    .line 223
    :sswitch_data_0
    .sparse-switch
        -0x6eb9585a -> :sswitch_9
        -0x53cd3ea7 -> :sswitch_8
        -0x3e73133d -> :sswitch_7
        -0x39e30d50 -> :sswitch_6
        -0x27c696ca -> :sswitch_5
        0xd1b -> :sswitch_4
        0x337a8b -> :sswitch_3
        0x5f6531a -> :sswitch_2
        0x281347da -> :sswitch_1
        0x50f26695 -> :sswitch_0
    .end sparse-switch

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
    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
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

    .line 223
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->name:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "name"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->avatar:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const-string v0, "avatar"

    .line 24
    .line 25
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->anchorId:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz p0, :cond_3

    .line 31
    .line 32
    const-string v0, "anchorId"

    .line 33
    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    const-string p0, "memberCount"

    .line 38
    .line 39
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->memberCount:I

    .line 40
    .line 41
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->activityScore:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseActivityScores;

    .line 45
    .line 46
    const/4 v0, 0x1

    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const-string p0, "activityScore"

    .line 50
    .line 51
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseActivityScores;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 55
    .line 56
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->activityScore:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseActivityScores;

    .line 57
    .line 58
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 59
    .line 60
    .line 61
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->defaultMedal:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;

    .line 62
    .line 63
    if-eqz p0, :cond_5

    .line 64
    .line 65
    const-string p0, "defaultMedal"

    .line 66
    .line 67
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 71
    .line 72
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->defaultMedal:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;

    .line 73
    .line 74
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 75
    .line 76
    .line 77
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->joinFanbase:Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBase;

    .line 78
    .line 79
    if-eqz p0, :cond_6

    .line 80
    .line 81
    const-string p0, "joinFanbase"

    .line 82
    .line 83
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBase;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 87
    .line 88
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->joinFanbase:Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBase;

    .line 89
    .line 90
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 91
    .line 92
    .line 93
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->summary:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetailSummary;

    .line 94
    .line 95
    if-eqz p0, :cond_7

    .line 96
    .line 97
    const-string p0, "summary"

    .line 98
    .line 99
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetailSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 103
    .line 104
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->summary:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetailSummary;

    .line 105
    .line 106
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 107
    .line 108
    .line 109
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->icons:Ljava/util/List;

    .line 110
    .line 111
    if-eqz p0, :cond_8

    .line 112
    .line 113
    const-string p0, "icons"

    .line 114
    .line 115
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->icons:Ljava/util/List;

    .line 119
    .line 120
    sget-object p1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 121
    .line 122
    invoke-static {p0, p2, p1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 123
    .line 124
    .line 125
    :cond_8
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 126
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
