.class public Ll/grq0;
.super Ljava/lang/Object;


# static fields
.field private static volatile D:Z = false

.field static volatile E:Z = true


# instance fields
.field private A:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/regex/Pattern;",
            ">;"
        }
    .end annotation
.end field

.field B:Ljava/util/regex/Pattern;

.field private C:Ljava/io/File;

.field private a:Ll/quq0;

.field private final b:Landroid/content/Context;

.field private volatile c:Z

.field private d:J

.field private e:Ljava/io/File;

.field private f:Z

.field private g:Lorg/json/JSONObject;

.field private h:Lorg/json/JSONObject;

.field private i:Ljava/lang/String;

.field private j:Ljava/lang/String;

.field private k:Ljava/lang/String;

.field private l:Ljava/lang/String;

.field private m:Lorg/json/JSONArray;

.field private n:Lorg/json/JSONObject;

.field private o:I

.field private p:J

.field private q:Lorg/json/JSONArray;

.field private r:Lorg/json/JSONArray;

.field private s:Lorg/json/JSONObject;

.field private t:Z

.field private final u:Ljava/lang/Object;

.field private volatile v:Z

.field private w:J

.field private x:J

.field private final y:Ljava/lang/Runnable;

.field private z:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Ll/grq0;->d:J

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    iput-object v2, p0, Ll/grq0;->e:Ljava/io/File;

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    iput-boolean v3, p0, Ll/grq0;->f:Z

    .line 13
    .line 14
    const-string v3, "unknown"

    .line 15
    .line 16
    iput-object v3, p0, Ll/grq0;->i:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v3, p0, Ll/grq0;->j:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v3, p0, Ll/grq0;->k:Ljava/lang/String;

    .line 21
    .line 22
    const-string v3, "npth_inner_default"

    .line 23
    .line 24
    iput-object v3, p0, Ll/grq0;->l:Ljava/lang/String;

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    iput v3, p0, Ll/grq0;->o:I

    .line 28
    .line 29
    iput-wide v0, p0, Ll/grq0;->p:J

    .line 30
    .line 31
    new-instance v4, Ljava/lang/Object;

    .line 32
    .line 33
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v4, p0, Ll/grq0;->u:Ljava/lang/Object;

    .line 37
    .line 38
    iput-wide v0, p0, Ll/grq0;->w:J

    .line 39
    .line 40
    const-wide/16 v0, 0x0

    .line 41
    .line 42
    iput-wide v0, p0, Ll/grq0;->x:J

    .line 43
    .line 44
    new-instance v0, Ll/grq0$b;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Ll/grq0$b;-><init>(Ll/grq0;)V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Ll/grq0;->y:Ljava/lang/Runnable;

    .line 50
    .line 51
    iput v3, p0, Ll/grq0;->z:I

    .line 52
    .line 53
    iput-object v2, p0, Ll/grq0;->A:Ljava/util/List;

    .line 54
    .line 55
    iput-object v2, p0, Ll/grq0;->B:Ljava/util/regex/Pattern;

    .line 56
    .line 57
    iput-object v2, p0, Ll/grq0;->C:Ljava/io/File;

    .line 58
    .line 59
    iput-object p1, p0, Ll/grq0;->b:Landroid/content/Context;

    .line 60
    .line 61
    return-void
.end method

.method private static a(F)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v0, p0, v0

    .line 3
    .line 4
    if-gtz v0, :cond_0

    .line 5
    .line 6
    const-string p0, "0%"

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    const v0, 0x3dcccccd    # 0.1f

    .line 10
    .line 11
    .line 12
    cmpg-float v0, p0, v0

    .line 13
    .line 14
    if-gtz v0, :cond_1

    .line 15
    .line 16
    const-string p0, "0% - 10%"

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    const v0, 0x3e99999a    # 0.3f

    .line 20
    .line 21
    .line 22
    cmpg-float v0, p0, v0

    .line 23
    .line 24
    if-gtz v0, :cond_2

    .line 25
    .line 26
    const-string p0, "10% - 30%"

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_2
    const v0, 0x3f19999a    # 0.6f

    .line 30
    .line 31
    .line 32
    cmpg-float v0, p0, v0

    .line 33
    .line 34
    if-gtz v0, :cond_3

    .line 35
    .line 36
    const-string p0, "30% - 60%"

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_3
    const v0, 0x3f666666    # 0.9f

    .line 40
    .line 41
    .line 42
    cmpg-float p0, p0, v0

    .line 43
    .line 44
    if-gtz p0, :cond_4

    .line 45
    .line 46
    const-string p0, "60% - 90%"

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_4
    const-string p0, "90% - 100%"

    .line 50
    .line 51
    return-object p0
.end method

.method private static b(FF)Ljava/lang/String;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v1, p1, v0

    .line 3
    .line 4
    if-lez v1, :cond_0

    .line 5
    .line 6
    div-float/2addr p0, p1

    .line 7
    invoke-static {p0}, Ll/grq0;->a(F)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    cmpl-float p0, p0, v0

    .line 13
    .line 14
    if-lez p0, :cond_1

    .line 15
    .line 16
    const-string p0, "100%"

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    const-string p0, "0%"

    .line 20
    .line 21
    return-object p0
.end method

