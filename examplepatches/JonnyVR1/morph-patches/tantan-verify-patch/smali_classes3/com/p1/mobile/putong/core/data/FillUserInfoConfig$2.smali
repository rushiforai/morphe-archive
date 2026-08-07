.class Lcom/p1/mobile/putong/core/data/FillUserInfoConfig$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;",
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
    const-class p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig$2;->newInstance()Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;",
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
    const-string p0, "female_self_intro_tags_2"

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
    const/16 v2, 0xa

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "female_self_intro_tags_1"

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
    const/16 v2, 0x9

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "female_name"

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
    goto/16 :goto_0

    .line 53
    .line 54
    :cond_2
    const/16 v2, 0x8

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "expire_days"

    .line 59
    .line 60
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-nez p0, :cond_3

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_3
    const/4 v2, 0x7

    .line 68
    goto :goto_0

    .line 69
    :sswitch_4
    const-string p0, "female_other_tags"

    .line 70
    .line 71
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-nez p0, :cond_4

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_4
    const/4 v2, 0x6

    .line 79
    goto :goto_0

    .line 80
    :sswitch_5
    const-string p0, "male_self_intro_tags_2"

    .line 81
    .line 82
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-nez p0, :cond_5

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_5
    const/4 v2, 0x5

    .line 90
    goto :goto_0

    .line 91
    :sswitch_6
    const-string p0, "male_self_intro_tags_1"

    .line 92
    .line 93
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    if-nez p0, :cond_6

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_6
    const/4 v2, 0x4

    .line 101
    goto :goto_0

    .line 102
    :sswitch_7
    const-string p0, "female_avatar_url"

    .line 103
    .line 104
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    if-nez p0, :cond_7

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_7
    const/4 v2, 0x3

    .line 112
    goto :goto_0

    .line 113
    :sswitch_8
    const-string p0, "male_other_tags"

    .line 114
    .line 115
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    if-nez p0, :cond_8

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_8
    const/4 v2, 0x2

    .line 123
    goto :goto_0

    .line 124
    :sswitch_9
    const-string p0, "male_avatar_url"

    .line 125
    .line 126
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    if-nez p0, :cond_9

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_9
    move v2, v1

    .line 134
    goto :goto_0

    .line 135
    :sswitch_a
    const-string p0, "male_name"

    .line 136
    .line 137
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    if-nez p0, :cond_a

    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_a
    move v2, v0

    .line 145
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 146
    .line 147
    .line 148
    return v0

    .line 149
    :pswitch_0
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 150
    .line 151
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_self_intro_tags_2:Ljava/util/List;

    .line 156
    .line 157
    return v1

    .line 158
    :pswitch_1
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 159
    .line 160
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_self_intro_tags_1:Ljava/util/List;

    .line 165
    .line 166
    return v1

    .line 167
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_name:Ljava/lang/String;

    .line 172
    .line 173
    return v1

    .line 174
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 175
    .line 176
    .line 177
    move-result p0

    .line 178
    iput p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->expire_days:I

    .line 179
    .line 180
    return v1

    .line 181
    :pswitch_4
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 182
    .line 183
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_other_tags:Ljava/util/List;

    .line 188
    .line 189
    return v1

    .line 190
    :pswitch_5
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 191
    .line 192
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_self_intro_tags_2:Ljava/util/List;

    .line 197
    .line 198
    return v1

    .line 199
    :pswitch_6
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 200
    .line 201
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_self_intro_tags_1:Ljava/util/List;

    .line 206
    .line 207
    return v1

    .line 208
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_avatar_url:Ljava/lang/String;

    .line 213
    .line 214
    return v1

    .line 215
    :pswitch_8
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 216
    .line 217
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_other_tags:Ljava/util/List;

    .line 222
    .line 223
    return v1

    .line 224
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_avatar_url:Ljava/lang/String;

    .line 229
    .line 230
    return v1

    .line 231
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_name:Ljava/lang/String;

    .line 236
    .line 237
    return v1

    .line 238
    nop

    .line 239
    :sswitch_data_0
    .sparse-switch
        -0x7fa21283 -> :sswitch_a
        -0x5751a905 -> :sswitch_9
        -0x4a2bb2a6 -> :sswitch_8
        -0x3516aba4 -> :sswitch_7
        -0x2ea060e1 -> :sswitch_6
        -0x2ea060e0 -> :sswitch_5
        -0x27f0b545 -> :sswitch_4
        -0x5c2f889 -> :sswitch_3
        0x3476c79e -> :sswitch_2
        0x7f90029e -> :sswitch_1
        0x7f90029f -> :sswitch_0
    .end sparse-switch

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
    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    .line 271
    .line 272
    .line 273
    .line 274
    .line 275
    .line 276
    .line 277
    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
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

    .line 239
    check-cast p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig$2;->parseField(Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;",
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
    const-string v0, "female_self_intro_tags_2"

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
    const/16 v2, 0xa

    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :sswitch_1
    const-string v0, "female_self_intro_tags_1"

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
    const/16 v2, 0x9

    .line 40
    .line 41
    goto/16 :goto_0

    .line 42
    .line 43
    :sswitch_2
    const-string v0, "female_name"

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
    goto/16 :goto_0

    .line 52
    .line 53
    :cond_2
    const/16 v2, 0x8

    .line 54
    .line 55
    goto/16 :goto_0

    .line 56
    .line 57
    :sswitch_3
    const-string v0, "expire_days"

    .line 58
    .line 59
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_3

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_3
    const/4 v2, 0x7

    .line 67
    goto :goto_0

    .line 68
    :sswitch_4
    const-string v0, "female_other_tags"

    .line 69
    .line 70
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_4

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_4
    const/4 v2, 0x6

    .line 78
    goto :goto_0

    .line 79
    :sswitch_5
    const-string v0, "male_self_intro_tags_2"

    .line 80
    .line 81
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_5

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_5
    const/4 v2, 0x5

    .line 89
    goto :goto_0

    .line 90
    :sswitch_6
    const-string v0, "male_self_intro_tags_1"

    .line 91
    .line 92
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-nez v0, :cond_6

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_6
    const/4 v2, 0x4

    .line 100
    goto :goto_0

    .line 101
    :sswitch_7
    const-string v0, "female_avatar_url"

    .line 102
    .line 103
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-nez v0, :cond_7

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_7
    const/4 v2, 0x3

    .line 111
    goto :goto_0

    .line 112
    :sswitch_8
    const-string v0, "male_other_tags"

    .line 113
    .line 114
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-nez v0, :cond_8

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_8
    const/4 v2, 0x2

    .line 122
    goto :goto_0

    .line 123
    :sswitch_9
    const-string v0, "male_avatar_url"

    .line 124
    .line 125
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-nez v0, :cond_9

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_9
    move v2, v1

    .line 133
    goto :goto_0

    .line 134
    :sswitch_a
    const-string v0, "male_name"

    .line 135
    .line 136
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-nez v0, :cond_a

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_a
    const/4 v2, 0x0

    .line 144
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 145
    .line 146
    .line 147
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 148
    .line 149
    .line 150
    move-result p0

    .line 151
    return p0

    .line 152
    :pswitch_0
    return v1

    .line 153
    :sswitch_data_0
    .sparse-switch
        -0x7fa21283 -> :sswitch_a
        -0x5751a905 -> :sswitch_9
        -0x4a2bb2a6 -> :sswitch_8
        -0x3516aba4 -> :sswitch_7
        -0x2ea060e1 -> :sswitch_6
        -0x2ea060e0 -> :sswitch_5
        -0x27f0b545 -> :sswitch_4
        -0x5c2f889 -> :sswitch_3
        0x3476c79e -> :sswitch_2
        0x7f90029e -> :sswitch_1
        0x7f90029f -> :sswitch_0
    .end sparse-switch

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
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
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
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 153
    check-cast p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig$2;->parseFieldCheck(Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_avatar_url:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "male_avatar_url"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_avatar_url:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "female_avatar_url"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_name:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const-string v0, "male_name"

    .line 24
    .line 25
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_name:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz p0, :cond_3

    .line 31
    .line 32
    const-string v0, "female_name"

    .line 33
    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    const-string p0, "expire_days"

    .line 38
    .line 39
    iget v0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->expire_days:I

    .line 40
    .line 41
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_self_intro_tags_1:Ljava/util/List;

    .line 45
    .line 46
    if-eqz p0, :cond_4

    .line 47
    .line 48
    const-string p0, "male_self_intro_tags_1"

    .line 49
    .line 50
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_self_intro_tags_1:Ljava/util/List;

    .line 54
    .line 55
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 56
    .line 57
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 58
    .line 59
    .line 60
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_self_intro_tags_2:Ljava/util/List;

    .line 61
    .line 62
    if-eqz p0, :cond_5

    .line 63
    .line 64
    const-string p0, "male_self_intro_tags_2"

    .line 65
    .line 66
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_self_intro_tags_2:Ljava/util/List;

    .line 70
    .line 71
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 72
    .line 73
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 74
    .line 75
    .line 76
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_self_intro_tags_1:Ljava/util/List;

    .line 77
    .line 78
    if-eqz p0, :cond_6

    .line 79
    .line 80
    const-string p0, "female_self_intro_tags_1"

    .line 81
    .line 82
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_self_intro_tags_1:Ljava/util/List;

    .line 86
    .line 87
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 88
    .line 89
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 90
    .line 91
    .line 92
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_self_intro_tags_2:Ljava/util/List;

    .line 93
    .line 94
    if-eqz p0, :cond_7

    .line 95
    .line 96
    const-string p0, "female_self_intro_tags_2"

    .line 97
    .line 98
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_self_intro_tags_2:Ljava/util/List;

    .line 102
    .line 103
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 104
    .line 105
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 106
    .line 107
    .line 108
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_other_tags:Ljava/util/List;

    .line 109
    .line 110
    if-eqz p0, :cond_8

    .line 111
    .line 112
    const-string p0, "male_other_tags"

    .line 113
    .line 114
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_other_tags:Ljava/util/List;

    .line 118
    .line 119
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 120
    .line 121
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 122
    .line 123
    .line 124
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_other_tags:Ljava/util/List;

    .line 125
    .line 126
    if-eqz p0, :cond_9

    .line 127
    .line 128
    const-string p0, "female_other_tags"

    .line 129
    .line 130
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_other_tags:Ljava/util/List;

    .line 134
    .line 135
    sget-object p1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 136
    .line 137
    invoke-static {p0, p2, p1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 138
    .line 139
    .line 140
    :cond_9
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 141
    check-cast p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig$2;->serializeFields(Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
