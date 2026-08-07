.class Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;",
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
    const-class p0, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel$2;->newInstance()Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;",
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
    const/4 p4, 0x0

    .line 9
    const/4 p5, 0x1

    .line 10
    const/4 p6, -0x1

    .line 11
    sparse-switch p0, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :sswitch_0
    const-string p0, "new_female_swipe_count"

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
    const/16 p6, 0xb

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "male_right_swipe_count"

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
    const/16 p6, 0xa

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "new_profile_count"

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
    const/16 p6, 0x9

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "new_female_right_swipe_count"

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
    goto/16 :goto_0

    .line 67
    .line 68
    :cond_3
    const/16 p6, 0x8

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "female_right_swipe_count"

    .line 73
    .line 74
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-nez p0, :cond_4

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_4
    const/4 p6, 0x7

    .line 82
    goto :goto_0

    .line 83
    :sswitch_5
    const-string p0, "new_male_right_swipe_count"

    .line 84
    .line 85
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-nez p0, :cond_5

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_5
    const/4 p6, 0x6

    .line 93
    goto :goto_0

    .line 94
    :sswitch_6
    const-string p0, "female_profile_count"

    .line 95
    .line 96
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    if-nez p0, :cond_6

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_6
    const/4 p6, 0x5

    .line 104
    goto :goto_0

    .line 105
    :sswitch_7
    const-string p0, "female_swipe_count"

    .line 106
    .line 107
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    if-nez p0, :cond_7

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_7
    const/4 p6, 0x4

    .line 115
    goto :goto_0

    .line 116
    :sswitch_8
    const-string p0, "enable"

    .line 117
    .line 118
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    if-nez p0, :cond_8

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_8
    const/4 p6, 0x3

    .line 126
    goto :goto_0

    .line 127
    :sswitch_9
    const-string p0, "male_swipe_count"

    .line 128
    .line 129
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    if-nez p0, :cond_9

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_9
    const/4 p6, 0x2

    .line 137
    goto :goto_0

    .line 138
    :sswitch_a
    const-string p0, "new_male_swipe_count"

    .line 139
    .line 140
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result p0

    .line 144
    if-nez p0, :cond_a

    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_a
    move p6, p5

    .line 148
    goto :goto_0

    .line 149
    :sswitch_b
    const-string p0, "male_profile_count"

    .line 150
    .line 151
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result p0

    .line 155
    if-nez p0, :cond_b

    .line 156
    .line 157
    goto :goto_0

    .line 158
    :cond_b
    move p6, p4

    .line 159
    :goto_0
    packed-switch p6, :pswitch_data_0

    .line 160
    .line 161
    .line 162
    return p4

    .line 163
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 164
    .line 165
    .line 166
    move-result p0

    .line 167
    iput p0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->new_female_swipe_count:I

    .line 168
    .line 169
    return p5

    .line 170
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 171
    .line 172
    .line 173
    move-result p0

    .line 174
    iput p0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->male_right_swipe_count:I

    .line 175
    .line 176
    return p5

    .line 177
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 178
    .line 179
    .line 180
    move-result p0

    .line 181
    iput p0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->new_profile_count:I

    .line 182
    .line 183
    return p5

    .line 184
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 185
    .line 186
    .line 187
    move-result p0

    .line 188
    iput p0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->new_female_right_swipe_count:I

    .line 189
    .line 190
    return p5

    .line 191
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 192
    .line 193
    .line 194
    move-result p0

    .line 195
    iput p0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->female_right_swipe_count:I

    .line 196
    .line 197
    return p5

    .line 198
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 199
    .line 200
    .line 201
    move-result p0

    .line 202
    iput p0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->new_male_right_swipe_count:I

    .line 203
    .line 204
    return p5

    .line 205
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 206
    .line 207
    .line 208
    move-result p0

    .line 209
    iput p0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->female_profile_count:I

    .line 210
    .line 211
    return p5

    .line 212
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 213
    .line 214
    .line 215
    move-result p0

    .line 216
    iput p0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->female_swipe_count:I

    .line 217
    .line 218
    return p5

    .line 219
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 220
    .line 221
    .line 222
    move-result p0

    .line 223
    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->enable:Z

    .line 224
    .line 225
    return p5

    .line 226
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 227
    .line 228
    .line 229
    move-result p0

    .line 230
    iput p0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->male_swipe_count:I

    .line 231
    .line 232
    return p5

    .line 233
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 234
    .line 235
    .line 236
    move-result p0

    .line 237
    iput p0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->new_male_swipe_count:I

    .line 238
    .line 239
    return p5

    .line 240
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 241
    .line 242
    .line 243
    move-result p0

    .line 244
    iput p0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->male_profile_count:I

    .line 245
    .line 246
    return p5

    .line 247
    :sswitch_data_0
    .sparse-switch
        -0x7a98a7b9 -> :sswitch_b
        -0x75e7faa9 -> :sswitch_a
        -0x70842768 -> :sswitch_9
        -0x4d6ada7d -> :sswitch_8
        -0x4b5f78a9 -> :sswitch_7
        -0xbe4acba -> :sswitch_6
        -0x2b3420c -> :sswitch_5
        0xbebbff4 -> :sswitch_4
        0xcaabdb3 -> :sswitch_3
        0x125abe9a -> :sswitch_2
        0x5dbb5c75 -> :sswitch_1
        0x78e48056 -> :sswitch_0
    .end sparse-switch

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
    .line 286
    .line 287
    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_b
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

    .line 247
    check-cast p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel$2;->parseField(Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;",
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
    const-string v0, "new_female_swipe_count"

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
    const/16 v2, 0xb

    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :sswitch_1
    const-string v0, "male_right_swipe_count"

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
    const/16 v2, 0xa

    .line 40
    .line 41
    goto/16 :goto_0

    .line 42
    .line 43
    :sswitch_2
    const-string v0, "new_profile_count"

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
    const/16 v2, 0x9

    .line 54
    .line 55
    goto/16 :goto_0

    .line 56
    .line 57
    :sswitch_3
    const-string v0, "new_female_right_swipe_count"

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
    goto/16 :goto_0

    .line 66
    .line 67
    :cond_3
    const/16 v2, 0x8

    .line 68
    .line 69
    goto/16 :goto_0

    .line 70
    .line 71
    :sswitch_4
    const-string v0, "female_right_swipe_count"

    .line 72
    .line 73
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_4

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_4
    const/4 v2, 0x7

    .line 81
    goto :goto_0

    .line 82
    :sswitch_5
    const-string v0, "new_male_right_swipe_count"

    .line 83
    .line 84
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-nez v0, :cond_5

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_5
    const/4 v2, 0x6

    .line 92
    goto :goto_0

    .line 93
    :sswitch_6
    const-string v0, "female_profile_count"

    .line 94
    .line 95
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-nez v0, :cond_6

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_6
    const/4 v2, 0x5

    .line 103
    goto :goto_0

    .line 104
    :sswitch_7
    const-string v0, "female_swipe_count"

    .line 105
    .line 106
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-nez v0, :cond_7

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_7
    const/4 v2, 0x4

    .line 114
    goto :goto_0

    .line 115
    :sswitch_8
    const-string v0, "enable"

    .line 116
    .line 117
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-nez v0, :cond_8

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_8
    const/4 v2, 0x3

    .line 125
    goto :goto_0

    .line 126
    :sswitch_9
    const-string v0, "male_swipe_count"

    .line 127
    .line 128
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    if-nez v0, :cond_9

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_9
    const/4 v2, 0x2

    .line 136
    goto :goto_0

    .line 137
    :sswitch_a
    const-string v0, "new_male_swipe_count"

    .line 138
    .line 139
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-nez v0, :cond_a

    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_a
    move v2, v1

    .line 147
    goto :goto_0

    .line 148
    :sswitch_b
    const-string v0, "male_profile_count"

    .line 149
    .line 150
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-nez v0, :cond_b

    .line 155
    .line 156
    goto :goto_0

    .line 157
    :cond_b
    const/4 v2, 0x0

    .line 158
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 159
    .line 160
    .line 161
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    return p0

    .line 166
    :pswitch_0
    return v1

    .line 167
    :sswitch_data_0
    .sparse-switch
        -0x7a98a7b9 -> :sswitch_b
        -0x75e7faa9 -> :sswitch_a
        -0x70842768 -> :sswitch_9
        -0x4d6ada7d -> :sswitch_8
        -0x4b5f78a9 -> :sswitch_7
        -0xbe4acba -> :sswitch_6
        -0x2b3420c -> :sswitch_5
        0xbebbff4 -> :sswitch_4
        0xcaabdb3 -> :sswitch_3
        0x125abe9a -> :sswitch_2
        0x5dbb5c75 -> :sswitch_1
        0x78e48056 -> :sswitch_0
    .end sparse-switch

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
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 167
    check-cast p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel$2;->parseFieldCheck(Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "enable"

    .line 2
    .line 3
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->enable:Z

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 6
    .line 7
    .line 8
    const-string p0, "new_female_swipe_count"

    .line 9
    .line 10
    iget v0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->new_female_swipe_count:I

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    const-string p0, "new_female_right_swipe_count"

    .line 16
    .line 17
    iget v0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->new_female_right_swipe_count:I

    .line 18
    .line 19
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    const-string p0, "new_male_swipe_count"

    .line 23
    .line 24
    iget v0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->new_male_swipe_count:I

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    const-string p0, "new_male_right_swipe_count"

    .line 30
    .line 31
    iget v0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->new_male_right_swipe_count:I

    .line 32
    .line 33
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    const-string p0, "female_swipe_count"

    .line 37
    .line 38
    iget v0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->female_swipe_count:I

    .line 39
    .line 40
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 41
    .line 42
    .line 43
    const-string p0, "female_right_swipe_count"

    .line 44
    .line 45
    iget v0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->female_right_swipe_count:I

    .line 46
    .line 47
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 48
    .line 49
    .line 50
    const-string p0, "male_swipe_count"

    .line 51
    .line 52
    iget v0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->male_swipe_count:I

    .line 53
    .line 54
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 55
    .line 56
    .line 57
    const-string p0, "male_right_swipe_count"

    .line 58
    .line 59
    iget v0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->male_right_swipe_count:I

    .line 60
    .line 61
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 62
    .line 63
    .line 64
    const-string p0, "new_profile_count"

    .line 65
    .line 66
    iget v0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->new_profile_count:I

    .line 67
    .line 68
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 69
    .line 70
    .line 71
    const-string p0, "male_profile_count"

    .line 72
    .line 73
    iget v0, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->male_profile_count:I

    .line 74
    .line 75
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 76
    .line 77
    .line 78
    const-string p0, "female_profile_count"

    .line 79
    .line 80
    iget p1, p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;->female_profile_count:I

    .line 81
    .line 82
    invoke-virtual {p2, p0, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 86
    check-cast p1, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel$2;->serializeFields(Lcom/p1/mobile/putong/core/data/FakeUploadPhotoModel;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