.method private c(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONObject;
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x100

    .line 7
    .line 8
    const/16 v2, 0x80

    .line 9
    .line 10
    invoke-static {v1, v2, p2}, Ll/t4r0;->b(IILorg/json/JSONArray;)Lorg/json/JSONArray;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-eq v2, p2, :cond_0

    .line 23
    .line 24
    iget p2, p0, Ll/grq0;->o:I

    .line 25
    .line 26
    add-int/lit8 p2, p2, 0x1

    .line 27
    .line 28
    iput p2, p0, Ll/grq0;->o:I

    .line 29
    .line 30
    :cond_0
    :try_start_0
    const-string p0, "thread_name"

    .line 31
    .line 32
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 33
    .line 34
    .line 35
    const-string p0, "thread_stack"

    .line 36
    .line 37
    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    return-object v0

    .line 41
    :catch_0
    const/4 p0, 0x0

    .line 42
    return-object p0
.end method

.method private e(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 30

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 6
    .line 7
    .line 8
    const-string v2, "\n"

    .line 9
    .line 10
    move-object/from16 v3, p1

    .line 11
    .line 12
    invoke-virtual {v3, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    const/4 v3, 0x3

    .line 17
    new-array v4, v3, [F

    .line 18
    .line 19
    const/high16 v5, -0x40800000    # -1.0f

    .line 20
    .line 21
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 22
    .line 23
    .line 24
    move-result-object v6

    .line 25
    const/4 v7, 0x0

    .line 26
    aput v5, v4, v7

    .line 27
    .line 28
    const/4 v8, 0x1

    .line 29
    aput v5, v4, v8

    .line 30
    .line 31
    const/4 v9, 0x2

    .line 32
    aput v5, v4, v9

    .line 33
    .line 34
    new-instance v5, Ljava/util/HashMap;

    .line 35
    .line 36
    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 37
    .line 38
    .line 39
    new-instance v10, Ljava/util/HashMap;

    .line 40
    .line 41
    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 42
    .line 43
    .line 44
    new-instance v11, Ljava/util/HashMap;

    .line 45
    .line 46
    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 47
    .line 48
    .line 49
    new-instance v12, Ljava/util/HashMap;

    .line 50
    .line 51
    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    .line 52
    .line 53
    .line 54
    new-instance v13, Ljava/util/HashMap;

    .line 55
    .line 56
    invoke-direct {v13}, Ljava/util/HashMap;-><init>()V

    .line 57
    .line 58
    .line 59
    array-length v14, v2

    .line 60
    const-string v15, "unknown"

    .line 61
    .line 62
    move/from16 p1, v7

    .line 63
    .line 64
    move/from16 v3, p1

    .line 65
    .line 66
    move/from16 v18, v3

    .line 67
    .line 68
    move-object/from16 v16, v15

    .line 69
    .line 70
    move-object/from16 v17, v16

    .line 71
    .line 72
    :goto_0
    const-string v9, "total"

    .line 73
    .line 74
    if-ge v7, v14, :cond_31

    .line 75
    .line 76
    aget-object v8, v2, v7

    .line 77
    .line 78
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v20

    .line 82
    if-eqz v20, :cond_0

    .line 83
    .line 84
    move-object/from16 v20, v2

    .line 85
    .line 86
    move-object/from16 v21, v4

    .line 87
    .line 88
    move/from16 v23, v7

    .line 89
    .line 90
    move-object/from16 v25, v10

    .line 91
    .line 92
    move-object/from16 v24, v12

    .line 93
    .line 94
    const/4 v4, 0x3

    .line 95
    goto/16 :goto_1f

    .line 96
    .line 97
    :cond_0
    move-object/from16 v20, v2

    .line 98
    .line 99
    const-string v2, ""

    .line 100
    .line 101
    move-object/from16 v21, v4

    .line 102
    .line 103
    if-eqz v3, :cond_2e

    .line 104
    .line 105
    const/4 v4, 0x1

    .line 106
    if-eq v3, v4, :cond_23

    .line 107
    .line 108
    const/4 v4, 0x2

    .line 109
    if-eq v3, v4, :cond_22

    .line 110
    .line 111
    const/4 v4, 0x3

    .line 112
    if-eq v3, v4, :cond_1

    .line 113
    .line 114
    move/from16 v22, v3

    .line 115
    .line 116
    move/from16 v23, v7

    .line 117
    .line 118
    move-object/from16 v25, v10

    .line 119
    .line 120
    move-object/from16 v24, v12

    .line 121
    .line 122
    move-object/from16 v7, v16

    .line 123
    .line 124
    goto/16 :goto_1c

    .line 125
    .line 126
    :cond_1
    const-string v4, "\\s"

    .line 127
    .line 128
    invoke-virtual {v8, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    move/from16 v22, v3

    .line 133
    .line 134
    array-length v3, v4

    .line 135
    move/from16 v23, v7

    .line 136
    .line 137
    const/4 v7, 0x2

    .line 138
    if-ge v3, v7, :cond_4

    .line 139
    .line 140
    :cond_2
    move-object/from16 v25, v10

    .line 141
    .line 142
    move-object/from16 v24, v12

    .line 143
    .line 144
    :cond_3
    :goto_1
    move-object/from16 v7, v16

    .line 145
    .line 146
    const/4 v4, 0x3

    .line 147
    goto/16 :goto_1c

    .line 148
    .line 149
    :cond_4
    const-string v3, "CPU"

    .line 150
    .line 151
    aget-object v7, v4, p1

    .line 152
    .line 153
    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 154
    .line 155
    .line 156
    move-result v3

    .line 157
    if-eqz v3, :cond_8

    .line 158
    .line 159
    const-string v3, "usage"

    .line 160
    .line 161
    const/16 v19, 0x1

    .line 162
    .line 163
    aget-object v7, v4, v19

    .line 164
    .line 165
    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 166
    .line 167
    .line 168
    move-result v3

    .line 169
    if-eqz v3, :cond_8

    .line 170
    .line 171
    const-string v2, "ago"

    .line 172
    .line 173
    invoke-virtual {v8, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 174
    .line 175
    .line 176
    move-result v2

    .line 177
    if-eqz v2, :cond_5

    .line 178
    .line 179
    const/16 v18, 0x1

    .line 180
    .line 181
    :cond_5
    invoke-virtual {v5}, Ljava/util/HashMap;->isEmpty()Z

    .line 182
    .line 183
    .line 184
    move-result v2

    .line 185
    if-eqz v2, :cond_7

    .line 186
    .line 187
    invoke-virtual {v10}, Ljava/util/HashMap;->isEmpty()Z

    .line 188
    .line 189
    .line 190
    move-result v2

    .line 191
    if-eqz v2, :cond_7

    .line 192
    .line 193
    invoke-virtual {v11}, Ljava/util/HashMap;->isEmpty()Z

    .line 194
    .line 195
    .line 196
    move-result v2

    .line 197
    if-eqz v2, :cond_7

    .line 198
    .line 199
    invoke-virtual {v13}, Ljava/util/HashMap;->isEmpty()Z

    .line 200
    .line 201
    .line 202
    move-result v2

    .line 203
    if-eqz v2, :cond_7

    .line 204
    .line 205
    invoke-virtual {v12}, Ljava/util/HashMap;->isEmpty()Z

    .line 206
    .line 207
    .line 208
    move-result v2

    .line 209
    if-nez v2, :cond_6

    .line 210
    .line 211
    goto :goto_3

    .line 212
    :cond_6
    move-object/from16 v25, v10

    .line 213
    .line 214
    move-object/from16 v24, v12

    .line 215
    .line 216
    move/from16 v3, v22

    .line 217
    .line 218
    const/4 v0, 0x4

    .line 219
    :goto_2
    const/4 v4, 0x3

    .line 220
    goto/16 :goto_1d

    .line 221
    .line 222
    :cond_7
    :goto_3
    move-object/from16 v25, v10

    .line 223
    .line 224
    move-object/from16 v24, v12

    .line 225
    .line 226
    const/4 v0, 0x4

    .line 227
    const/4 v3, 0x4

    .line 228
    goto :goto_2

    .line 229
    :cond_8
    invoke-virtual {v5}, Ljava/util/HashMap;->isEmpty()Z

    .line 230
    .line 231
    .line 232
    move-result v3

    .line 233
    if-nez v3, :cond_9

    .line 234
    .line 235
    invoke-virtual {v10}, Ljava/util/HashMap;->isEmpty()Z

    .line 236
    .line 237
    .line 238
    move-result v3

    .line 239
    if-nez v3, :cond_9

    .line 240
    .line 241
    invoke-virtual {v11}, Ljava/util/HashMap;->isEmpty()Z

    .line 242
    .line 243
    .line 244
    move-result v3

    .line 245
    if-nez v3, :cond_9

    .line 246
    .line 247
    invoke-virtual {v13}, Ljava/util/HashMap;->isEmpty()Z

    .line 248
    .line 249
    .line 250
    move-result v3

    .line 251
    if-nez v3, :cond_9

    .line 252
    .line 253
    invoke-virtual {v12}, Ljava/util/HashMap;->isEmpty()Z

    .line 254
    .line 255
    .line 256
    move-result v3

    .line 257
    if-nez v3, :cond_9

    .line 258
    .line 259
    goto :goto_3

    .line 260
    :cond_9
    invoke-virtual {v5}, Ljava/util/HashMap;->isEmpty()Z

    .line 261
    .line 262
    .line 263
    move-result v3

    .line 264
    if-eqz v3, :cond_a

    .line 265
    .line 266
    const/16 v19, 0x1

    .line 267
    .line 268
    aget-object v3, v4, v19

    .line 269
    .line 270
    const-string v7, "TOTAL:"

    .line 271
    .line 272
    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 273
    .line 274
    .line 275
    move-result v3

    .line 276
    if-eqz v3, :cond_a

    .line 277
    .line 278
    move-object v7, v2

    .line 279
    move-object v3, v5

    .line 280
    goto/16 :goto_5

    .line 281
    .line 282
    :cond_a
    iget-object v3, v0, Ll/grq0;->b:Landroid/content/Context;

    .line 283
    .line 284
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v3

    .line 288
    invoke-virtual {v8, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 289
    .line 290
    .line 291
    move-result v3

    .line 292
    if-eqz v3, :cond_d

    .line 293
    .line 294
    move/from16 v3, p1

    .line 295
    .line 296
    move-object v7, v2

    .line 297
    :goto_4
    array-length v8, v4

    .line 298
    if-ge v3, v8, :cond_c

    .line 299
    .line 300
    aget-object v8, v4, v3

    .line 301
    .line 302
    move/from16 v24, v3

    .line 303
    .line 304
    iget-object v3, v0, Ll/grq0;->b:Landroid/content/Context;

    .line 305
    .line 306
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object v3

    .line 310
    invoke-virtual {v8, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 311
    .line 312
    .line 313
    move-result v3

    .line 314
    if-eqz v3, :cond_b

    .line 315
    .line 316
    aget-object v3, v4, v24

    .line 317
    .line 318
    const/16 v7, 0x2f

    .line 319
    .line 320
    invoke-virtual {v3, v7}, Ljava/lang/String;->indexOf(I)I

    .line 321
    .line 322
    .line 323
    move-result v7

    .line 324
    const/16 v19, 0x1

    .line 325
    .line 326
    add-int/lit8 v7, v7, 0x1

    .line 327
    .line 328
    aget-object v8, v4, v24

    .line 329
    .line 330
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 331
    .line 332
    .line 333
    move-result v8

    .line 334
    add-int/lit8 v8, v8, -0x1

    .line 335
    .line 336
    invoke-virtual {v3, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object v3

    .line 340
    const-string v7, "_"

    .line 341
    .line 342
    invoke-virtual {v3, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v7

    .line 346
    :cond_b
    add-int/lit8 v3, v24, 0x1

    .line 347
    .line 348
    goto :goto_4

    .line 349
    :cond_c
    move-object v3, v11

    .line 350
    goto :goto_5

    .line 351
    :cond_d
    invoke-virtual {v10}, Ljava/util/HashMap;->isEmpty()Z

    .line 352
    .line 353
    .line 354
    move-result v3

    .line 355
    if-eqz v3, :cond_e

    .line 356
    .line 357
    const-string v3, "system_server:"

    .line 358
    .line 359
    invoke-virtual {v8, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 360
    .line 361
    .line 362
    move-result v3

    .line 363
    if-eqz v3, :cond_e

    .line 364
    .line 365
    move-object v7, v2

    .line 366
    move-object v3, v10

    .line 367
    goto :goto_5

    .line 368
    :cond_e
    invoke-virtual {v13}, Ljava/util/HashMap;->isEmpty()Z

    .line 369
    .line 370
    .line 371
    move-result v3

    .line 372
    if-eqz v3, :cond_f

    .line 373
    .line 374
    const-string v3, "kswapd"

    .line 375
    .line 376
    invoke-virtual {v8, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 377
    .line 378
    .line 379
    move-result v3

    .line 380
    if-eqz v3, :cond_f

    .line 381
    .line 382
    move-object v7, v2

    .line 383
    move-object v3, v13

    .line 384
    goto :goto_5

    .line 385
    :cond_f
    invoke-virtual {v12}, Ljava/util/HashMap;->isEmpty()Z

    .line 386
    .line 387
    .line 388
    move-result v3

    .line 389
    if-eqz v3, :cond_10

    .line 390
    .line 391
    const-string v3, "dex2oat"

    .line 392
    .line 393
    invoke-virtual {v8, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 394
    .line 395
    .line 396
    move-result v3

    .line 397
    if-eqz v3, :cond_10

    .line 398
    .line 399
    move-object v7, v2

    .line 400
    move-object v3, v12

    .line 401
    goto :goto_5

    .line 402
    :cond_10
    move-object v7, v2

    .line 403
    const/4 v3, 0x0

    .line 404
    :goto_5
    if-eqz v3, :cond_2

    .line 405
    .line 406
    move/from16 v8, p1

    .line 407
    .line 408
    :goto_6
    aget-object v0, v4, v8

    .line 409
    .line 410
    move/from16 v24, v8

    .line 411
    .line 412
    const-string v8, "%"

    .line 413
    .line 414
    invoke-virtual {v0, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 415
    .line 416
    .line 417
    move-result v0

    .line 418
    if-nez v0, :cond_12

    .line 419
    .line 420
    add-int/lit8 v0, v24, 0x1

    .line 421
    .line 422
    move-object/from16 v25, v10

    .line 423
    .line 424
    array-length v10, v4

    .line 425
    if-lt v0, v10, :cond_11

    .line 426
    .line 427
    goto :goto_7

    .line 428
    :cond_11
    move v8, v0

    .line 429
    move-object/from16 v10, v25

    .line 430
    .line 431
    goto :goto_6

    .line 432
    :cond_12
    move-object/from16 v25, v10

    .line 433
    .line 434
    move/from16 v0, v24

    .line 435
    .line 436
    :goto_7
    :try_start_0
    aget-object v10, v4, v0

    .line 437
    .line 438
    invoke-virtual {v10, v8, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object v10

    .line 442
    invoke-static {v10}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    .line 443
    .line 444
    .line 445
    move-result-object v10

    .line 446
    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F

    .line 447
    .line 448
    .line 449
    move-result v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 450
    move/from16 v24, v0

    .line 451
    .line 452
    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 453
    .line 454
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 455
    .line 456
    .line 457
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 458
    .line 459
    .line 460
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 461
    .line 462
    .line 463
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 464
    .line 465
    .line 466
    move-result-object v0

    .line 467
    if-ne v3, v5, :cond_13

    .line 468
    .line 469
    goto :goto_8

    .line 470
    :cond_13
    move/from16 v26, v10

    .line 471
    .line 472
    invoke-static {}, Ll/rxq0;->i()I

    .line 473
    .line 474
    .line 475
    move-result v10

    .line 476
    int-to-float v10, v10

    .line 477
    div-float v10, v26, v10

    .line 478
    .line 479
    :goto_8
    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 480
    .line 481
    .line 482
    move-result-object v10

    .line 483
    invoke-virtual {v3, v0, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 484
    .line 485
    .line 486
    goto :goto_9

    .line 487
    :catchall_0
    move/from16 v24, v0

    .line 488
    .line 489
    :catchall_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 490
    .line 491
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 492
    .line 493
    .line 494
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 495
    .line 496
    .line 497
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 498
    .line 499
    .line 500
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 501
    .line 502
    .line 503
    move-result-object v0

    .line 504
    invoke-virtual {v3, v0, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 505
    .line 506
    .line 507
    :goto_9
    add-int/lit8 v0, v24, 0x3

    .line 508
    .line 509
    move/from16 v10, p1

    .line 510
    .line 511
    move-object/from16 v24, v12

    .line 512
    .line 513
    :goto_a
    array-length v12, v4

    .line 514
    if-ge v0, v12, :cond_3

    .line 515
    .line 516
    const-string v12, "softirq"

    .line 517
    .line 518
    move/from16 v28, v0

    .line 519
    .line 520
    if-eqz v10, :cond_18

    .line 521
    .line 522
    const/4 v0, 0x1

    .line 523
    if-eq v10, v0, :cond_17

    .line 524
    .line 525
    const/4 v0, 0x2

    .line 526
    if-eq v10, v0, :cond_16

    .line 527
    .line 528
    const/4 v0, 0x3

    .line 529
    if-eq v10, v0, :cond_15

    .line 530
    .line 531
    const/4 v0, 0x4

    .line 532
    if-eq v10, v0, :cond_14

    .line 533
    .line 534
    const/4 v0, 0x5

    .line 535
    move-object/from16 v29, v4

    .line 536
    .line 537
    if-eq v10, v0, :cond_1d

    .line 538
    .line 539
    goto/16 :goto_f

    .line 540
    .line 541
    :cond_14
    move-object/from16 v29, v4

    .line 542
    .line 543
    goto :goto_e

    .line 544
    :cond_15
    move-object/from16 v29, v4

    .line 545
    .line 546
    goto :goto_d

    .line 547
    :cond_16
    move-object/from16 v29, v4

    .line 548
    .line 549
    goto :goto_c

    .line 550
    :cond_17
    move-object/from16 v29, v4

    .line 551
    .line 552
    goto :goto_b

    .line 553
    :cond_18
    aget-object v0, v4, v28

    .line 554
    .line 555
    move-object/from16 v29, v4

    .line 556
    .line 557
    const-string v4, "user"

    .line 558
    .line 559
    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 560
    .line 561
    .line 562
    move-result v0

    .line 563
    if-eqz v0, :cond_19

    .line 564
    .line 565
    move-object v12, v4

    .line 566
    const/4 v10, 0x1

    .line 567
    goto :goto_10

    .line 568
    :cond_19
    :goto_b
    aget-object v0, v29, v28

    .line 569
    .line 570
    const-string v4, "kernel"

    .line 571
    .line 572
    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 573
    .line 574
    .line 575
    move-result v0

    .line 576
    if-eqz v0, :cond_1a

    .line 577
    .line 578
    move-object v12, v4

    .line 579
    const/4 v10, 0x2

    .line 580
    goto :goto_10

    .line 581
    :cond_1a
    :goto_c
    aget-object v0, v29, v28

    .line 582
    .line 583
    const-string v4, "iowait"

    .line 584
    .line 585
    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 586
    .line 587
    .line 588
    move-result v0

    .line 589
    if-eqz v0, :cond_1b

    .line 590
    .line 591
    move-object v12, v4

    .line 592
    const/4 v10, 0x3

    .line 593
    goto :goto_10

    .line 594
    :cond_1b
    :goto_d
    aget-object v0, v29, v28

    .line 595
    .line 596
    const-string v4, "irq"

    .line 597
    .line 598
    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 599
    .line 600
    .line 601
    move-result v0

    .line 602
    if-eqz v0, :cond_1c

    .line 603
    .line 604
    move-object v12, v4

    .line 605
    const/4 v10, 0x4

    .line 606
    goto :goto_10

    .line 607
    :cond_1c
    :goto_e
    aget-object v0, v29, v28

    .line 608
    .line 609
    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 610
    .line 611
    .line 612
    move-result v0

    .line 613
    if-eqz v0, :cond_1d

    .line 614
    .line 615
    const/4 v10, 0x5

    .line 616
    goto :goto_10

    .line 617
    :cond_1d
    aget-object v0, v29, v28

    .line 618
    .line 619
    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 620
    .line 621
    .line 622
    move-result v0

    .line 623
    if-eqz v0, :cond_1e

    .line 624
    .line 625
    const/4 v10, 0x6

    .line 626
    goto :goto_10

    .line 627
    :cond_1e
    :goto_f
    const/4 v12, 0x0

    .line 628
    :goto_10
    if-eqz v12, :cond_20

    .line 629
    .line 630
    add-int/lit8 v0, v28, -0x1

    .line 631
    .line 632
    :try_start_2
    aget-object v0, v29, v0

    .line 633
    .line 634
    invoke-virtual {v0, v8, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 635
    .line 636
    .line 637
    move-result-object v0

    .line 638
    invoke-static {v0}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    .line 639
    .line 640
    .line 641
    move-result-object v0

    .line 642
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 643
    .line 644
    .line 645
    move-result v0

    .line 646
    new-instance v4, Ljava/lang/StringBuilder;

    .line 647
    .line 648
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 649
    .line 650
    .line 651
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 652
    .line 653
    .line 654
    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 655
    .line 656
    .line 657
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 658
    .line 659
    .line 660
    move-result-object v4

    .line 661
    if-ne v3, v5, :cond_1f

    .line 662
    .line 663
    goto :goto_11

    .line 664
    :cond_1f
    move/from16 v27, v0

    .line 665
    .line 666
    invoke-static {}, Ll/rxq0;->i()I

    .line 667
    .line 668
    .line 669
    move-result v0

    .line 670
    int-to-float v0, v0

    .line 671
    div-float v0, v27, v0

    .line 672
    .line 673
    :goto_11
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 674
    .line 675
    .line 676
    move-result-object v0

    .line 677
    invoke-virtual {v3, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 678
    .line 679
    .line 680
    :cond_20
    :goto_12
    const/4 v0, 0x6

    .line 681
    goto :goto_13

    .line 682
    :catchall_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 683
    .line 684
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 685
    .line 686
    .line 687
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 688
    .line 689
    .line 690
    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 691
    .line 692
    .line 693
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 694
    .line 695
    .line 696
    move-result-object v0

    .line 697
    invoke-virtual {v3, v0, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 698
    .line 699
    .line 700
    goto :goto_12

    .line 701
    :goto_13
    if-lt v10, v0, :cond_21

    .line 702
    .line 703
    goto/16 :goto_1

    .line 704
    .line 705
    :cond_21
    add-int/lit8 v0, v28, 0x3

    .line 706
    .line 707
    move-object/from16 v4, v29

    .line 708
    .line 709
    goto/16 :goto_a

    .line 710
    .line 711
    :cond_22
    move/from16 v22, v3

    .line 712
    .line 713
    move/from16 v23, v7

    .line 714
    .line 715
    move-object/from16 v25, v10

    .line 716
    .line 717
    move-object/from16 v24, v12

    .line 718
    .line 719
    goto/16 :goto_18

    .line 720
    .line 721
    :cond_23
    move/from16 v22, v3

    .line 722
    .line 723
    move/from16 v23, v7

    .line 724
    .line 725
    move-object/from16 v25, v10

    .line 726
    .line 727
    move-object/from16 v24, v12

    .line 728
    .line 729
    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 730
    .line 731
    .line 732
    move-result-object v8

    .line 733
    invoke-virtual {v8}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 734
    .line 735
    .line 736
    move-result-object v0

    .line 737
    const-string v3, "shortmsg"

    .line 738
    .line 739
    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 740
    .line 741
    .line 742
    move-result v3

    .line 743
    const/16 v4, 0x3a

    .line 744
    .line 745
    if-eqz v3, :cond_24

    .line 746
    .line 747
    invoke-virtual {v8, v4}, Ljava/lang/String;->indexOf(I)I

    .line 748
    .line 749
    .line 750
    move-result v3

    .line 751
    invoke-virtual {v8, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 752
    .line 753
    .line 754
    move/from16 v4, p1

    .line 755
    .line 756
    goto :goto_14

    .line 757
    :cond_24
    const-string v3, "reason:"

    .line 758
    .line 759
    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 760
    .line 761
    .line 762
    move-result v3

    .line 763
    if-eqz v3, :cond_2d

    .line 764
    .line 765
    invoke-virtual {v8, v4}, Ljava/lang/String;->indexOf(I)I

    .line 766
    .line 767
    .line 768
    move-result v3

    .line 769
    invoke-virtual {v8, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 770
    .line 771
    .line 772
    const/4 v4, 0x1

    .line 773
    :goto_14
    const-string v3, "input dispatch"

    .line 774
    .line 775
    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 776
    .line 777
    .line 778
    move-result v3

    .line 779
    if-eqz v3, :cond_25

    .line 780
    .line 781
    const-string v0, "Input dispatching timed out"

    .line 782
    .line 783
    :goto_15
    move-object/from16 v17, v0

    .line 784
    .line 785
    goto :goto_17

    .line 786
    :cond_25
    const-string v3, "broadcast of intent"

    .line 787
    .line 788
    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 789
    .line 790
    .line 791
    move-result v3

    .line 792
    if-eqz v3, :cond_26

    .line 793
    .line 794
    const-string v0, "Broadcast of Intent"

    .line 795
    .line 796
    goto :goto_15

    .line 797
    :cond_26
    const-string v3, "executing service"

    .line 798
    .line 799
    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 800
    .line 801
    .line 802
    move-result v7

    .line 803
    if-eqz v7, :cond_28

    .line 804
    .line 805
    const-string v0, "null"

    .line 806
    .line 807
    move-object/from16 v7, v16

    .line 808
    .line 809
    invoke-virtual {v0, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 810
    .line 811
    .line 812
    move-result v0

    .line 813
    if-eqz v0, :cond_27

    .line 814
    .line 815
    const-string v0, "service "

    .line 816
    .line 817
    invoke-virtual {v8, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 818
    .line 819
    .line 820
    move-result v0

    .line 821
    add-int/lit8 v0, v0, 0x8

    .line 822
    .line 823
    invoke-virtual {v8, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 824
    .line 825
    .line 826
    move-result-object v0

    .line 827
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 828
    .line 829
    .line 830
    move-result-object v16

    .line 831
    move-object/from16 v17, v3

    .line 832
    .line 833
    goto :goto_17

    .line 834
    :cond_27
    move-object/from16 v17, v3

    .line 835
    .line 836
    :goto_16
    move-object/from16 v16, v7

    .line 837
    .line 838
    goto :goto_17

    .line 839
    :cond_28
    move-object/from16 v7, v16

    .line 840
    .line 841
    const-string v3, "service.startforeground"

    .line 842
    .line 843
    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 844
    .line 845
    .line 846
    move-result v0

    .line 847
    if-eqz v0, :cond_29

    .line 848
    .line 849
    const-string v0, "not call Service.startForeground"

    .line 850
    .line 851
    move-object/from16 v17, v0

    .line 852
    .line 853
    goto :goto_16

    .line 854
    :cond_29
    move-object/from16 v16, v7

    .line 855
    .line 856
    move-object/from16 v17, v15

    .line 857
    .line 858
    :goto_17
    if-eqz v4, :cond_2a

    .line 859
    .line 860
    const/4 v0, 0x4

    .line 861
    const/4 v3, 0x2

    .line 862
    goto/16 :goto_2

    .line 863
    .line 864
    :cond_2a
    :goto_18
    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 865
    .line 866
    .line 867
    move-result-object v0

    .line 868
    const-string v3, "Load:"

    .line 869
    .line 870
    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 871
    .line 872
    .line 873
    move-result v4

    .line 874
    if-eqz v4, :cond_2c

    .line 875
    .line 876
    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 877
    .line 878
    .line 879
    move-result-object v0

    .line 880
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 881
    .line 882
    .line 883
    move-result-object v0

    .line 884
    const-string v2, "/"

    .line 885
    .line 886
    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 887
    .line 888
    .line 889
    move-result-object v0

    .line 890
    array-length v2, v0

    .line 891
    const/4 v4, 0x3

    .line 892
    if-ne v4, v2, :cond_2b

    .line 893
    .line 894
    move/from16 v2, p1

    .line 895
    .line 896
    :goto_19
    array-length v3, v0

    .line 897
    if-ge v2, v3, :cond_2b

    .line 898
    .line 899
    aget-object v3, v0, v2

    .line 900
    .line 901
    invoke-static {v3}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    .line 902
    .line 903
    .line 904
    move-result-object v3

    .line 905
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 906
    .line 907
    .line 908
    move-result v3

    .line 909
    aput v3, v21, v2

    .line 910
    .line 911
    add-int/lit8 v2, v2, 0x1

    .line 912
    .line 913
    goto :goto_19

    .line 914
    :cond_2b
    move v3, v4

    .line 915
    :goto_1a
    const/4 v0, 0x4

    .line 916
    goto :goto_1d

    .line 917
    :cond_2c
    const/4 v4, 0x3

    .line 918
    :goto_1b
    move/from16 v3, v22

    .line 919
    .line 920
    goto :goto_1a

    .line 921
    :cond_2d
    move-object/from16 v7, v16

    .line 922
    .line 923
    const/4 v4, 0x3

    .line 924
    const-string v2, "appfreeze"

    .line 925
    .line 926
    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 927
    .line 928
    .line 929
    move-result v0

    .line 930
    if-eqz v0, :cond_2f

    .line 931
    .line 932
    const-string v17, "AppFreeze"

    .line 933
    .line 934
    const/16 v3, 0xa

    .line 935
    .line 936
    move-object/from16 v16, v7

    .line 937
    .line 938
    goto :goto_1a

    .line 939
    :cond_2e
    move/from16 v22, v3

    .line 940
    .line 941
    move/from16 v23, v7

    .line 942
    .line 943
    move-object/from16 v25, v10

    .line 944
    .line 945
    move-object/from16 v24, v12

    .line 946
    .line 947
    move-object/from16 v7, v16

    .line 948
    .line 949
    const/4 v4, 0x3

    .line 950
    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 951
    .line 952
    .line 953
    move-result-object v0

    .line 954
    const-string v3, "tag:"

    .line 955
    .line 956
    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 957
    .line 958
    .line 959
    move-result v8

    .line 960
    if-eqz v8, :cond_2f

    .line 961
    .line 962
    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 963
    .line 964
    .line 965
    move-result-object v0

    .line 966
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 967
    .line 968
    .line 969
    move-result-object v16

    .line 970
    const/4 v0, 0x4

    .line 971
    const/4 v3, 0x1

    .line 972
    goto :goto_1d

    .line 973
    :cond_2f
    :goto_1c
    move-object/from16 v16, v7

    .line 974
    .line 975
    goto :goto_1b

    .line 976
    :goto_1d
    if-lt v3, v0, :cond_30

    .line 977
    .line 978
    :goto_1e
    move-object/from16 v7, v16

    .line 979
    .line 980
    move-object/from16 v0, v17

    .line 981
    .line 982
    goto :goto_20

    .line 983
    :cond_30
    :goto_1f
    add-int/lit8 v7, v23, 0x1

    .line 984
    .line 985
    move-object/from16 v0, p0

    .line 986
    .line 987
    move-object/from16 v2, v20

    .line 988
    .line 989
    move-object/from16 v4, v21

    .line 990
    .line 991
    move-object/from16 v12, v24

    .line 992
    .line 993
    move-object/from16 v10, v25

    .line 994
    .line 995
    const/4 v8, 0x1

    .line 996
    goto/16 :goto_0

    .line 997
    .line 998
    :cond_31
    move-object/from16 v25, v10

    .line 999
    .line 1000
    move-object/from16 v24, v12

    .line 1001
    .line 1002
    goto :goto_1e

    .line 1003
    :goto_20
    const-string v2, "anr_tag"

    .line 1004
    .line 1005
    invoke-virtual {v1, v2, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1006
    .line 1007
    .line 1008
    const-string v2, "anr_has_ago"

    .line 1009
    .line 1010
    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 1011
    .line 1012
    .line 1013
    move-result-object v3

    .line 1014
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1015
    .line 1016
    .line 1017
    const-string v2, "anr_reason"

    .line 1018
    .line 1019
    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1020
    .line 1021
    .line 1022
    const-string v0, "app"

    .line 1023
    .line 1024
    invoke-static {v11, v1, v0}, Ll/grq0;->f(Ljava/util/HashMap;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 1025
    .line 1026
    .line 1027
    invoke-static {v5, v1, v9}, Ll/grq0;->f(Ljava/util/HashMap;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 1028
    .line 1029
    .line 1030
    invoke-virtual/range {v25 .. v25}, Ljava/util/HashMap;->isEmpty()Z

    .line 1031
    .line 1032
    .line 1033
    move-result v0

    .line 1034
    const-string v2, "npth_anr_systemserver_total"

    .line 1035
    .line 1036
    const-string v3, "not found"

    .line 1037
    .line 1038
    if-eqz v0, :cond_32

    .line 1039
    .line 1040
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1041
    .line 1042
    .line 1043
    goto :goto_21

    .line 1044
    :cond_32
    invoke-static/range {v25 .. v25}, Ll/u5r0;->a(Ljava/util/Map;)Ljava/lang/Float;

    .line 1045
    .line 1046
    .line 1047
    move-result-object v0

    .line 1048
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 1049
    .line 1050
    .line 1051
    move-result v0

    .line 1052
    invoke-static {v0}, Ll/grq0;->l(F)Ljava/lang/String;

    .line 1053
    .line 1054
    .line 1055
    move-result-object v0

    .line 1056
    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1057
    .line 1058
    .line 1059
    :goto_21
    invoke-virtual {v13}, Ljava/util/HashMap;->isEmpty()Z

    .line 1060
    .line 1061
    .line 1062
    move-result v0

    .line 1063
    const-string v2, "npth_anr_kswapd_total"

    .line 1064
    .line 1065
    if-eqz v0, :cond_33

    .line 1066
    .line 1067
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1068
    .line 1069
    .line 1070
    goto :goto_22

    .line 1071
    :cond_33
    invoke-static {v13}, Ll/u5r0;->a(Ljava/util/Map;)Ljava/lang/Float;

    .line 1072
    .line 1073
    .line 1074
    move-result-object v0

    .line 1075
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 1076
    .line 1077
    .line 1078
    move-result v0

    .line 1079
    invoke-static {v0}, Ll/grq0;->l(F)Ljava/lang/String;

    .line 1080
    .line 1081
    .line 1082
    move-result-object v0

    .line 1083
    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1084
    .line 1085
    .line 1086
    :goto_22
    invoke-virtual/range {v24 .. v24}, Ljava/util/HashMap;->isEmpty()Z

    .line 1087
    .line 1088
    .line 1089
    move-result v0

    .line 1090
    const-string v2, "npth_anr_dex2oat_total"

    .line 1091
    .line 1092
    if-eqz v0, :cond_34

    .line 1093
    .line 1094
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1095
    .line 1096
    .line 1097
    goto :goto_23

    .line 1098
    :cond_34
    invoke-static/range {v24 .. v24}, Ll/u5r0;->a(Ljava/util/Map;)Ljava/lang/Float;

    .line 1099
    .line 1100
    .line 1101
    move-result-object v0

    .line 1102
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 1103
    .line 1104
    .line 1105
    move-result v0

    .line 1106
    invoke-static {v0}, Ll/grq0;->l(F)Ljava/lang/String;

    .line 1107
    .line 1108
    .line 1109
    move-result-object v0

    .line 1110
    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1111
    .line 1112
    .line 1113
    :goto_23
    return-void
.end method

.method private static f(Ljava/util/HashMap;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Float;",
            ">;",
            "Lorg/json/JSONObject;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "npth_anr_"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p0}, Ljava/util/HashMap;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const-string v1, "_total"

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p2, "not found"

    .line 28
    .line 29
    :goto_0
    invoke-virtual {p1, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const/4 v0, 0x0

    .line 42
    move v2, v0

    .line 43
    move v3, v2

    .line 44
    move v4, v3

    .line 45
    move v5, v4

    .line 46
    :cond_1
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 47
    .line 48
    .line 49
    move-result v6

    .line 50
    if-eqz v6, :cond_6

    .line 51
    .line 52
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    check-cast v6, Ljava/util/Map$Entry;

    .line 57
    .line 58
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v7

    .line 62
    check-cast v7, Ljava/lang/String;

    .line 63
    .line 64
    const-string v8, "user"

    .line 65
    .line 66
    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result v8

    .line 70
    if-eqz v8, :cond_2

    .line 71
    .line 72
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    check-cast v6, Ljava/lang/Float;

    .line 77
    .line 78
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    add-float/2addr v0, v6

    .line 83
    goto :goto_1

    .line 84
    :cond_2
    const-string v8, "kernel"

    .line 85
    .line 86
    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 87
    .line 88
    .line 89
    move-result v8

    .line 90
    if-eqz v8, :cond_3

    .line 91
    .line 92
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v6

    .line 96
    check-cast v6, Ljava/lang/Float;

    .line 97
    .line 98
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    .line 99
    .line 100
    .line 101
    move-result v6

    .line 102
    add-float/2addr v2, v6

    .line 103
    goto :goto_1

    .line 104
    :cond_3
    const-string v8, "iowait"

    .line 105
    .line 106
    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 107
    .line 108
    .line 109
    move-result v8

    .line 110
    if-eqz v8, :cond_4

    .line 111
    .line 112
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v6

    .line 116
    check-cast v6, Ljava/lang/Float;

    .line 117
    .line 118
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    .line 119
    .line 120
    .line 121
    move-result v6

    .line 122
    add-float/2addr v3, v6

    .line 123
    goto :goto_1

    .line 124
    :cond_4
    const-string v8, "irq"

    .line 125
    .line 126
    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 127
    .line 128
    .line 129
    move-result v8

    .line 130
    if-eqz v8, :cond_5

    .line 131
    .line 132
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v6

    .line 136
    check-cast v6, Ljava/lang/Float;

    .line 137
    .line 138
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    .line 139
    .line 140
    .line 141
    move-result v6

    .line 142
    add-float/2addr v4, v6

    .line 143
    goto :goto_1

    .line 144
    :cond_5
    const-string v8, "softirq"

    .line 145
    .line 146
    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 147
    .line 148
    .line 149
    move-result v7

    .line 150
    if-eqz v7, :cond_1

    .line 151
    .line 152
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v6

    .line 156
    check-cast v6, Ljava/lang/Float;

    .line 157
    .line 158
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    .line 159
    .line 160
    .line 161
    move-result v6

    .line 162
    add-float/2addr v5, v6

    .line 163
    goto :goto_1

    .line 164
    :cond_6
    add-float/2addr v0, v2

    .line 165
    add-float/2addr v0, v3

    .line 166
    add-float/2addr v0, v4

    .line 167
    add-float/2addr v0, v5

    .line 168
    invoke-virtual {p2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-static {v0}, Ll/grq0;->l(F)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    invoke-virtual {p1, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 177
    .line 178
    .line 179
    const-string p0, "_kernel_user_ratio"

    .line 180
    .line 181
    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-static {v2, v0}, Ll/grq0;->b(FF)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    invoke-virtual {p1, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 190
    .line 191
    .line 192
    const-string p0, "_iowait_user_ratio"

    .line 193
    .line 194
    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    invoke-static {v3, v0}, Ll/grq0;->b(FF)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p2

    .line 202
    goto/16 :goto_0
.end method

.method private g(Lorg/json/JSONArray;)V
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    if-nez v2, :cond_0

    .line 6
    .line 7
    goto/16 :goto_a

    .line 8
    .line 9
    :cond_0
    const/4 v3, 0x0

    .line 10
    iput-object v3, v1, Ll/grq0;->g:Lorg/json/JSONObject;

    .line 11
    .line 12
    iput-object v3, v1, Ll/grq0;->n:Lorg/json/JSONObject;

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    iput v4, v1, Ll/grq0;->o:I

    .line 16
    .line 17
    new-instance v5, Lorg/json/JSONArray;

    .line 18
    .line 19
    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    .line 20
    .line 21
    .line 22
    new-instance v6, Lorg/json/JSONArray;

    .line 23
    .line 24
    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance v0, Lorg/json/JSONArray;

    .line 28
    .line 29
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v7, "unknown"

    .line 33
    .line 34
    iput-object v7, v1, Ll/grq0;->i:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v7, v1, Ll/grq0;->j:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v7, v1, Ll/grq0;->k:Ljava/lang/String;

    .line 39
    .line 40
    const/4 v7, 0x3

    .line 41
    new-array v7, v7, [I

    .line 42
    .line 43
    aput v4, v7, v4

    .line 44
    .line 45
    const/4 v8, 0x1

    .line 46
    aput v4, v7, v8

    .line 47
    .line 48
    const/4 v9, 0x2

    .line 49
    aput v4, v7, v9

    .line 50
    .line 51
    move-object v10, v0

    .line 52
    move-object v0, v3

    .line 53
    move v11, v4

    .line 54
    move v12, v11

    .line 55
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    .line 56
    .line 57
    .line 58
    move-result v13

    .line 59
    if-ge v11, v13, :cond_17

    .line 60
    .line 61
    invoke-virtual {v2, v11}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v13

    .line 65
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v14

    .line 69
    const-string v15, "NPTH_CATCH"

    .line 70
    .line 71
    const/16 v3, 0x28

    .line 72
    .line 73
    move/from16 v16, v9

    .line 74
    .line 75
    const-string v9, "main"

    .line 76
    .line 77
    if-eqz v14, :cond_8

    .line 78
    .line 79
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    .line 80
    .line 81
    .line 82
    move-result v13

    .line 83
    if-lez v13, :cond_6

    .line 84
    .line 85
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result v13

    .line 89
    if-nez v13, :cond_6

    .line 90
    .line 91
    iget-object v13, v1, Ll/grq0;->g:Lorg/json/JSONObject;

    .line 92
    .line 93
    if-nez v13, :cond_1

    .line 94
    .line 95
    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v13

    .line 99
    if-eqz v13, :cond_1

    .line 100
    .line 101
    invoke-direct {v1, v10}, Ll/grq0;->r(Lorg/json/JSONArray;)Lorg/json/JSONObject;

    .line 102
    .line 103
    .line 104
    move-result-object v13

    .line 105
    iput-object v13, v1, Ll/grq0;->g:Lorg/json/JSONObject;

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_1
    invoke-direct {v1, v0, v10}, Ll/grq0;->c(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONObject;

    .line 109
    .line 110
    .line 111
    move-result-object v13

    .line 112
    invoke-virtual {v5, v13}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 113
    .line 114
    .line 115
    :goto_1
    :try_start_0
    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v9

    .line 119
    if-nez v9, :cond_2

    .line 120
    .line 121
    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(I)I

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    invoke-virtual {v0, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 133
    :catchall_0
    :cond_2
    move-object v3, v0

    .line 134
    invoke-direct {v1, v3}, Ll/grq0;->j(Ljava/lang/String;)Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    if-nez v0, :cond_6

    .line 139
    .line 140
    :try_start_1
    invoke-direct {v1, v10}, Ll/grq0;->p(Lorg/json/JSONArray;)[I

    .line 141
    .line 142
    .line 143
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 144
    goto :goto_2

    .line 145
    :catch_0
    move-exception v0

    .line 146
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 147
    .line 148
    .line 149
    invoke-static {v15, v0}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 150
    .line 151
    .line 152
    :catchall_1
    const/4 v0, 0x0

    .line 153
    :goto_2
    if-nez v0, :cond_3

    .line 154
    .line 155
    goto :goto_3

    .line 156
    :cond_3
    aget v9, v0, v4

    .line 157
    .line 158
    aget v13, v7, v4

    .line 159
    .line 160
    if-le v9, v13, :cond_4

    .line 161
    .line 162
    aput v9, v7, v4

    .line 163
    .line 164
    iput-object v3, v1, Ll/grq0;->i:Ljava/lang/String;

    .line 165
    .line 166
    :cond_4
    aget v9, v0, v8

    .line 167
    .line 168
    aget v13, v7, v8

    .line 169
    .line 170
    if-le v9, v13, :cond_5

    .line 171
    .line 172
    aput v9, v7, v8

    .line 173
    .line 174
    iput-object v3, v1, Ll/grq0;->j:Ljava/lang/String;

    .line 175
    .line 176
    :cond_5
    aget v0, v0, v16

    .line 177
    .line 178
    aget v9, v7, v16

    .line 179
    .line 180
    if-le v0, v9, :cond_6

    .line 181
    .line 182
    aput v0, v7, v16

    .line 183
    .line 184
    iput-object v3, v1, Ll/grq0;->k:Ljava/lang/String;

    .line 185
    .line 186
    :cond_6
    :goto_3
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    if-lez v0, :cond_7

    .line 191
    .line 192
    new-instance v0, Lorg/json/JSONArray;

    .line 193
    .line 194
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 195
    .line 196
    .line 197
    move-object v10, v0

    .line 198
    :cond_7
    move/from16 v14, v16

    .line 199
    .line 200
    const/4 v0, 0x0

    .line 201
    goto/16 :goto_9

    .line 202
    .line 203
    :cond_8
    if-eqz v12, :cond_14

    .line 204
    .line 205
    if-eq v12, v8, :cond_9

    .line 206
    .line 207
    move/from16 v14, v16

    .line 208
    .line 209
    goto/16 :goto_9

    .line 210
    .line 211
    :cond_9
    const-string v14, " prio="

    .line 212
    .line 213
    invoke-virtual {v13, v14}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 214
    .line 215
    .line 216
    move-result v14

    .line 217
    if-eqz v14, :cond_13

    .line 218
    .line 219
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    .line 220
    .line 221
    .line 222
    move-result v14

    .line 223
    if-lez v14, :cond_10

    .line 224
    .line 225
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 226
    .line 227
    .line 228
    move-result v14

    .line 229
    if-nez v14, :cond_10

    .line 230
    .line 231
    iget-object v14, v1, Ll/grq0;->g:Lorg/json/JSONObject;

    .line 232
    .line 233
    if-nez v14, :cond_a

    .line 234
    .line 235
    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    move-result v14

    .line 239
    if-eqz v14, :cond_a

    .line 240
    .line 241
    invoke-direct {v1, v10}, Ll/grq0;->r(Lorg/json/JSONArray;)Lorg/json/JSONObject;

    .line 242
    .line 243
    .line 244
    move-result-object v14

    .line 245
    iput-object v14, v1, Ll/grq0;->g:Lorg/json/JSONObject;

    .line 246
    .line 247
    goto :goto_4

    .line 248
    :cond_a
    invoke-direct {v1, v0, v10}, Ll/grq0;->c(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONObject;

    .line 249
    .line 250
    .line 251
    move-result-object v14

    .line 252
    invoke-virtual {v5, v14}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 253
    .line 254
    .line 255
    :goto_4
    :try_start_2
    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result v14

    .line 259
    if-nez v14, :cond_b

    .line 260
    .line 261
    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(I)I

    .line 262
    .line 263
    .line 264
    move-result v3

    .line 265
    invoke-virtual {v0, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v3

    .line 269
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 273
    :catchall_2
    :cond_b
    move-object v3, v0

    .line 274
    invoke-direct {v1, v3}, Ll/grq0;->j(Ljava/lang/String;)Z

    .line 275
    .line 276
    .line 277
    move-result v0

    .line 278
    if-nez v0, :cond_f

    .line 279
    .line 280
    :try_start_3
    invoke-direct {v1, v10}, Ll/grq0;->p(Lorg/json/JSONArray;)[I

    .line 281
    .line 282
    .line 283
    move-result-object v0
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 284
    goto :goto_5

    .line 285
    :catch_1
    move-exception v0

    .line 286
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 287
    .line 288
    .line 289
    invoke-static {v15, v0}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 290
    .line 291
    .line 292
    :catchall_3
    const/4 v0, 0x0

    .line 293
    :goto_5
    if-nez v0, :cond_c

    .line 294
    .line 295
    goto :goto_6

    .line 296
    :cond_c
    aget v14, v0, v4

    .line 297
    .line 298
    aget v15, v7, v4

    .line 299
    .line 300
    if-le v14, v15, :cond_d

    .line 301
    .line 302
    aput v14, v7, v4

    .line 303
    .line 304
    iput-object v3, v1, Ll/grq0;->i:Ljava/lang/String;

    .line 305
    .line 306
    :cond_d
    aget v14, v0, v8

    .line 307
    .line 308
    aget v15, v7, v8

    .line 309
    .line 310
    if-le v14, v15, :cond_e

    .line 311
    .line 312
    aput v14, v7, v8

    .line 313
    .line 314
    iput-object v3, v1, Ll/grq0;->j:Ljava/lang/String;

    .line 315
    .line 316
    :cond_e
    aget v0, v0, v16

    .line 317
    .line 318
    aget v14, v7, v16

    .line 319
    .line 320
    if-le v0, v14, :cond_f

    .line 321
    .line 322
    aput v0, v7, v16

    .line 323
    .line 324
    iput-object v3, v1, Ll/grq0;->k:Ljava/lang/String;

    .line 325
    .line 326
    :cond_f
    :goto_6
    move-object v0, v3

    .line 327
    :cond_10
    const/16 v3, 0x22

    .line 328
    .line 329
    :try_start_4
    invoke-virtual {v13, v3, v8}, Ljava/lang/String;->indexOf(II)I

    .line 330
    .line 331
    .line 332
    move-result v14

    .line 333
    invoke-virtual {v13, v8, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 334
    .line 335
    .line 336
    move-result-object v0

    .line 337
    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 338
    .line 339
    .line 340
    move-result v9

    .line 341
    if-nez v9, :cond_11

    .line 342
    .line 343
    new-instance v9, Ljava/lang/StringBuilder;

    .line 344
    .line 345
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 346
    .line 347
    .line 348
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 349
    .line 350
    .line 351
    const-string v14, "  ("

    .line 352
    .line 353
    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 354
    .line 355
    .line 356
    move/from16 v14, v16

    .line 357
    .line 358
    :try_start_5
    invoke-virtual {v13, v3, v14}, Ljava/lang/String;->indexOf(II)I

    .line 359
    .line 360
    .line 361
    move-result v3

    .line 362
    add-int/2addr v3, v8

    .line 363
    invoke-virtual {v13, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 364
    .line 365
    .line 366
    move-result-object v3

    .line 367
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 368
    .line 369
    .line 370
    const-string v3, " )"

    .line 371
    .line 372
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 373
    .line 374
    .line 375
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 376
    .line 377
    .line 378
    move-result-object v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_5

    .line 379
    goto :goto_7

    .line 380
    :catchall_4
    :cond_11
    move/from16 v14, v16

    .line 381
    .line 382
    :catchall_5
    :goto_7
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    .line 383
    .line 384
    .line 385
    move-result v3

    .line 386
    if-lez v3, :cond_12

    .line 387
    .line 388
    new-instance v10, Lorg/json/JSONArray;

    .line 389
    .line 390
    invoke-direct {v10}, Lorg/json/JSONArray;-><init>()V

    .line 391
    .line 392
    .line 393
    :cond_12
    invoke-virtual {v10, v13}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 394
    .line 395
    .line 396
    goto :goto_9

    .line 397
    :cond_13
    move/from16 v14, v16

    .line 398
    .line 399
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 400
    .line 401
    .line 402
    move-result v3

    .line 403
    if-eqz v3, :cond_12

    .line 404
    .line 405
    goto :goto_8

    .line 406
    :cond_14
    move/from16 v14, v16

    .line 407
    .line 408
    const-string v3, "DALVIK THREADS"

    .line 409
    .line 410
    invoke-virtual {v13, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 411
    .line 412
    .line 413
    move-result v3

    .line 414
    if-nez v3, :cond_15

    .line 415
    .line 416
    const-string v3, "suspend"

    .line 417
    .line 418
    invoke-virtual {v13, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 419
    .line 420
    .line 421
    move-result v3

    .line 422
    if-nez v3, :cond_15

    .line 423
    .line 424
    const-string v3, "\""

    .line 425
    .line 426
    invoke-virtual {v13, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 427
    .line 428
    .line 429
    move-result v3

    .line 430
    if-eqz v3, :cond_16

    .line 431
    .line 432
    :cond_15
    move v12, v8

    .line 433
    :cond_16
    :goto_8
    invoke-virtual {v6, v13}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 434
    .line 435
    .line 436
    :goto_9
    add-int/lit8 v11, v11, 0x1

    .line 437
    .line 438
    move v9, v14

    .line 439
    const/4 v3, 0x0

    .line 440
    goto/16 :goto_0

    .line 441
    .line 442
    :cond_17
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    .line 443
    .line 444
    .line 445
    move-result v0

    .line 446
    if-lez v0, :cond_18

    .line 447
    .line 448
    iput-object v6, v1, Ll/grq0;->m:Lorg/json/JSONArray;

    .line 449
    .line 450
    :try_start_6
    new-instance v0, Lorg/json/JSONObject;

    .line 451
    .line 452
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 453
    .line 454
    .line 455
    iput-object v0, v1, Ll/grq0;->n:Lorg/json/JSONObject;

    .line 456
    .line 457
    const-string v2, "thread_all_count"

    .line 458
    .line 459
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    .line 460
    .line 461
    .line 462
    move-result v3

    .line 463
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 464
    .line 465
    .line 466
    iget-object v0, v1, Ll/grq0;->n:Lorg/json/JSONObject;

    .line 467
    .line 468
    const-string v1, "thread_stacks"

    .line 469
    .line 470
    invoke-virtual {v0, v1, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_2

    .line 471
    .line 472
    .line 473
    goto :goto_a

    .line 474
    :catch_2
    move-exception v0

    .line 475
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 476
    .line 477
    .line 478
    :cond_18
    :goto_a
    return-void
.end method

.method private i(J)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/grq0;->v:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-boolean v1, p0, Ll/grq0;->v:Z

    .line 7
    .line 8
    invoke-direct {p0, p1, p2}, Ll/grq0;->n(J)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return v1
.end method

.method private j(Ljava/lang/String;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Ll/grq0;->A:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/nrq0;->j()Lorg/json/JSONArray;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v3, Ljava/util/LinkedList;

    .line 14
    .line 15
    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v3, p0, Ll/grq0;->A:Ljava/util/List;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    iput-object v3, p0, Ll/grq0;->l:Ljava/lang/String;

    .line 25
    .line 26
    move v3, v2

    .line 27
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    if-ge v3, v4, :cond_0

    .line 32
    .line 33
    :try_start_0
    iget-object v4, p0, Ll/grq0;->A:Ljava/util/List;

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .line 45
    .line 46
    :catchall_0
    add-int/lit8 v3, v3, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    iget-object v0, p0, Ll/grq0;->A:Ljava/util/List;

    .line 50
    .line 51
    if-nez v0, :cond_1

    .line 52
    .line 53
    new-instance v0, Ljava/util/LinkedList;

    .line 54
    .line 55
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Ll/grq0;->A:Ljava/util/List;

    .line 59
    .line 60
    const-string v3, "^main$"

    .line 61
    .line 62
    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/grq0;->A:Ljava/util/List;

    .line 70
    .line 71
    const-string v3, "^default_npth_thread$"

    .line 72
    .line 73
    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/grq0;->A:Ljava/util/List;

    .line 81
    .line 82
    const-string v3, "^RenderThread$"

    .line 83
    .line 84
    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/grq0;->A:Ljava/util/List;

    .line 92
    .line 93
    const-string v3, "^Jit thread pool worker thread.*$"

    .line 94
    .line 95
    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    :cond_1
    iget-object p0, p0, Ll/grq0;->A:Ljava/util/List;

    .line 103
    .line 104
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_3

    .line 113
    .line 114
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    check-cast v0, Ljava/util/regex/Pattern;

    .line 119
    .line 120
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-eqz v0, :cond_2

    .line 129
    .line 130
    return v2

    .line 131
    :cond_3
    return v1
.end method

.method public static synthetic k(Ll/grq0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/grq0;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method private static l(F)Ljava/lang/String;
    .locals 1

    .line 1
    const/high16 v0, 0x42c80000    # 100.0f

    .line 2
    .line 3
    div-float/2addr p0, v0

    .line 4
    invoke-static {p0}, Ll/grq0;->a(F)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method private n(J)V
    .locals 13

    .line 1
    const-string v0, "trace"

    .line 2
    .line 3
    const-string v1, "trace_"

    .line 4
    .line 5
    iget-wide v2, p0, Ll/grq0;->x:J

    .line 6
    .line 7
    iget-wide v4, p0, Ll/grq0;->w:J

    .line 8
    .line 9
    cmp-long v2, v2, v4

    .line 10
    .line 11
    const-string v3, "anr_trace"

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    const-string v5, "\n"

    .line 15
    .line 16
    const-string v6, ".txt"

    .line 17
    .line 18
    const/16 v7, 0x5f

    .line 19
    .line 20
    const/16 v8, 0x3a

    .line 21
    .line 22
    const/4 v9, 0x1

    .line 23
    const-string v10, "NPTH_CATCH"

    .line 24
    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 28
    .line 29
    .line 30
    move-result-wide v11

    .line 31
    iput-wide v11, p0, Ll/grq0;->p:J

    .line 32
    .line 33
    invoke-static {}, Ll/vxq0;->b()Lorg/json/JSONArray;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Ll/grq0;->r:Lorg/json/JSONArray;

    .line 38
    .line 39
    const/16 v0, 0x64

    .line 40
    .line 41
    invoke-static {v0, p1, p2}, Ll/t1r0;->a(IJ)Lorg/json/JSONArray;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Ll/grq0;->q:Lorg/json/JSONArray;

    .line 46
    .line 47
    invoke-static {p1, p2}, Ll/vxq0;->c(J)Lorg/json/JSONObject;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iput-object p1, p0, Ll/grq0;->h:Lorg/json/JSONObject;

    .line 52
    .line 53
    new-instance p1, Lorg/json/JSONObject;

    .line 54
    .line 55
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object p1, p0, Ll/grq0;->s:Lorg/json/JSONObject;

    .line 59
    .line 60
    iget-object p2, p0, Ll/grq0;->b:Landroid/content/Context;

    .line 61
    .line 62
    invoke-static {p2, p1}, Ll/lrq0;->d(Landroid/content/Context;Lorg/json/JSONObject;)V

    .line 63
    .line 64
    .line 65
    invoke-direct {p0}, Ll/grq0;->u()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iput-boolean p1, p0, Ll/grq0;->t:Z

    .line 70
    .line 71
    invoke-static {}, Ll/b350;->b()Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    xor-int/2addr p1, v9

    .line 76
    iput-boolean p1, p0, Ll/grq0;->f:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    .line 78
    :catchall_0
    :try_start_1
    iget-wide p1, p0, Ll/grq0;->p:J

    .line 79
    .line 80
    iput-wide p1, p0, Ll/grq0;->d:J

    .line 81
    .line 82
    invoke-static {}, Ll/j5r0;->k()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    new-instance p2, Ljava/io/File;

    .line 87
    .line 88
    new-instance v0, Ljava/io/File;

    .line 89
    .line 90
    iget-object v2, p0, Ll/grq0;->b:Landroid/content/Context;

    .line 91
    .line 92
    invoke-static {v2}, Ll/j5r0;->u(Landroid/content/Context;)Ljava/io/File;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-direct {v0, v2, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    new-instance v2, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    iget-object v1, p0, Ll/grq0;->b:Landroid/content/Context;

    .line 105
    .line 106
    invoke-static {v1}, Ll/lrq0;->l(Landroid/content/Context;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {v1, v8, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-direct {p2, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 132
    .line 133
    .line 134
    new-instance v0, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 137
    .line 138
    .line 139
    invoke-static {}, Ll/iuq0;->a()Ljava/text/DateFormat;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    new-instance v2, Ljava/util/Date;

    .line 144
    .line 145
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 146
    .line 147
    .line 148
    move-result-wide v6

    .line 149
    invoke-direct {v2, v6, v7}, Ljava/util/Date;-><init>(J)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-static {p2, v0, v4}, Ll/r3r0;->j(Ljava/io/File;Ljava/lang/String;Z)V

    .line 167
    .line 168
    .line 169
    invoke-static {v3, p1}, Ll/h5r0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-static {p1}, Lcom/apm/lite/nativecrash/NativeImpl;->d(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 177
    .line 178
    .line 179
    :try_start_2
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    invoke-static {p1}, Ll/r3r0;->u(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    iput-object p1, p0, Ll/grq0;->m:Lorg/json/JSONArray;

    .line 188
    .line 189
    invoke-direct {p0, p1}, Ll/grq0;->g(Lorg/json/JSONArray;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 190
    .line 191
    .line 192
    goto :goto_0

    .line 193
    :catchall_1
    move-exception p1

    .line 194
    :try_start_3
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 195
    .line 196
    .line 197
    invoke-static {v10, p1}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 198
    .line 199
    .line 200
    goto :goto_0

    .line 201
    :catchall_2
    move-exception p1

    .line 202
    goto :goto_1

    .line 203
    :catch_0
    :goto_0
    iget-object p1, p0, Ll/grq0;->g:Lorg/json/JSONObject;

    .line 204
    .line 205
    if-nez p1, :cond_0

    .line 206
    .line 207
    invoke-static {v9}, Ll/gwq0;->c(Z)Lorg/json/JSONObject;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    iput-object p1, p0, Ll/grq0;->g:Lorg/json/JSONObject;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 212
    .line 213
    goto :goto_2

    .line 214
    :goto_1
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 215
    .line 216
    .line 217
    invoke-static {v10, p1}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 218
    .line 219
    .line 220
    :cond_0
    :goto_2
    invoke-static {}, Ll/p1r0;->b()V

    .line 221
    .line 222
    .line 223
    goto/16 :goto_5

    .line 224
    .line 225
    :cond_1
    :try_start_4
    iget-wide p1, p0, Ll/grq0;->p:J

    .line 226
    .line 227
    iput-wide p1, p0, Ll/grq0;->d:J

    .line 228
    .line 229
    invoke-static {}, Ll/j5r0;->k()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    new-instance p2, Ljava/io/File;

    .line 234
    .line 235
    new-instance v1, Ljava/io/File;

    .line 236
    .line 237
    iget-object v2, p0, Ll/grq0;->b:Landroid/content/Context;

    .line 238
    .line 239
    invoke-static {v2}, Ll/j5r0;->u(Landroid/content/Context;)Ljava/io/File;

    .line 240
    .line 241
    .line 242
    move-result-object v2

    .line 243
    invoke-direct {v1, v2, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    new-instance v2, Ljava/lang/StringBuilder;

    .line 247
    .line 248
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    iget-object v0, p0, Ll/grq0;->b:Landroid/content/Context;

    .line 252
    .line 253
    invoke-static {v0}, Ll/lrq0;->l(Landroid/content/Context;)Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    invoke-virtual {v0, v8, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    invoke-direct {p2, v1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {p2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 279
    .line 280
    .line 281
    new-instance v0, Ljava/lang/StringBuilder;

    .line 282
    .line 283
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 284
    .line 285
    .line 286
    invoke-static {}, Ll/iuq0;->a()Ljava/text/DateFormat;

    .line 287
    .line 288
    .line 289
    move-result-object v1

    .line 290
    new-instance v2, Ljava/util/Date;

    .line 291
    .line 292
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 293
    .line 294
    .line 295
    move-result-wide v6

    .line 296
    invoke-direct {v2, v6, v7}, Ljava/util/Date;-><init>(J)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v1

    .line 303
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 307
    .line 308
    .line 309
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object v0

    .line 313
    invoke-static {p2, v0, v4}, Ll/r3r0;->j(Ljava/io/File;Ljava/lang/String;Z)V

    .line 314
    .line 315
    .line 316
    invoke-static {v3, p1}, Ll/h5r0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 317
    .line 318
    .line 319
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object p1

    .line 323
    invoke-static {p1}, Lcom/apm/lite/nativecrash/NativeImpl;->d(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 324
    .line 325
    .line 326
    :try_start_5
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object p1

    .line 330
    invoke-static {p1}, Ll/r3r0;->u(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 331
    .line 332
    .line 333
    move-result-object p1

    .line 334
    iput-object p1, p0, Ll/grq0;->m:Lorg/json/JSONArray;

    .line 335
    .line 336
    invoke-direct {p0, p1}, Ll/grq0;->g(Lorg/json/JSONArray;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 337
    .line 338
    .line 339
    goto :goto_3

    .line 340
    :catchall_3
    move-exception p1

    .line 341
    :try_start_6
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 342
    .line 343
    .line 344
    invoke-static {v10, p1}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 345
    .line 346
    .line 347
    goto :goto_3

    .line 348
    :catchall_4
    move-exception p1

    .line 349
    goto :goto_4

    .line 350
    :catch_1
    :goto_3
    iget-object p1, p0, Ll/grq0;->g:Lorg/json/JSONObject;

    .line 351
    .line 352
    if-nez p1, :cond_2

    .line 353
    .line 354
    invoke-static {v9}, Ll/gwq0;->c(Z)Lorg/json/JSONObject;

    .line 355
    .line 356
    .line 357
    move-result-object p1

    .line 358
    iput-object p1, p0, Ll/grq0;->g:Lorg/json/JSONObject;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 359
    .line 360
    goto :goto_5

    .line 361
    :goto_4
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 362
    .line 363
    .line 364
    invoke-static {v10, p1}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 365
    .line 366
    .line 367
    :cond_2
    :goto_5
    iget-wide p1, p0, Ll/grq0;->w:J

    .line 368
    .line 369
    iput-wide p1, p0, Ll/grq0;->x:J

    .line 370
    .line 371
    const-wide/16 v0, -0x1

    .line 372
    .line 373
    iput-wide v0, p0, Ll/grq0;->w:J

    .line 374
    .line 375
    cmp-long p1, p1, v0

    .line 376
    .line 377
    if-nez p1, :cond_3

    .line 378
    .line 379
    const-wide/16 p1, 0x1

    .line 380
    .line 381
    sub-long/2addr v0, p1

    .line 382
    iput-wide v0, p0, Ll/grq0;->x:J

    .line 383
    .line 384
    :cond_3
    return-void
.end method

.method private static o(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/s4r0;->a()Ll/owq0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/owq0;->d()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Ll/srl;

    .line 24
    .line 25
    :try_start_0
    sget-object v2, Lcom/apm/lite/CrashType;->ANR:Lcom/apm/lite/CrashType;

    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-interface {v1, v2, p0, v3}, Ll/srl;->a(Lcom/apm/lite/CrashType;Ljava/lang/String;Ljava/lang/Thread;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception v1

    .line 33
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 34
    .line 35
    .line 36
    const-string v2, "NPTH_CATCH"

    .line 37
    .line 38
    invoke-static {v2, v1}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    return-void
.end method

.method private p(Lorg/json/JSONArray;)[I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-ge v0, v1, :cond_3

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-nez v3, :cond_0

    .line 20
    .line 21
    const-string v3, "utm="

    .line 22
    .line 23
    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    const/4 v3, -0x1

    .line 29
    :goto_1
    if-lez v3, :cond_2

    .line 30
    .line 31
    iget-object p1, p0, Ll/grq0;->B:Ljava/util/regex/Pattern;

    .line 32
    .line 33
    if-nez p1, :cond_1

    .line 34
    .line 35
    const-string p1, "[^0-9]+"

    .line 36
    .line 37
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Ll/grq0;->B:Ljava/util/regex/Pattern;

    .line 42
    .line 43
    :cond_1
    iget-object p0, p0, Ll/grq0;->B:Ljava/util/regex/Pattern;

    .line 44
    .line 45
    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    if-eqz p0, :cond_3

    .line 54
    .line 55
    array-length p1, p0

    .line 56
    const/4 v0, 0x2

    .line 57
    if-lt p1, v0, :cond_3

    .line 58
    .line 59
    const/4 p1, 0x1

    .line 60
    :try_start_0
    aget-object p1, p0, p1

    .line 61
    .line 62
    invoke-static {p1}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    aget-object p0, p0, v0

    .line 71
    .line 72
    invoke-static {p0}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    add-int v0, p1, p0

    .line 81
    .line 82
    filled-new-array {p1, p0, v0}, [I

    .line 83
    .line 84
    .line 85
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    return-object p0

    .line 87
    :catchall_0
    const-string p0, "Err stack line: "

    .line 88
    .line 89
    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    return-object v2

    .line 97
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_3
    return-object v2
.end method

.method private q(J)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ll/n0r0;->l()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr p1, v0

    .line 6
    const-wide/16 v0, 0x7530

    .line 7
    .line 8
    cmp-long p0, p1, v0

    .line 9
    .line 10
    if-gez p0, :cond_0

    .line 11
    .line 12
    const-string p0, "0 - 30s"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    const-wide/32 v0, 0xea60

    .line 16
    .line 17
    .line 18
    cmp-long p0, p1, v0

    .line 19
    .line 20
    if-gez p0, :cond_1

    .line 21
    .line 22
    const-string p0, "30s - 1min"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    const-wide/32 v0, 0x1d4c0

    .line 26
    .line 27
    .line 28
    cmp-long p0, p1, v0

    .line 29
    .line 30
    if-gez p0, :cond_2

    .line 31
    .line 32
    const-string p0, "1min - 2min"

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_2
    const-wide/32 v0, 0x493e0

    .line 36
    .line 37
    .line 38
    cmp-long p0, p1, v0

    .line 39
    .line 40
    if-gez p0, :cond_3

    .line 41
    .line 42
    const-string p0, "2min - 5min"

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_3
    const-wide/32 v0, 0x927c0

    .line 46
    .line 47
    .line 48
    cmp-long p0, p1, v0

    .line 49
    .line 50
    if-gez p0, :cond_4

    .line 51
    .line 52
    const-string p0, "5min - 10min"

    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_4
    const-wide/32 v0, 0x1b7740

    .line 56
    .line 57
    .line 58
    cmp-long p0, p1, v0

    .line 59
    .line 60
    if-gez p0, :cond_5

    .line 61
    .line 62
    const-string p0, "10min - 30min"

    .line 63
    .line 64
    return-object p0

    .line 65
    :cond_5
    const-wide/32 v0, 0x36ee80

    .line 66
    .line 67
    .line 68
    cmp-long p0, p1, v0

    .line 69
    .line 70
    if-gez p0, :cond_6

    .line 71
    .line 72
    const-string p0, "30min - 1h"

    .line 73
    .line 74
    return-object p0

    .line 75
    :cond_6
    const-string p0, "1h - "

    .line 76
    .line 77
    return-object p0
.end method

.method private r(Lorg/json/JSONArray;)Lorg/json/JSONObject;
    .locals 4

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x100

    .line 7
    .line 8
    const/16 v2, 0x80

    .line 9
    .line 10
    invoke-static {v1, v2, p1}, Ll/t4r0;->b(IILorg/json/JSONArray;)Lorg/json/JSONArray;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    const/4 v3, 0x1

    .line 23
    if-eq v2, p1, :cond_0

    .line 24
    .line 25
    iget p1, p0, Ll/grq0;->o:I

    .line 26
    .line 27
    add-int/2addr p1, v3

    .line 28
    iput p1, p0, Ll/grq0;->o:I

    .line 29
    .line 30
    :cond_0
    :try_start_0
    const-string p0, "thread_number"

    .line 31
    .line 32
    invoke-virtual {v0, p0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 33
    .line 34
    .line 35
    new-instance p0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-ge p1, v2, :cond_1

    .line 46
    .line 47
    invoke-virtual {v1, p1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const/16 v2, 0xa

    .line 55
    .line 56
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    add-int/lit8 p1, p1, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    const-string p1, "mainStackFromTrace"

    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {v0, p1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    .line 70
    .line 71
    return-object v0

    .line 72
    :catch_0
    const/4 p0, 0x0

    .line 73
    return-object p0
.end method

.method private u()Z
    .locals 5

    .line 1
    iget-object p0, p0, Ll/grq0;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Ll/lrq0;->g(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 v0, p0, 0x1

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/euq0;->A()Ll/euq0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/euq0;->B()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    const-wide/16 v3, 0x7d0

    .line 20
    .line 21
    cmp-long p0, v1, v3

    .line 22
    .line 23
    if-gtz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :cond_0
    return v0
.end method

.method private v()Ljava/io/File;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/grq0;->C:Ljava/io/File;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/io/File;

    .line 6
    .line 7
    iget-object v1, p0, Ll/grq0;->b:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v3, "has_anr_signal_"

    .line 16
    .line 17
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v3, p0, Ll/grq0;->b:Landroid/content/Context;

    .line 21
    .line 22
    invoke-static {v3}, Ll/lrq0;->l(Landroid/content/Context;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    const-string v4, ":"

    .line 27
    .line 28
    const-string v5, "_"

    .line 29
    .line 30
    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ll/grq0;->C:Ljava/io/File;

    .line 45
    .line 46
    :cond_0
    iget-object p0, p0, Ll/grq0;->C:Ljava/io/File;

    .line 47
    .line 48
    return-object p0
.end method

.method private w()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/nrq0;->o()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method


# virtual methods
.method public d()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/grq0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/quq0;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/quq0;-><init>(Ll/grq0;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/grq0;->a:Ll/quq0;

    .line 12
    .line 13
    invoke-static {}, Ll/n0r0;->l()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iput-wide v0, p0, Ll/grq0;->d:J

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Ll/grq0;->c:Z

    .line 21
    .line 22
    return-void
.end method

.method public h(II)Z
    .locals 24

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    invoke-static {}, Ll/f0r0;->a()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    invoke-direct {v1, v2, v3}, Ll/grq0;->i(J)Z

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    iget-object v5, v1, Ll/grq0;->b:Landroid/content/Context;

    .line 16
    .line 17
    const/4 v6, 0x1

    .line 18
    invoke-static {v5, v6}, Ll/gwq0;->b(Landroid/content/Context;I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v5

    .line 22
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 23
    .line 24
    .line 25
    move-result-wide v7

    .line 26
    const-string v9, "normal"

    .line 27
    .line 28
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v10

    .line 32
    const/4 v11, 0x0

    .line 33
    if-eqz v10, :cond_0

    .line 34
    .line 35
    if-eqz v4, :cond_0

    .line 36
    .line 37
    move v10, v6

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    move v10, v11

    .line 40
    :goto_0
    const-string v12, "unknown"

    .line 41
    .line 42
    const-string v13, "unknown"

    .line 43
    .line 44
    const-string v14, "unknown"

    .line 45
    .line 46
    const-wide/16 v15, 0x4e20

    .line 47
    .line 48
    move/from16 p1, v6

    .line 49
    .line 50
    if-nez v4, :cond_2

    .line 51
    .line 52
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-nez v4, :cond_1

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    move/from16 v19, v0

    .line 60
    .line 61
    move v4, v11

    .line 62
    move/from16 v21, v4

    .line 63
    .line 64
    move-wide/from16 v17, v15

    .line 65
    .line 66
    const/4 v0, 0x0

    .line 67
    const/4 v6, 0x0

    .line 68
    const/4 v11, 0x0

    .line 69
    const/4 v15, 0x0

    .line 70
    const/16 v20, 0x0

    .line 71
    .line 72
    const/16 v22, 0x0

    .line 73
    .line 74
    goto/16 :goto_4

    .line 75
    .line 76
    :cond_2
    :goto_1
    iget-object v4, v1, Ll/grq0;->u:Ljava/lang/Object;

    .line 77
    .line 78
    monitor-enter v4

    .line 79
    xor-int/lit8 v7, v10, 0x1

    .line 80
    .line 81
    :try_start_0
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_9

    .line 82
    iget-object v4, v1, Ll/grq0;->g:Lorg/json/JSONObject;

    .line 83
    .line 84
    if-eqz v4, :cond_4

    .line 85
    .line 86
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 87
    .line 88
    .line 89
    move-result-wide v12

    .line 90
    move v8, v7

    .line 91
    iget-wide v6, v1, Ll/grq0;->d:J

    .line 92
    .line 93
    sub-long/2addr v12, v6

    .line 94
    cmp-long v4, v12, v15

    .line 95
    .line 96
    if-gtz v4, :cond_5

    .line 97
    .line 98
    if-eqz v10, :cond_3

    .line 99
    .line 100
    const-string v4, "trace_only"

    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_3
    const-string v4, "trace_last"

    .line 104
    .line 105
    :goto_2
    move-object v9, v4

    .line 106
    goto :goto_3

    .line 107
    :cond_4
    move v8, v7

    .line 108
    :cond_5
    iget-boolean v4, v1, Ll/grq0;->v:Z

    .line 109
    .line 110
    if-eqz v4, :cond_6

    .line 111
    .line 112
    iput-boolean v11, v1, Ll/grq0;->v:Z

    .line 113
    .line 114
    const-string v9, "trace_after"

    .line 115
    .line 116
    :cond_6
    invoke-direct {v1, v2, v3}, Ll/grq0;->n(J)V

    .line 117
    .line 118
    .line 119
    :goto_3
    iget-object v4, v1, Ll/grq0;->g:Lorg/json/JSONObject;

    .line 120
    .line 121
    iget-object v12, v1, Ll/grq0;->i:Ljava/lang/String;

    .line 122
    .line 123
    iget-object v13, v1, Ll/grq0;->j:Ljava/lang/String;

    .line 124
    .line 125
    iget-object v14, v1, Ll/grq0;->k:Ljava/lang/String;

    .line 126
    .line 127
    iget-object v6, v1, Ll/grq0;->m:Lorg/json/JSONArray;

    .line 128
    .line 129
    iget-object v7, v1, Ll/grq0;->r:Lorg/json/JSONArray;

    .line 130
    .line 131
    move-wide/from16 v17, v15

    .line 132
    .line 133
    iget-object v15, v1, Ll/grq0;->q:Lorg/json/JSONArray;

    .line 134
    .line 135
    iget-object v11, v1, Ll/grq0;->s:Lorg/json/JSONObject;

    .line 136
    .line 137
    move/from16 v19, v0

    .line 138
    .line 139
    iget-object v0, v1, Ll/grq0;->h:Lorg/json/JSONObject;

    .line 140
    .line 141
    move-object/from16 v20, v0

    .line 142
    .line 143
    iget-boolean v0, v1, Ll/grq0;->t:Z

    .line 144
    .line 145
    move-object/from16 v21, v6

    .line 146
    .line 147
    move-object/from16 v22, v7

    .line 148
    .line 149
    iget-wide v6, v1, Ll/grq0;->p:J

    .line 150
    .line 151
    move-object/from16 v23, v4

    .line 152
    .line 153
    if-nez v10, :cond_7

    .line 154
    .line 155
    const/4 v4, 0x0

    .line 156
    iput-object v4, v1, Ll/grq0;->g:Lorg/json/JSONObject;

    .line 157
    .line 158
    iput-object v4, v1, Ll/grq0;->m:Lorg/json/JSONArray;

    .line 159
    .line 160
    iput-object v4, v1, Ll/grq0;->q:Lorg/json/JSONArray;

    .line 161
    .line 162
    iput-object v4, v1, Ll/grq0;->h:Lorg/json/JSONObject;

    .line 163
    .line 164
    iput-object v4, v1, Ll/grq0;->r:Lorg/json/JSONArray;

    .line 165
    .line 166
    const-string v4, "unknown"

    .line 167
    .line 168
    iput-object v4, v1, Ll/grq0;->i:Ljava/lang/String;

    .line 169
    .line 170
    const-string v4, "unknown"

    .line 171
    .line 172
    iput-object v4, v1, Ll/grq0;->j:Ljava/lang/String;

    .line 173
    .line 174
    const-string v4, "unknown"

    .line 175
    .line 176
    iput-object v4, v1, Ll/grq0;->k:Ljava/lang/String;

    .line 177
    .line 178
    const/4 v4, 0x0

    .line 179
    iput v4, v1, Ll/grq0;->o:I

    .line 180
    .line 181
    :cond_7
    move-object/from16 v4, v21

    .line 182
    .line 183
    move/from16 v21, v0

    .line 184
    .line 185
    move-object v0, v4

    .line 186
    move v4, v8

    .line 187
    move-wide v7, v6

    .line 188
    move-object/from16 v6, v23

    .line 189
    .line 190
    :goto_4
    if-nez v10, :cond_c

    .line 191
    .line 192
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 193
    .line 194
    .line 195
    move-result v23

    .line 196
    if-eqz v23, :cond_c

    .line 197
    .line 198
    iget-object v0, v1, Ll/grq0;->g:Lorg/json/JSONObject;

    .line 199
    .line 200
    if-eqz v0, :cond_9

    .line 201
    .line 202
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 203
    .line 204
    .line 205
    move-result-wide v2

    .line 206
    iget-wide v4, v1, Ll/grq0;->d:J

    .line 207
    .line 208
    sub-long/2addr v2, v4

    .line 209
    cmp-long v0, v2, v17

    .line 210
    .line 211
    if-lez v0, :cond_9

    .line 212
    .line 213
    const/4 v4, 0x0

    .line 214
    iput-object v4, v1, Ll/grq0;->g:Lorg/json/JSONObject;

    .line 215
    .line 216
    iput-object v4, v1, Ll/grq0;->m:Lorg/json/JSONArray;

    .line 217
    .line 218
    iput-object v4, v1, Ll/grq0;->q:Lorg/json/JSONArray;

    .line 219
    .line 220
    iput-object v4, v1, Ll/grq0;->h:Lorg/json/JSONObject;

    .line 221
    .line 222
    iput-object v4, v1, Ll/grq0;->r:Lorg/json/JSONArray;

    .line 223
    .line 224
    const-string v0, "unknown"

    .line 225
    .line 226
    iput-object v0, v1, Ll/grq0;->i:Ljava/lang/String;

    .line 227
    .line 228
    const-string v0, "unknown"

    .line 229
    .line 230
    iput-object v0, v1, Ll/grq0;->j:Ljava/lang/String;

    .line 231
    .line 232
    const-string v0, "unknown"

    .line 233
    .line 234
    iput-object v0, v1, Ll/grq0;->k:Ljava/lang/String;

    .line 235
    .line 236
    const/4 v4, 0x0

    .line 237
    iput v4, v1, Ll/grq0;->o:I

    .line 238
    .line 239
    iget-object v0, v1, Ll/grq0;->e:Ljava/io/File;

    .line 240
    .line 241
    if-eqz v0, :cond_8

    .line 242
    .line 243
    invoke-static {v0}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 244
    .line 245
    .line 246
    :cond_8
    const/4 v2, 0x0

    .line 247
    iput-object v2, v1, Ll/grq0;->e:Ljava/io/File;

    .line 248
    .line 249
    return v4

    .line 250
    :cond_9
    iget-object v0, v1, Ll/grq0;->g:Lorg/json/JSONObject;

    .line 251
    .line 252
    if-eqz v0, :cond_b

    .line 253
    .line 254
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 255
    .line 256
    .line 257
    move-result-wide v2

    .line 258
    iget-wide v4, v1, Ll/grq0;->d:J

    .line 259
    .line 260
    sub-long/2addr v2, v4

    .line 261
    const-wide/16 v4, 0x7d0

    .line 262
    .line 263
    cmp-long v0, v2, v4

    .line 264
    .line 265
    if-lez v0, :cond_b

    .line 266
    .line 267
    invoke-static {}, Lcom/apm/lite/nativecrash/NativeImpl;->o()Z

    .line 268
    .line 269
    .line 270
    move-result v0

    .line 271
    if-eqz v0, :cond_a

    .line 272
    .line 273
    invoke-direct {v1}, Ll/grq0;->v()Ljava/io/File;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    invoke-static {v0}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 278
    .line 279
    .line 280
    :cond_a
    const/16 v16, 0x0

    .line 281
    .line 282
    return v16

    .line 283
    :cond_b
    const/16 v16, 0x0

    .line 284
    .line 285
    return v16

    .line 286
    :cond_c
    if-nez v6, :cond_e

    .line 287
    .line 288
    if-nez v15, :cond_d

    .line 289
    .line 290
    :try_start_1
    invoke-static {}, Ll/vxq0;->b()Lorg/json/JSONArray;

    .line 291
    .line 292
    .line 293
    move-result-object v22
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 294
    move/from16 v17, v4

    .line 295
    .line 296
    const/16 v4, 0x64

    .line 297
    .line 298
    :try_start_2
    invoke-static {v4, v2, v3}, Ll/t1r0;->a(IJ)Lorg/json/JSONArray;

    .line 299
    .line 300
    .line 301
    move-result-object v15

    .line 302
    invoke-static {v2, v3}, Ll/vxq0;->c(J)Lorg/json/JSONObject;

    .line 303
    .line 304
    .line 305
    move-result-object v20

    .line 306
    new-instance v2, Lorg/json/JSONObject;

    .line 307
    .line 308
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 309
    .line 310
    .line 311
    :try_start_3
    iget-object v3, v1, Ll/grq0;->b:Landroid/content/Context;

    .line 312
    .line 313
    invoke-static {v3, v2}, Ll/lrq0;->d(Landroid/content/Context;Lorg/json/JSONObject;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 314
    .line 315
    .line 316
    move-object v11, v2

    .line 317
    goto :goto_5

    .line 318
    :catchall_0
    move-object v11, v2

    .line 319
    goto :goto_6

    .line 320
    :cond_d
    move/from16 v17, v4

    .line 321
    .line 322
    :goto_5
    :try_start_4
    sget-boolean v2, Ll/grq0;->E:Z

    .line 323
    .line 324
    invoke-static {v2}, Ll/gwq0;->c(Z)Lorg/json/JSONObject;

    .line 325
    .line 326
    .line 327
    move-result-object v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 328
    :catchall_1
    :goto_6
    move-object/from16 v2, v20

    .line 329
    .line 330
    move-object/from16 v3, v22

    .line 331
    .line 332
    goto :goto_7

    .line 333
    :catchall_2
    :cond_e
    move/from16 v17, v4

    .line 334
    .line 335
    goto :goto_6

    .line 336
    :goto_7
    if-eqz v6, :cond_1d

    .line 337
    .line 338
    invoke-virtual {v6}, Lorg/json/JSONObject;->length()I

    .line 339
    .line 340
    .line 341
    move-result v4

    .line 342
    if-lez v4, :cond_1d

    .line 343
    .line 344
    :try_start_5
    const-string v4, "pid"

    .line 345
    .line 346
    move/from16 v18, v10

    .line 347
    .line 348
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 349
    .line 350
    .line 351
    move-result v10

    .line 352
    invoke-virtual {v6, v4, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 353
    .line 354
    .line 355
    const-string v4, "package"

    .line 356
    .line 357
    iget-object v10, v1, Ll/grq0;->b:Landroid/content/Context;

    .line 358
    .line 359
    invoke-virtual {v10}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object v10

    .line 363
    invoke-virtual {v6, v4, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 364
    .line 365
    .line 366
    const-string v4, "is_remote_process"

    .line 367
    .line 368
    const/4 v10, 0x0

    .line 369
    invoke-virtual {v6, v4, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 370
    .line 371
    .line 372
    const-string v4, "is_new_stack"

    .line 373
    .line 374
    const/16 v10, 0xa

    .line 375
    .line 376
    invoke-virtual {v6, v4, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 377
    .line 378
    .line 379
    new-instance v4, Ll/gsq0;

    .line 380
    .line 381
    new-instance v10, Lorg/json/JSONObject;

    .line 382
    .line 383
    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 384
    .line 385
    .line 386
    invoke-direct {v4, v10}, Ll/gsq0;-><init>(Lorg/json/JSONObject;)V

    .line 387
    .line 388
    .line 389
    const-string v10, "data"

    .line 390
    .line 391
    move-object/from16 v20, v6

    .line 392
    .line 393
    invoke-virtual/range {v20 .. v20}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 394
    .line 395
    .line 396
    move-result-object v6

    .line 397
    invoke-virtual {v4, v10, v6}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 398
    .line 399
    .line 400
    const-string v6, "is_anr"

    .line 401
    .line 402
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 403
    .line 404
    .line 405
    move-result-object v10

    .line 406
    invoke-virtual {v4, v6, v10}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 407
    .line 408
    .line 409
    const-string v6, "anrType"

    .line 410
    .line 411
    invoke-virtual {v4, v6, v9}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 412
    .line 413
    .line 414
    const-string v6, "history_message"

    .line 415
    .line 416
    invoke-virtual {v4, v6, v3}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 417
    .line 418
    .line 419
    const-string v3, "current_message"

    .line 420
    .line 421
    invoke-virtual {v4, v3, v2}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 422
    .line 423
    .line 424
    const-string v2, "pending_messages"

    .line 425
    .line 426
    invoke-virtual {v4, v2, v15}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 427
    .line 428
    .line 429
    const-string v2, "anr_time"

    .line 430
    .line 431
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 432
    .line 433
    .line 434
    move-result-wide v22

    .line 435
    invoke-static/range {v22 .. v23}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 436
    .line 437
    .line 438
    move-result-object v3

    .line 439
    invoke-virtual {v4, v2, v3}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 440
    .line 441
    .line 442
    const-string v2, "crash_time"

    .line 443
    .line 444
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 445
    .line 446
    .line 447
    move-result-object v3

    .line 448
    invoke-virtual {v4, v2, v3}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 449
    .line 450
    .line 451
    invoke-virtual {v4, v11}, Ll/gsq0;->y(Lorg/json/JSONObject;)V

    .line 452
    .line 453
    .line 454
    const-string v2, "anr_info"

    .line 455
    .line 456
    if-eqz v18, :cond_f

    .line 457
    .line 458
    const-string v3, "no anr info"

    .line 459
    .line 460
    goto :goto_8

    .line 461
    :catchall_3
    move-exception v0

    .line 462
    goto/16 :goto_f

    .line 463
    .line 464
    :cond_f
    move-object v3, v5

    .line 465
    :goto_8
    invoke-virtual {v4, v2, v3}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 466
    .line 467
    .line 468
    if-eqz v0, :cond_10

    .line 469
    .line 470
    const-string v2, "dump_trace"

    .line 471
    .line 472
    invoke-virtual {v4, v2, v0}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 473
    .line 474
    .line 475
    :cond_10
    const-string v0, "all_thread_stacks"

    .line 476
    .line 477
    if-nez v18, :cond_12

    .line 478
    .line 479
    iget-object v2, v1, Ll/grq0;->n:Lorg/json/JSONObject;

    .line 480
    .line 481
    if-eqz v2, :cond_11

    .line 482
    .line 483
    invoke-virtual {v2}, Lorg/json/JSONObject;->length()I

    .line 484
    .line 485
    .line 486
    move-result v2

    .line 487
    if-nez v2, :cond_12

    .line 488
    .line 489
    :cond_11
    const/4 v2, 0x0

    .line 490
    invoke-static {v2}, Ll/d6r0;->r(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 491
    .line 492
    .line 493
    move-result-object v3

    .line 494
    goto :goto_9

    .line 495
    :cond_12
    iget-object v3, v1, Ll/grq0;->n:Lorg/json/JSONObject;

    .line 496
    .line 497
    :goto_9
    invoke-virtual {v4, v0, v3}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 498
    .line 499
    .line 500
    invoke-static {}, Ll/k0r0;->d()Ll/k0r0;

    .line 501
    .line 502
    .line 503
    move-result-object v0

    .line 504
    sget-object v2, Lcom/apm/lite/CrashType;->ANR:Lcom/apm/lite/CrashType;

    .line 505
    .line 506
    invoke-virtual {v0, v2, v4}, Ll/k0r0;->a(Lcom/apm/lite/CrashType;Ll/gsq0;)Ll/gsq0;

    .line 507
    .line 508
    .line 509
    move-result-object v3

    .line 510
    const-string v0, "is_background"

    .line 511
    .line 512
    invoke-static/range {v21 .. v21}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 513
    .line 514
    .line 515
    move-result-object v4

    .line 516
    invoke-virtual {v3, v0, v4}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 517
    .line 518
    .line 519
    const-string v0, "logcat"

    .line 520
    .line 521
    invoke-static {}, Ll/n0r0;->h()Ljava/lang/String;

    .line 522
    .line 523
    .line 524
    move-result-object v4

    .line 525
    invoke-static {v4}, Ll/h4r0;->b(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 526
    .line 527
    .line 528
    move-result-object v4

    .line 529
    invoke-virtual {v3, v0, v4}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 530
    .line 531
    .line 532
    const-string v0, "has_dump"

    .line 533
    .line 534
    const-string v4, "true"

    .line 535
    .line 536
    invoke-virtual {v3, v0, v4}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 537
    .line 538
    .line 539
    const-string v0, "crash_uuid"

    .line 540
    .line 541
    const/4 v4, 0x0

    .line 542
    invoke-static {v7, v8, v2, v4, v4}, Ll/n0r0;->a(JLcom/apm/lite/CrashType;ZZ)Ljava/lang/String;

    .line 543
    .line 544
    .line 545
    move-result-object v2

    .line 546
    invoke-virtual {v3, v0, v2}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 547
    .line 548
    .line 549
    const-string v0, "jiffy"

    .line 550
    .line 551
    invoke-static {}, Ll/e5r0;->a()J

    .line 552
    .line 553
    .line 554
    move-result-wide v10

    .line 555
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 556
    .line 557
    .line 558
    move-result-object v2

    .line 559
    invoke-virtual {v3, v0, v2}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 560
    .line 561
    .line 562
    invoke-virtual {v3}, Ll/gsq0;->G()Lorg/json/JSONObject;

    .line 563
    .line 564
    .line 565
    move-result-object v0

    .line 566
    const-string v2, "filters"

    .line 567
    .line 568
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 569
    .line 570
    .line 571
    move-result-object v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 572
    if-nez v0, :cond_13

    .line 573
    .line 574
    :try_start_6
    new-instance v2, Lorg/json/JSONObject;

    .line 575
    .line 576
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_6

    .line 577
    .line 578
    .line 579
    :try_start_7
    const-string v0, "filters"

    .line 580
    .line 581
    invoke-virtual {v3, v0, v2}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 582
    .line 583
    .line 584
    goto :goto_a

    .line 585
    :catchall_4
    move-object v0, v2

    .line 586
    goto/16 :goto_d

    .line 587
    .line 588
    :cond_13
    move-object v2, v0

    .line 589
    :goto_a
    const-string v0, "anrType"

    .line 590
    .line 591
    invoke-virtual {v2, v0, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 592
    .line 593
    .line 594
    const-string v0, "max_utm_thread"

    .line 595
    .line 596
    invoke-virtual {v2, v0, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 597
    .line 598
    .line 599
    const-string v0, "max_stm_thread"

    .line 600
    .line 601
    invoke-virtual {v2, v0, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 602
    .line 603
    .line 604
    const-string v0, "max_utm_stm_thread"

    .line 605
    .line 606
    invoke-virtual {v2, v0, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 607
    .line 608
    .line 609
    const-string v0, "max_utm_thread_version"

    .line 610
    .line 611
    iget-object v4, v1, Ll/grq0;->l:Ljava/lang/String;

    .line 612
    .line 613
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 614
    .line 615
    .line 616
    const-string v0, "crash_length"

    .line 617
    .line 618
    invoke-direct {v1, v7, v8}, Ll/grq0;->q(J)Ljava/lang/String;

    .line 619
    .line 620
    .line 621
    move-result-object v4

    .line 622
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 623
    .line 624
    .line 625
    const-string v0, "disable_looper_monitor"

    .line 626
    .line 627
    invoke-static {}, Ll/nrq0;->l()Z

    .line 628
    .line 629
    .line 630
    move-result v4

    .line 631
    invoke-static {v4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 632
    .line 633
    .line 634
    move-result-object v4

    .line 635
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 636
    .line 637
    .line 638
    const-string v0, "sdk_version"

    .line 639
    .line 640
    const-string v4, "0.0.2"

    .line 641
    .line 642
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 643
    .line 644
    .line 645
    const-string v0, "has_logcat"

    .line 646
    .line 647
    invoke-virtual {v3}, Ll/gsq0;->o()Z

    .line 648
    .line 649
    .line 650
    move-result v4

    .line 651
    invoke-static {v4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 652
    .line 653
    .line 654
    move-result-object v4

    .line 655
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 656
    .line 657
    .line 658
    const-string v0, "memory_leak"

    .line 659
    .line 660
    invoke-virtual {v3}, Ll/gsq0;->E()Z

    .line 661
    .line 662
    .line 663
    move-result v4

    .line 664
    invoke-static {v4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 665
    .line 666
    .line 667
    move-result-object v4

    .line 668
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 669
    .line 670
    .line 671
    const-string v0, "fd_leak"

    .line 672
    .line 673
    invoke-virtual {v3}, Ll/gsq0;->A()Z

    .line 674
    .line 675
    .line 676
    move-result v4

    .line 677
    invoke-static {v4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 678
    .line 679
    .line 680
    move-result-object v4

    .line 681
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 682
    .line 683
    .line 684
    const-string v0, "threads_leak"

    .line 685
    .line 686
    invoke-virtual {v3}, Ll/gsq0;->D()Z

    .line 687
    .line 688
    .line 689
    move-result v4

    .line 690
    invoke-static {v4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 691
    .line 692
    .line 693
    move-result-object v4

    .line 694
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 695
    .line 696
    .line 697
    const-string v0, "is_64_devices"

    .line 698
    .line 699
    invoke-static {}, Ll/hwq0;->f()Z

    .line 700
    .line 701
    .line 702
    move-result v4

    .line 703
    invoke-static {v4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 704
    .line 705
    .line 706
    move-result-object v4

    .line 707
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 708
    .line 709
    .line 710
    const-string v0, "is_64_runtime"

    .line 711
    .line 712
    invoke-static {}, Lcom/apm/lite/nativecrash/NativeImpl;->n()Z

    .line 713
    .line 714
    .line 715
    move-result v4

    .line 716
    invoke-static {v4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 717
    .line 718
    .line 719
    move-result-object v4

    .line 720
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 721
    .line 722
    .line 723
    const-string v0, "is_x86_devices"

    .line 724
    .line 725
    invoke-static {}, Ll/hwq0;->j()Z

    .line 726
    .line 727
    .line 728
    move-result v4

    .line 729
    invoke-static {v4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 730
    .line 731
    .line 732
    move-result-object v4

    .line 733
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 734
    .line 735
    .line 736
    const-string v0, "has_meminfo_file"

    .line 737
    .line 738
    invoke-virtual {v3}, Ll/gsq0;->F()Z

    .line 739
    .line 740
    .line 741
    move-result v4

    .line 742
    invoke-static {v4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 743
    .line 744
    .line 745
    move-result-object v4

    .line 746
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 747
    .line 748
    .line 749
    const-string v0, "is_root"

    .line 750
    .line 751
    invoke-static {}, Ll/nwq0;->y()Z

    .line 752
    .line 753
    .line 754
    move-result v4

    .line 755
    if-eqz v4, :cond_14

    .line 756
    .line 757
    const-string v4, "true"

    .line 758
    .line 759
    goto :goto_b

    .line 760
    :cond_14
    const-string v4, "false"

    .line 761
    .line 762
    :goto_b
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 763
    .line 764
    .line 765
    const-string v0, "anr_normal_trace"

    .line 766
    .line 767
    iget-boolean v4, v1, Ll/grq0;->v:Z

    .line 768
    .line 769
    xor-int/lit8 v4, v4, 0x1

    .line 770
    .line 771
    invoke-static {v4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 772
    .line 773
    .line 774
    move-result-object v4

    .line 775
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 776
    .line 777
    .line 778
    const-string v0, "anr_no_run"

    .line 779
    .line 780
    invoke-static/range {v19 .. v19}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 781
    .line 782
    .line 783
    move-result-object v4

    .line 784
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 785
    .line 786
    .line 787
    const-string v0, "crash_after_crash"

    .line 788
    .line 789
    invoke-static {}, Ll/b350;->b()Z

    .line 790
    .line 791
    .line 792
    move-result v4

    .line 793
    if-eqz v4, :cond_15

    .line 794
    .line 795
    const-string v4, "true"

    .line 796
    .line 797
    goto :goto_c

    .line 798
    :cond_15
    const-string v4, "false"

    .line 799
    .line 800
    :goto_c
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 801
    .line 802
    .line 803
    const-string v0, "from_file"

    .line 804
    .line 805
    invoke-static {}, Ll/gwq0;->d()Z

    .line 806
    .line 807
    .line 808
    move-result v4

    .line 809
    invoke-static {v4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 810
    .line 811
    .line 812
    move-result-object v4

    .line 813
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 814
    .line 815
    .line 816
    const-string v0, "has_dump"

    .line 817
    .line 818
    const-string v4, "true"

    .line 819
    .line 820
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 821
    .line 822
    .line 823
    const-string v0, "from_kill"

    .line 824
    .line 825
    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 826
    .line 827
    .line 828
    move-result-object v4

    .line 829
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 830
    .line 831
    .line 832
    const-string v0, "last_resume_activity"

    .line 833
    .line 834
    invoke-static {}, Ll/euq0;->A()Ll/euq0;

    .line 835
    .line 836
    .line 837
    move-result-object v4

    .line 838
    invoke-virtual {v4}, Ll/euq0;->K()Ljava/lang/String;

    .line 839
    .line 840
    .line 841
    move-result-object v4

    .line 842
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 843
    .line 844
    .line 845
    iget v0, v1, Ll/grq0;->o:I

    .line 846
    .line 847
    if-lez v0, :cond_16

    .line 848
    .line 849
    const-string v4, "may_have_stack_overflow"

    .line 850
    .line 851
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 852
    .line 853
    .line 854
    move-result-object v0

    .line 855
    invoke-virtual {v2, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 856
    .line 857
    .line 858
    :cond_16
    if-nez v18, :cond_17

    .line 859
    .line 860
    :try_start_8
    invoke-direct {v1, v5, v2}, Ll/grq0;->e(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    .line 861
    .line 862
    .line 863
    goto :goto_e

    .line 864
    :catchall_5
    move-exception v0

    .line 865
    :try_start_9
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 866
    .line 867
    .line 868
    const-string v4, "NPTH_CATCH"

    .line 869
    .line 870
    invoke-static {v4, v0}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 871
    .line 872
    .line 873
    goto :goto_e

    .line 874
    :cond_17
    invoke-direct {v1}, Ll/grq0;->w()Z

    .line 875
    .line 876
    .line 877
    move-result v0

    .line 878
    if-nez v0, :cond_18

    .line 879
    .line 880
    const-string v0, "aid"

    .line 881
    .line 882
    invoke-virtual {v3}, Ll/gsq0;->H()Ll/hwq0;

    .line 883
    .line 884
    .line 885
    move-result-object v4

    .line 886
    invoke-virtual {v4}, Ll/hwq0;->s()Lorg/json/JSONObject;

    .line 887
    .line 888
    .line 889
    move-result-object v4

    .line 890
    const-string v6, "aid"

    .line 891
    .line 892
    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 893
    .line 894
    .line 895
    move-result-object v4

    .line 896
    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 897
    .line 898
    .line 899
    move-result-object v4

    .line 900
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .line 901
    .line 902
    .line 903
    goto :goto_e

    .line 904
    :catchall_6
    :goto_d
    move-object v2, v0

    .line 905
    :cond_18
    :goto_e
    if-eqz v18, :cond_19

    .line 906
    .line 907
    :try_start_a
    invoke-static {}, Lcom/apm/lite/j/e;->s()Ljava/lang/String;

    .line 908
    .line 909
    .line 910
    move-result-object v0

    .line 911
    new-instance v2, Ljava/io/File;

    .line 912
    .line 913
    iget-object v4, v1, Ll/grq0;->b:Landroid/content/Context;

    .line 914
    .line 915
    invoke-static {v4}, Ll/j5r0;->b(Landroid/content/Context;)Ljava/io/File;

    .line 916
    .line 917
    .line 918
    move-result-object v4

    .line 919
    sget-object v5, Lcom/apm/lite/CrashType;->ANR:Lcom/apm/lite/CrashType;

    .line 920
    .line 921
    const/4 v10, 0x0

    .line 922
    invoke-static {v7, v8, v5, v10, v10}, Ll/n0r0;->a(JLcom/apm/lite/CrashType;ZZ)Ljava/lang/String;

    .line 923
    .line 924
    .line 925
    move-result-object v5

    .line 926
    invoke-direct {v2, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 927
    .line 928
    .line 929
    iput-object v2, v1, Ll/grq0;->e:Ljava/io/File;

    .line 930
    .line 931
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 932
    .line 933
    .line 934
    move-result-object v1

    .line 935
    invoke-virtual {v3}, Ll/gsq0;->G()Lorg/json/JSONObject;

    .line 936
    .line 937
    .line 938
    move-result-object v3

    .line 939
    invoke-static {}, Lcom/apm/lite/j/e;->q()Z

    .line 940
    .line 941
    .line 942
    move-result v4

    .line 943
    invoke-static {v2, v1, v0, v3, v4}, Ll/r3r0;->d(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Z)Ljava/lang/String;

    .line 944
    .line 945
    .line 946
    goto/16 :goto_10

    .line 947
    .line 948
    :cond_19
    iget-object v0, v1, Ll/grq0;->e:Ljava/io/File;

    .line 949
    .line 950
    if-eqz v0, :cond_1a

    .line 951
    .line 952
    invoke-static {v0}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 953
    .line 954
    .line 955
    const/4 v4, 0x0

    .line 956
    iput-object v4, v1, Ll/grq0;->e:Ljava/io/File;

    .line 957
    .line 958
    :cond_1a
    invoke-static {}, Ll/bsq0;->a()Ll/bsq0;

    .line 959
    .line 960
    .line 961
    move-result-object v0

    .line 962
    sget-object v4, Lcom/apm/lite/CrashType;->ANR:Lcom/apm/lite/CrashType;

    .line 963
    .line 964
    invoke-static {}, Ll/n0r0;->g()Ljava/lang/String;

    .line 965
    .line 966
    .line 967
    move-result-object v6

    .line 968
    invoke-virtual {v0, v4, v7, v8, v6}, Ll/bsq0;->b(Lcom/apm/lite/CrashType;JLjava/lang/String;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 969
    .line 970
    .line 971
    :try_start_b
    invoke-static {}, Ll/p1r0;->g()Ljava/io/File;

    .line 972
    .line 973
    .line 974
    move-result-object v0

    .line 975
    invoke-virtual {v0}, Ljava/io/File;->length()J

    .line 976
    .line 977
    .line 978
    move-result-wide v9

    .line 979
    const-wide/16 v11, 0x400

    .line 980
    .line 981
    cmp-long v0, v9, v11

    .line 982
    .line 983
    if-lez v0, :cond_1b

    .line 984
    .line 985
    const-string v0, "has_system_traces"

    .line 986
    .line 987
    const-string v4, "true"

    .line 988
    .line 989
    invoke-virtual {v3, v0, v4}, Ll/gsq0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/gsq0;
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_7

    .line 990
    .line 991
    .line 992
    :catchall_7
    :cond_1b
    :try_start_c
    invoke-static {}, Ll/n0r0;->h()Ljava/lang/String;

    .line 993
    .line 994
    .line 995
    move-result-object v0

    .line 996
    invoke-static {v0}, Ll/j5r0;->q(Ljava/lang/String;)Ljava/io/File;

    .line 997
    .line 998
    .line 999
    move-result-object v0

    .line 1000
    invoke-static {}, Ll/n0r0;->h()Ljava/lang/String;

    .line 1001
    .line 1002
    .line 1003
    move-result-object v4

    .line 1004
    invoke-static {v4}, Ll/j5r0;->t(Ljava/lang/String;)Ljava/io/File;

    .line 1005
    .line 1006
    .line 1007
    move-result-object v4

    .line 1008
    invoke-static {v0, v4}, Ll/zxq0;->b(Ljava/io/File;Ljava/io/File;)Lorg/json/JSONArray;

    .line 1009
    .line 1010
    .line 1011
    move-result-object v0

    .line 1012
    const-string v4, "leak_threads_count"

    .line 1013
    .line 1014
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 1015
    .line 1016
    .line 1017
    move-result v6

    .line 1018
    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 1019
    .line 1020
    .line 1021
    move-result-object v6

    .line 1022
    invoke-virtual {v2, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1023
    .line 1024
    .line 1025
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 1026
    .line 1027
    .line 1028
    move-result v2

    .line 1029
    if-lez v2, :cond_1c

    .line 1030
    .line 1031
    invoke-static {}, Ll/n0r0;->h()Ljava/lang/String;

    .line 1032
    .line 1033
    .line 1034
    move-result-object v2

    .line 1035
    invoke-static {v2}, Ll/j5r0;->w(Ljava/lang/String;)Ljava/io/File;

    .line 1036
    .line 1037
    .line 1038
    move-result-object v2

    .line 1039
    const/4 v4, 0x0

    .line 1040
    invoke-static {v2, v0, v4}, Ll/r3r0;->l(Ljava/io/File;Lorg/json/JSONArray;Z)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_8

    .line 1041
    .line 1042
    .line 1043
    :catchall_8
    :cond_1c
    :try_start_d
    const-string v0, "mainStackFromTrace"

    .line 1044
    .line 1045
    move-object/from16 v6, v20

    .line 1046
    .line 1047
    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 1048
    .line 1049
    .line 1050
    move-result-object v0

    .line 1051
    invoke-static {v0}, Ll/vuq0;->d(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 1052
    .line 1053
    .line 1054
    move-result-object v0

    .line 1055
    invoke-virtual {v3}, Ll/gsq0;->G()Lorg/json/JSONObject;

    .line 1056
    .line 1057
    .line 1058
    move-result-object v2

    .line 1059
    new-instance v3, Ll/grq0$a;

    .line 1060
    .line 1061
    invoke-direct {v3, v1, v7, v8}, Ll/grq0$a;-><init>(Ll/grq0;J)V

    .line 1062
    .line 1063
    .line 1064
    invoke-static {v2, v0, v3}, Ll/vuq0;->h(Lorg/json/JSONObject;Lorg/json/JSONArray;Ll/vuq0$a;)V

    .line 1065
    .line 1066
    .line 1067
    invoke-static {v5}, Ll/grq0;->o(Ljava/lang/String;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    .line 1068
    .line 1069
    .line 1070
    goto :goto_10

    .line 1071
    :goto_f
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 1072
    .line 1073
    .line 1074
    const-string v1, "NPTH_CATCH"

    .line 1075
    .line 1076
    invoke-static {v1, v0}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1077
    .line 1078
    .line 1079
    :cond_1d
    :goto_10
    return v17

    .line 1080
    :catchall_9
    move-exception v0

    .line 1081
    :try_start_e
    monitor-exit v4
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_9

    .line 1082
    throw v0
.end method

.method public m()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/grq0;->a:Ll/quq0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/quq0;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public s()V
    .locals 2

    .line 1
    sget-boolean v0, Ll/grq0;->D:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/grq0;->u:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter v0

    .line 9
    :try_start_0
    sget-boolean v1, Ll/grq0;->D:Z

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    monitor-exit v0

    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    goto :goto_0

    .line 17
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    iget-object p0, p0, Ll/grq0;->y:Ljava/lang/Runnable;

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    throw p0
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/grq0;->v()Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-static {v2}, Ll/r3r0;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-static {v2}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    iput v2, p0, Ll/grq0;->z:I

    .line 23
    .line 24
    const/4 p0, 0x2

    .line 25
    if-lt v2, p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    invoke-static {p0}, Lcom/apm/lite/nativecrash/NativeImpl;->t(Z)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-static {v1}, Lcom/apm/lite/nativecrash/NativeImpl;->t(Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :catchall_0
    invoke-static {v0}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catch_0
    invoke-static {v1}, Lcom/apm/lite/nativecrash/NativeImpl;->t(Z)V

    .line 41
    .line 42
    .line 43
    :goto_0
    return-void
.end method
