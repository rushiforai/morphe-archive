.class public Lcom/tencent/liteav/network/i;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/network/i$a;
    }
.end annotation


# static fields
.field protected static a:Lcom/tencent/liteav/network/i;


# instance fields
.field private b:Landroid/content/Context;

.field private c:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/network/i;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/liteav/network/i;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tencent/liteav/network/i;->a:Lcom/tencent/liteav/network/i;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/liteav/network/i;->b:Landroid/content/Context;

    .line 6
    .line 7
    const-wide/16 v0, 0x3

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/tencent/liteav/network/i;->c:J

    .line 10
    .line 11
    return-void
.end method

.method private a(Ljava/lang/String;Z)Lcom/tencent/liteav/network/i$a;
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "avgAudioQue"

    .line 4
    .line 5
    const-string v2, "avgVideoQue"

    .line 6
    .line 7
    const-string v3, "avgBlockCnt"

    .line 8
    .line 9
    const-string v4, "networkRTT"

    .line 10
    .line 11
    const-string v5, ""

    .line 12
    .line 13
    invoke-direct/range {p0 .. p1}, Lcom/tencent/liteav/network/i;->b(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v6

    .line 17
    const/4 v7, 0x0

    .line 18
    if-eqz v6, :cond_0

    .line 19
    .line 20
    return-object v7

    .line 21
    :cond_0
    :try_start_0
    iget-object v6, v0, Lcom/tencent/liteav/network/i;->b:Landroid/content/Context;

    .line 22
    .line 23
    const-string v8, "com.tencent.liteav.network"

    .line 24
    .line 25
    const/4 v9, 0x0

    .line 26
    invoke-virtual {v6, v8, v9}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 27
    .line 28
    .line 29
    move-result-object v6

    .line 30
    const-string v8, "34238512-C08C-4931-A000-40E1D8B5BA5B"

    .line 31
    .line 32
    invoke-interface {v6, v8, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    invoke-direct {v0, v6}, Lcom/tencent/liteav/network/i;->b(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v8

    .line 40
    if-eqz v8, :cond_1

    .line 41
    .line 42
    return-object v7

    .line 43
    :cond_1
    new-instance v8, Lorg/json/JSONObject;

    .line 44
    .line 45
    invoke-direct {v8, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    move-object/from16 v6, p1

    .line 49
    .line 50
    invoke-virtual {v8, v6}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    if-nez v6, :cond_2

    .line 55
    .line 56
    return-object v7

    .line 57
    :cond_2
    if-eqz p2, :cond_3

    .line 58
    .line 59
    const-string v8, "DomainArrayData"

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :catch_0
    move-exception v0

    .line 63
    move-object/from16 v18, v7

    .line 64
    .line 65
    goto/16 :goto_2

    .line 66
    .line 67
    :cond_3
    const-string v8, "OriginArrayData"

    .line 68
    .line 69
    :goto_0
    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    if-nez v6, :cond_4

    .line 74
    .line 75
    return-object v7

    .line 76
    :cond_4
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    .line 77
    .line 78
    .line 79
    move-result v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    int-to-long v10, v8

    .line 81
    const-wide/16 v12, 0x0

    .line 82
    .line 83
    cmp-long v8, v10, v12

    .line 84
    .line 85
    if-nez v8, :cond_5

    .line 86
    .line 87
    return-object v7

    .line 88
    :cond_5
    const/4 v8, 0x0

    .line 89
    move-object v12, v5

    .line 90
    move-object/from16 v18, v7

    .line 91
    .line 92
    move/from16 p1, v8

    .line 93
    .line 94
    move/from16 v5, p1

    .line 95
    .line 96
    move v13, v5

    .line 97
    move v14, v9

    .line 98
    move v9, v13

    .line 99
    :goto_1
    int-to-long v7, v14

    .line 100
    cmp-long v7, v7, v10

    .line 101
    .line 102
    if-gez v7, :cond_6

    .line 103
    .line 104
    :try_start_1
    invoke-virtual {v6, v14}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 105
    .line 106
    .line 107
    move-result-object v7

    .line 108
    move v8, v14

    .line 109
    invoke-virtual {v7, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    .line 110
    .line 111
    .line 112
    move-result-wide v14

    .line 113
    long-to-float v14, v14

    .line 114
    add-float v19, p1, v14

    .line 115
    .line 116
    float-to-double v14, v5

    .line 117
    invoke-virtual {v7, v3}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    .line 118
    .line 119
    .line 120
    move-result-wide v16

    .line 121
    add-double v14, v14, v16

    .line 122
    .line 123
    double-to-float v5, v14

    .line 124
    float-to-double v14, v9

    .line 125
    invoke-virtual {v7, v2}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    .line 126
    .line 127
    .line 128
    move-result-wide v16

    .line 129
    add-double v14, v14, v16

    .line 130
    .line 131
    double-to-float v9, v14

    .line 132
    float-to-double v13, v13

    .line 133
    invoke-virtual {v7, v1}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    .line 134
    .line 135
    .line 136
    move-result-wide v15

    .line 137
    add-double/2addr v13, v15

    .line 138
    double-to-float v13, v13

    .line 139
    const-string v14, "%s \n isDomainAddressBetter\uff1aitemData domain = %b NetworkRTT = %d avgBlockCount = %f avgVideoQueue = %f avgAudioQueue = %f"

    .line 140
    .line 141
    move v15, v13

    .line 142
    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 143
    .line 144
    .line 145
    move-result-object v13

    .line 146
    invoke-virtual {v7, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    .line 147
    .line 148
    .line 149
    move-result-wide v16

    .line 150
    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 151
    .line 152
    .line 153
    move-result-object v16

    .line 154
    invoke-virtual {v7, v3}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    .line 155
    .line 156
    .line 157
    move-result-wide v20

    .line 158
    invoke-static/range {v20 .. v21}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 159
    .line 160
    .line 161
    move-result-object v17

    .line 162
    invoke-virtual {v7, v2}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    .line 163
    .line 164
    .line 165
    move-result-wide v20

    .line 166
    invoke-static/range {v20 .. v21}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 167
    .line 168
    .line 169
    move-result-object v20

    .line 170
    invoke-virtual {v7, v1}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    .line 171
    .line 172
    .line 173
    move-result-wide v21

    .line 174
    invoke-static/range {v21 .. v22}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 175
    .line 176
    .line 177
    move-result-object v7

    .line 178
    move-object/from16 v23, v20

    .line 179
    .line 180
    move-object/from16 v20, v1

    .line 181
    .line 182
    move-object v1, v14

    .line 183
    move-object/from16 v14, v16

    .line 184
    .line 185
    move-object/from16 v16, v23

    .line 186
    .line 187
    move-object/from16 v23, v17

    .line 188
    .line 189
    move-object/from16 v17, v7

    .line 190
    .line 191
    move v7, v15

    .line 192
    move-object/from16 v15, v23

    .line 193
    .line 194
    filled-new-array/range {v12 .. v17}, [Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v12

    .line 198
    invoke-static {v1, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v12

    .line 202
    add-int/lit8 v14, v8, 0x1

    .line 203
    .line 204
    move v13, v7

    .line 205
    move/from16 p1, v19

    .line 206
    .line 207
    move-object/from16 v1, v20

    .line 208
    .line 209
    goto :goto_1

    .line 210
    :catch_1
    move-exception v0

    .line 211
    goto :goto_2

    .line 212
    :cond_6
    long-to-float v1, v10

    .line 213
    div-float v2, p1, v1

    .line 214
    .line 215
    div-float/2addr v5, v1

    .line 216
    div-float/2addr v9, v1

    .line 217
    div-float/2addr v13, v1

    .line 218
    new-instance v1, Lcom/tencent/liteav/network/i$a;

    .line 219
    .line 220
    invoke-direct {v1, v0}, Lcom/tencent/liteav/network/i$a;-><init>(Lcom/tencent/liteav/network/i;)V

    .line 221
    .line 222
    .line 223
    iput v2, v1, Lcom/tencent/liteav/network/i$a;->a:F

    .line 224
    .line 225
    iput v5, v1, Lcom/tencent/liteav/network/i$a;->b:F

    .line 226
    .line 227
    iput v9, v1, Lcom/tencent/liteav/network/i$a;->c:F

    .line 228
    .line 229
    iput v13, v1, Lcom/tencent/liteav/network/i$a;->d:F

    .line 230
    .line 231
    iput-wide v10, v1, Lcom/tencent/liteav/network/i$a;->e:J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 232
    .line 233
    return-object v1

    .line 234
    :goto_2
    const-string v1, "UploadQualityData"

    .line 235
    .line 236
    const-string v2, "get quality data failed."

    .line 237
    .line 238
    invoke-static {v1, v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 239
    .line 240
    .line 241
    return-object v18
.end method

.method public static a()Lcom/tencent/liteav/network/i;
    .locals 1

    .line 273
    sget-object v0, Lcom/tencent/liteav/network/i;->a:Lcom/tencent/liteav/network/i;

    return-object v0
.end method

.method private b(Ljava/lang/String;)Z
    .locals 0

    if-eqz p1, :cond_1

    .line 73
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method private c(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1

    .line 177
    invoke-direct {p0, p1}, Lcom/tencent/liteav/network/i;->b(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_0

    .line 178
    :try_start_0
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 179
    const-string p1, "UploadQualityData"

    const-string v0, "failed to parse json string"

    invoke-static {p1, v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 180
    :cond_0
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    return-object p0
.end method

.method private d()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/tencent/liteav/basic/d/c;->a()Lcom/tencent/liteav/basic/d/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Network"

    .line 6
    .line 7
    const-string v2, "QualityDataCacheCount"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/basic/d/c;->a(Ljava/lang/String;Ljava/lang/String;)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iput-wide v0, p0, Lcom/tencent/liteav/network/i;->c:J

    .line 14
    .line 15
    const-wide/16 v2, -0x1

    .line 16
    .line 17
    cmp-long v2, v0, v2

    .line 18
    .line 19
    const-wide/16 v3, 0x3

    .line 20
    .line 21
    if-eqz v2, :cond_1

    .line 22
    .line 23
    cmp-long v0, v0, v3

    .line 24
    .line 25
    if-gez v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void

    .line 29
    :cond_1
    :goto_0
    iput-wide v3, p0, Lcom/tencent/liteav/network/i;->c:J

    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)J
    .locals 4

    .line 274
    iget-object p0, p0, Lcom/tencent/liteav/network/i;->b:Landroid/content/Context;

    const-wide/16 v0, 0x0

    if-eqz p0, :cond_0

    .line 275
    const-string v2, "com.tencent.liteav.network"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0, p1, v0, v1}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide p0

    return-wide p0

    :cond_0
    return-wide v0
.end method

.method public a(Landroid/content/Context;)V
    .locals 1

    .line 242
    iget-object v0, p0, Lcom/tencent/liteav/network/i;->b:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 243
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/tencent/liteav/network/i;->b:Landroid/content/Context;

    :cond_0
    return-void
.end method

.method public a(Ljava/lang/String;J)V
    .locals 2

    .line 276
    iget-object p0, p0, Lcom/tencent/liteav/network/i;->b:Landroid/content/Context;

    if-eqz p0, :cond_0

    .line 277
    const-string v0, "com.tencent.liteav.network"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :cond_0
    return-void
.end method

.method public a(Ljava/lang/String;JJJFFF)V
    .locals 14

    .line 244
    const-string v7, "34238512-C08C-4931-A000-40E1D8B5BA5B"

    invoke-static {}, Lcom/tencent/liteav/basic/d/c;->a()Lcom/tencent/liteav/basic/d/c;

    move-result-object v0

    const-string v1, "Network"

    const-string v2, "QualityDataCacheCount"

    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/basic/d/c;->a(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_6

    .line 245
    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static/range {p4 .. p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static/range {p6 .. p7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static/range {p8 .. p8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-static/range {p9 .. p9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-static/range {p10 .. p10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    move-object v0, p1

    filled-new-array/range {v0 .. v6}, [Ljava/lang/Object;

    move-result-object v1

    .line 246
    const-string v2, "updateQualityData: accessID = %s serverType = %d totalTime = %d networkRTT = %d avgBlockCnt = %f avgVideoQue = %f avgAudioQue = %f"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "UploadQualityData"

    invoke-static {v2, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    invoke-direct/range {p0 .. p1}, Lcom/tencent/liteav/network/i;->b(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    .line 248
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/tencent/liteav/network/i;->b:Landroid/content/Context;

    const-string v3, "com.tencent.liteav.network"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 249
    const-string v3, ""

    invoke-interface {v1, v7, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 250
    invoke-direct {p0, v3}, Lcom/tencent/liteav/network/i;->c(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 251
    invoke-virtual {v3, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    if-nez v4, :cond_1

    .line 252
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    goto :goto_0

    :catch_0
    move-exception v0

    move-object p0, v0

    goto/16 :goto_3

    :cond_1
    :goto_0
    const-wide/16 v5, 0x3

    cmp-long v5, p2, v5

    if-nez v5, :cond_2

    .line 253
    const-string v5, "DomainArrayData"

    goto :goto_1

    :cond_2
    const-string v5, "OriginArrayData"

    .line 254
    :goto_1
    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    if-nez v6, :cond_3

    .line 255
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    .line 256
    :cond_3
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 257
    const-string v9, "totalTime"

    move-wide/from16 v10, p4

    invoke-virtual {v8, v9, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 258
    const-string v9, "networkRTT"

    move-wide/from16 v10, p6

    invoke-virtual {v8, v9, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 259
    const-string v9, "avgBlockCnt"

    move/from16 v10, p8

    float-to-double v10, v10

    invoke-virtual {v8, v9, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 260
    const-string v9, "avgVideoQue"

    move/from16 v10, p9

    float-to-double v10, v10

    invoke-virtual {v8, v9, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 261
    const-string v9, "avgAudioQue"

    move/from16 v10, p10

    float-to-double v10, v10

    invoke-virtual {v8, v9, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 262
    invoke-virtual {v6, v8}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 263
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v8

    int-to-long v9, v8

    .line 264
    iget-wide v11, p0, Lcom/tencent/liteav/network/i;->c:J

    cmp-long v11, v9, v11

    if-lez v11, :cond_5

    .line 265
    new-instance v11, Lorg/json/JSONArray;

    invoke-direct {v11}, Lorg/json/JSONArray;-><init>()V

    .line 266
    iget-wide v12, p0, Lcom/tencent/liteav/network/i;->c:J

    sub-long/2addr v9, v12

    long-to-int p0, v9

    :goto_2
    if-ge p0, v8, :cond_4

    .line 267
    invoke-virtual {v6, p0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v11, v9}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 p0, p0, 0x1

    goto :goto_2

    :cond_4
    move-object v6, v11

    .line 268
    :cond_5
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 269
    invoke-virtual {v3, p1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 270
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    .line 271
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, v7, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 272
    :goto_3
    const-string v0, "build json object failed."

    invoke-static {v2, v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_6
    return-void
.end method

.method public b()Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    :try_start_0
    iget-object p0, p0, Lcom/tencent/liteav/network/i;->b:Landroid/content/Context;

    .line 4
    .line 5
    if-eqz p0, :cond_6

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tencent/liteav/basic/util/f;->e(Landroid/content/Context;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    const/4 v1, 0x1

    .line 15
    if-ne p0, v1, :cond_1

    .line 16
    .line 17
    const-string p0, "wifi:"

    .line 18
    .line 19
    return-object p0

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 v1, 0x2

    .line 23
    if-ne p0, v1, :cond_2

    .line 24
    .line 25
    const-string p0, "4g:"

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    const/4 v1, 0x3

    .line 29
    if-ne p0, v1, :cond_3

    .line 30
    .line 31
    const-string p0, "3g:"

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_3
    const/4 v1, 0x4

    .line 35
    if-ne p0, v1, :cond_4

    .line 36
    .line 37
    const-string p0, "2g:"

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_4
    const/4 v1, 0x5

    .line 41
    if-ne p0, v1, :cond_5

    .line 42
    .line 43
    const-string p0, "ethernet:"

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_5
    const-string p0, "xg:"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    return-object p0

    .line 49
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v2, "get network type failed."

    .line 52
    .line 53
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string v1, "UploadQualityData"

    .line 68
    .line 69
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    :cond_6
    return-object v0
.end method

.method public c()Z
    .locals 11

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/network/i;->d()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/tencent/liteav/network/i;->b()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v2, "isDomainAddressBetter: accessID = "

    .line 11
    .line 12
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v2, " minQualityDataCount = "

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-wide v2, p0, Lcom/tencent/liteav/network/i;->c:J

    .line 24
    .line 25
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/network/i;->a(Ljava/lang/String;Z)Lcom/tencent/liteav/network/i$a;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    const/4 v3, 0x0

    .line 38
    invoke-direct {p0, v0, v3}, Lcom/tencent/liteav/network/i;->a(Ljava/lang/String;Z)Lcom/tencent/liteav/network/i$a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    iget-wide v5, v2, Lcom/tencent/liteav/network/i$a;->e:J

    .line 45
    .line 46
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    iget v6, v2, Lcom/tencent/liteav/network/i$a;->a:F

    .line 51
    .line 52
    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    iget v7, v2, Lcom/tencent/liteav/network/i$a;->b:F

    .line 57
    .line 58
    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 59
    .line 60
    .line 61
    move-result-object v7

    .line 62
    iget v8, v2, Lcom/tencent/liteav/network/i$a;->c:F

    .line 63
    .line 64
    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 65
    .line 66
    .line 67
    move-result-object v8

    .line 68
    iget v9, v2, Lcom/tencent/liteav/network/i$a;->d:F

    .line 69
    .line 70
    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 71
    .line 72
    .line 73
    move-result-object v9

    .line 74
    filled-new-array/range {v4 .. v9}, [Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    const-string v5, "%s \n isDomainAddressBetter\uff1adomainQualityData count = %d avgNetworkRTT = %f avgBlockCount = %f avgVideoQueue = %f avgAudioQueue = %f"

    .line 79
    .line 80
    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    :cond_0
    move-object v5, v4

    .line 85
    if-eqz v0, :cond_1

    .line 86
    .line 87
    iget-wide v6, v0, Lcom/tencent/liteav/network/i$a;->e:J

    .line 88
    .line 89
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 90
    .line 91
    .line 92
    move-result-object v6

    .line 93
    iget v4, v0, Lcom/tencent/liteav/network/i$a;->a:F

    .line 94
    .line 95
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 96
    .line 97
    .line 98
    move-result-object v7

    .line 99
    iget v4, v0, Lcom/tencent/liteav/network/i$a;->b:F

    .line 100
    .line 101
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 102
    .line 103
    .line 104
    move-result-object v8

    .line 105
    iget v4, v0, Lcom/tencent/liteav/network/i$a;->c:F

    .line 106
    .line 107
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 108
    .line 109
    .line 110
    move-result-object v9

    .line 111
    iget v4, v0, Lcom/tencent/liteav/network/i$a;->d:F

    .line 112
    .line 113
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 114
    .line 115
    .line 116
    move-result-object v10

    .line 117
    filled-new-array/range {v5 .. v10}, [Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    const-string v5, "%s \n isDomainAddressBetter\uff1aoriginQualityData count = %d avgNetworkRTT = %f avgBlockCount = %f avgVideoQueue = %f avgAudioQueue = %f"

    .line 122
    .line 123
    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v5

    .line 127
    :cond_1
    const-string v4, "UploadQualityData"

    .line 128
    .line 129
    invoke-static {v4, v5}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    if-eqz v2, :cond_3

    .line 133
    .line 134
    iget-wide v4, v2, Lcom/tencent/liteav/network/i$a;->e:J

    .line 135
    .line 136
    iget-wide v6, p0, Lcom/tencent/liteav/network/i;->c:J

    .line 137
    .line 138
    cmp-long p0, v4, v6

    .line 139
    .line 140
    if-ltz p0, :cond_3

    .line 141
    .line 142
    if-eqz v0, :cond_3

    .line 143
    .line 144
    iget-wide v4, v0, Lcom/tencent/liteav/network/i$a;->e:J

    .line 145
    .line 146
    cmp-long p0, v4, v6

    .line 147
    .line 148
    if-gez p0, :cond_2

    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_2
    iget p0, v2, Lcom/tencent/liteav/network/i$a;->b:F

    .line 152
    .line 153
    iget v4, v0, Lcom/tencent/liteav/network/i$a;->b:F

    .line 154
    .line 155
    cmpg-float p0, p0, v4

    .line 156
    .line 157
    if-gez p0, :cond_3

    .line 158
    .line 159
    iget p0, v2, Lcom/tencent/liteav/network/i$a;->c:F

    .line 160
    .line 161
    iget v4, v0, Lcom/tencent/liteav/network/i$a;->c:F

    .line 162
    .line 163
    cmpg-float p0, p0, v4

    .line 164
    .line 165
    if-gez p0, :cond_3

    .line 166
    .line 167
    iget p0, v2, Lcom/tencent/liteav/network/i$a;->d:F

    .line 168
    .line 169
    iget v0, v0, Lcom/tencent/liteav/network/i$a;->d:F

    .line 170
    .line 171
    cmpg-float p0, p0, v0

    .line 172
    .line 173
    if-gez p0, :cond_3

    .line 174
    .line 175
    return v1

    .line 176
    :cond_3
    :goto_0
    return v3
.end method
