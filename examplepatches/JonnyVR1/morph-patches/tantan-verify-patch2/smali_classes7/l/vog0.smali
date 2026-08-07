.class public abstract Ll/vog0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Ljava/lang/String;


# instance fields
.field public a:I

.field public final b:Ll/olg0;

.field public final c:Ll/msg0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Ll/vog0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "SudGIP "

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Ll/vog0;->d:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Ll/olg0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xa

    .line 5
    .line 6
    iput v0, p0, Ll/vog0;->a:I

    .line 7
    .line 8
    new-instance v0, Ll/msg0;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/msg0;-><init>(Ll/vog0;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/vog0;->c:Ll/msg0;

    .line 14
    .line 15
    iput-object p1, p0, Ll/vog0;->b:Ll/olg0;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final a(Ll/oqg0;Ll/klg0;)J
    .locals 8

    .line 1
    iget-object v0, p1, Ll/oqg0;->d:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p1, Ll/oqg0;->d:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1}, Landroid/webkit/MimeTypeMap;->getFileExtensionFromUrl(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    new-instance v2, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v3, "."

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    move-object v5, v1

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    move-object v5, v0

    .line 42
    :goto_0
    invoke-virtual {p0, v0}, Ll/vog0;->k(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-static {v4}, Ll/ofg0;->a(Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    new-instance v0, Ll/uug0;

    .line 50
    .line 51
    invoke-direct {v0}, Ll/uug0;-><init>()V

    .line 52
    .line 53
    .line 54
    iget-object v1, p1, Ll/oqg0;->d:Ljava/lang/String;

    .line 55
    .line 56
    iput-object v1, v0, Ll/uug0;->c:Ljava/lang/String;

    .line 57
    .line 58
    iget-wide v1, p1, Ll/oqg0;->c:J

    .line 59
    .line 60
    iput-wide v1, v0, Ll/uug0;->a:J

    .line 61
    .line 62
    iget-object v1, p1, Ll/oqg0;->e:Ljava/lang/String;

    .line 63
    .line 64
    iput-object v1, v0, Ll/uug0;->b:Ljava/lang/String;

    .line 65
    .line 66
    iput-object v5, v0, Ll/uug0;->d:Ljava/lang/String;

    .line 67
    .line 68
    iput-object v0, p1, Ll/oqg0;->g:Ljava/lang/Object;

    .line 69
    .line 70
    const-string v0, "RealSudGamePackageManager"

    .line 71
    .line 72
    const-string v1, "downloadPackage"

    .line 73
    .line 74
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    sget-object v0, Ll/vog0;->d:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    sget-object v0, Ll/bhg0;->d:Ljava/lang/String;

    .line 83
    .line 84
    sget-object v2, Ll/weg0;->a:Ll/bhg0;

    .line 85
    .line 86
    new-instance v6, Ll/llg0;

    .line 87
    .line 88
    invoke-direct {v6, p0, p2, p1}, Ll/llg0;-><init>(Ll/vog0;Ll/klg0;Ll/oqg0;)V

    .line 89
    .line 90
    .line 91
    iget-object v7, p0, Ll/vog0;->c:Ll/msg0;

    .line 92
    .line 93
    move-object v3, p1

    .line 94
    invoke-virtual/range {v2 .. v7}, Ll/bhg0;->a(Ll/oqg0;Ljava/lang/String;Ljava/lang/String;Ll/wfg0;Ll/prg0;)J

    .line 95
    .line 96
    .line 97
    move-result-wide p0

    .line 98
    return-wide p0
.end method

.method public abstract b(Ll/uug0;Ljava/io/File;)Ljava/lang/Object;
.end method

.method public c(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p1
.end method

.method public final d(IJLjava/lang/String;Ll/uog0;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v6, p4

    .line 6
    .line 7
    move-object/from16 v5, p5

    .line 8
    .line 9
    if-nez v5, :cond_0

    .line 10
    .line 11
    goto/16 :goto_7

    .line 12
    .line 13
    :cond_0
    invoke-static {}, Ltech/sud/gip/core/SudGIP;->getCfg()Ltech/sud/gip/core/ISudCfg;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-interface {v3}, Ltech/sud/gip/core/ISudCfg;->getAdvancedConfigMap()Ljava/util/Map;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const-string v4, "priority_embedded_game_pkg"

    .line 22
    .line 23
    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    const-string v4, "true"

    .line 28
    .line 29
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eqz v3, :cond_2

    .line 34
    .line 35
    sget-object v3, Ll/arg0;->a:Ll/pjg0;

    .line 36
    .line 37
    iget-object v3, v3, Ll/pjg0;->c:Ljava/util/HashMap;

    .line 38
    .line 39
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    check-cast v3, Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    if-eqz v4, :cond_1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    invoke-virtual {v0, v1, v2, v3, v5}, Ll/vog0;->g(JLjava/lang/String;Ll/uog0;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    :goto_0
    sget-object v3, Ll/utg0;->e:Ll/i0h0;

    .line 61
    .line 62
    const/4 v7, 0x1

    .line 63
    if-eqz v3, :cond_3

    .line 64
    .line 65
    iget-object v3, v3, Ll/i0h0;->c:Ll/gvg0;

    .line 66
    .line 67
    if-eqz v3, :cond_3

    .line 68
    .line 69
    iget-object v3, v3, Ll/gvg0;->g:Ll/ctg0;

    .line 70
    .line 71
    if-eqz v3, :cond_3

    .line 72
    .line 73
    iget-boolean v3, v3, Ll/ctg0;->a:Z

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_3
    move v3, v7

    .line 77
    :goto_1
    const/4 v4, 0x0

    .line 78
    const-string v8, "\\d+(\\.\\d+){3}"

    .line 79
    .line 80
    const/4 v9, 0x0

    .line 81
    if-eqz v3, :cond_9

    .line 82
    .line 83
    sget-object v3, Ll/arg0;->a:Ll/pjg0;

    .line 84
    .line 85
    iget-object v3, v3, Ll/pjg0;->c:Ljava/util/HashMap;

    .line 86
    .line 87
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 88
    .line 89
    .line 90
    move-result-object v10

    .line 91
    invoke-virtual {v3, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    check-cast v3, Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result v10

    .line 101
    if-eqz v10, :cond_4

    .line 102
    .line 103
    goto :goto_3

    .line 104
    :cond_4
    invoke-static {v8}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 105
    .line 106
    .line 107
    move-result-object v8

    .line 108
    invoke-virtual {v8, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 109
    .line 110
    .line 111
    move-result-object v8

    .line 112
    invoke-virtual {v8}, Ljava/util/regex/Matcher;->find()Z

    .line 113
    .line 114
    .line 115
    move-result v10

    .line 116
    if-eqz v10, :cond_5

    .line 117
    .line 118
    invoke-virtual {v8}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    :cond_5
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 123
    .line 124
    .line 125
    move-result v8

    .line 126
    if-eqz v8, :cond_6

    .line 127
    .line 128
    goto :goto_3

    .line 129
    :cond_6
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 130
    .line 131
    .line 132
    move-result v8

    .line 133
    if-eqz v8, :cond_7

    .line 134
    .line 135
    move-object/from16 v16, v4

    .line 136
    .line 137
    move-object v4, v3

    .line 138
    move-object/from16 v3, v16

    .line 139
    .line 140
    invoke-virtual/range {v0 .. v5}, Ll/vog0;->f(JLjava/lang/String;Ljava/lang/String;Ll/uog0;)V

    .line 141
    .line 142
    .line 143
    :goto_2
    move v3, v7

    .line 144
    goto :goto_4

    .line 145
    :cond_7
    move-object/from16 v16, v4

    .line 146
    .line 147
    move-object v4, v3

    .line 148
    move-object/from16 v3, v16

    .line 149
    .line 150
    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v3

    .line 154
    if-nez v3, :cond_8

    .line 155
    .line 156
    :goto_3
    move v3, v9

    .line 157
    goto :goto_4

    .line 158
    :cond_8
    invoke-virtual {v0, v1, v2, v4, v5}, Ll/vog0;->g(JLjava/lang/String;Ll/uog0;)V

    .line 159
    .line 160
    .line 161
    goto :goto_2

    .line 162
    :goto_4
    if-eqz v3, :cond_d

    .line 163
    .line 164
    goto :goto_7

    .line 165
    :cond_9
    sget-object v3, Ll/arg0;->a:Ll/pjg0;

    .line 166
    .line 167
    iget-object v3, v3, Ll/pjg0;->c:Ljava/util/HashMap;

    .line 168
    .line 169
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 170
    .line 171
    .line 172
    move-result-object v10

    .line 173
    invoke-virtual {v3, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    check-cast v3, Ljava/lang/String;

    .line 178
    .line 179
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 180
    .line 181
    .line 182
    move-result v10

    .line 183
    if-eqz v10, :cond_a

    .line 184
    .line 185
    move v3, v9

    .line 186
    goto :goto_6

    .line 187
    :cond_a
    invoke-static {v8}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 188
    .line 189
    .line 190
    move-result-object v8

    .line 191
    invoke-virtual {v8, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 192
    .line 193
    .line 194
    move-result-object v8

    .line 195
    invoke-virtual {v8}, Ljava/util/regex/Matcher;->find()Z

    .line 196
    .line 197
    .line 198
    move-result v10

    .line 199
    if-eqz v10, :cond_b

    .line 200
    .line 201
    invoke-virtual {v8}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v4

    .line 205
    :cond_b
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 206
    .line 207
    .line 208
    move-result v8

    .line 209
    if-eqz v8, :cond_c

    .line 210
    .line 211
    invoke-virtual {v0, v1, v2, v3, v5}, Ll/vog0;->g(JLjava/lang/String;Ll/uog0;)V

    .line 212
    .line 213
    .line 214
    goto :goto_5

    .line 215
    :cond_c
    move-object/from16 v16, v4

    .line 216
    .line 217
    move-object v4, v3

    .line 218
    move-object/from16 v3, v16

    .line 219
    .line 220
    invoke-virtual/range {v0 .. v5}, Ll/vog0;->f(JLjava/lang/String;Ljava/lang/String;Ll/uog0;)V

    .line 221
    .line 222
    .line 223
    :goto_5
    move v3, v7

    .line 224
    :goto_6
    if-eqz v3, :cond_d

    .line 225
    .line 226
    :goto_7
    return-void

    .line 227
    :cond_d
    iget-object v3, v0, Ll/vog0;->b:Ll/olg0;

    .line 228
    .line 229
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v4

    .line 233
    iget-object v3, v3, Ll/olg0;->a:Landroid/content/SharedPreferences;

    .line 234
    .line 235
    const-string v8, ""

    .line 236
    .line 237
    invoke-interface {v3, v4, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v3

    .line 241
    invoke-static {v3}, Ll/rlg0;->a(Ljava/lang/String;)Ll/uug0;

    .line 242
    .line 243
    .line 244
    move-result-object v3

    .line 245
    if-eqz v3, :cond_f

    .line 246
    .line 247
    const-string v4, "RealSudGamePackageManager"

    .line 248
    .line 249
    const-string v10, "isPackageInstalled gamePackageInfo != null"

    .line 250
    .line 251
    invoke-static {v4, v10}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 252
    .line 253
    .line 254
    sget-object v11, Ll/vog0;->d:Ljava/lang/String;

    .line 255
    .line 256
    invoke-static {v11, v10}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    iget-object v10, v3, Ll/uug0;->d:Ljava/lang/String;

    .line 260
    .line 261
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 262
    .line 263
    .line 264
    move-result v10

    .line 265
    if-nez v10, :cond_f

    .line 266
    .line 267
    iget-object v10, v3, Ll/uug0;->c:Ljava/lang/String;

    .line 268
    .line 269
    invoke-virtual {v0, v10}, Ll/vog0;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v10

    .line 273
    new-instance v12, Ljava/io/File;

    .line 274
    .line 275
    iget-object v13, v3, Ll/uug0;->d:Ljava/lang/String;

    .line 276
    .line 277
    invoke-direct {v12, v10, v13}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    .line 279
    .line 280
    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v12

    .line 284
    new-instance v13, Ll/ktg0;

    .line 285
    .line 286
    invoke-direct {v13}, Ll/ktg0;-><init>()V

    .line 287
    .line 288
    .line 289
    sget-object v14, LSudabstract/Sudfor;->Sudif:LSudabstract/Sudfor;

    .line 290
    .line 291
    iput-object v14, v13, Ll/ktg0;->a:LSudabstract/Sudfor;

    .line 292
    .line 293
    iput-object v6, v13, Ll/ktg0;->b:Ljava/lang/String;

    .line 294
    .line 295
    iget-object v6, v3, Ll/uug0;->b:Ljava/lang/String;

    .line 296
    .line 297
    iput-object v6, v13, Ll/ktg0;->c:Ljava/lang/String;

    .line 298
    .line 299
    iput-object v10, v13, Ll/ktg0;->d:Ljava/lang/String;

    .line 300
    .line 301
    iget-object v6, v3, Ll/uug0;->d:Ljava/lang/String;

    .line 302
    .line 303
    iput-object v6, v13, Ll/ktg0;->e:Ljava/lang/String;

    .line 304
    .line 305
    iget-wide v14, v3, Ll/uug0;->e:J

    .line 306
    .line 307
    iput-wide v14, v13, Ll/ktg0;->f:J

    .line 308
    .line 309
    move/from16 v6, p1

    .line 310
    .line 311
    iput v6, v13, Ll/ktg0;->g:I

    .line 312
    .line 313
    sget-object v6, Ll/bhg0;->d:Ljava/lang/String;

    .line 314
    .line 315
    sget-object v6, Ll/weg0;->a:Ll/bhg0;

    .line 316
    .line 317
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 318
    .line 319
    .line 320
    invoke-static {v13}, Ll/bhg0;->d(Ll/ktg0;)Z

    .line 321
    .line 322
    .line 323
    move-result v6

    .line 324
    new-instance v10, Ljava/lang/StringBuilder;

    .line 325
    .line 326
    const-string v13, "isPackageInstalled isOk="

    .line 327
    .line 328
    invoke-direct {v10, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 329
    .line 330
    .line 331
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 332
    .line 333
    .line 334
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object v10

    .line 338
    invoke-static {v4, v10}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 339
    .line 340
    .line 341
    new-instance v4, Ljava/lang/StringBuilder;

    .line 342
    .line 343
    invoke-direct {v4, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 347
    .line 348
    .line 349
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object v4

    .line 353
    invoke-static {v11, v4}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 354
    .line 355
    .line 356
    if-eqz v6, :cond_e

    .line 357
    .line 358
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 359
    .line 360
    .line 361
    move-result-wide v1

    .line 362
    iput-wide v1, v3, Ll/uug0;->f:J

    .line 363
    .line 364
    iget-object v1, v0, Ll/vog0;->b:Ll/olg0;

    .line 365
    .line 366
    invoke-virtual {v1, v3}, Ll/olg0;->g(Ll/uug0;)V

    .line 367
    .line 368
    .line 369
    invoke-virtual {v0, v12}, Ll/vog0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 370
    .line 371
    .line 372
    move-result-object v0

    .line 373
    invoke-interface {v5, v7, v0, v7}, Ll/uog0;->a(ZLjava/lang/String;Z)V

    .line 374
    .line 375
    .line 376
    return-void

    .line 377
    :cond_e
    iget-object v0, v0, Ll/vog0;->b:Ll/olg0;

    .line 378
    .line 379
    invoke-virtual {v0, v1, v2}, Ll/olg0;->c(J)V

    .line 380
    .line 381
    .line 382
    :cond_f
    invoke-interface {v5, v9, v8, v7}, Ll/uog0;->a(ZLjava/lang/String;Z)V

    .line 383
    .line 384
    .line 385
    return-void
.end method

.method public final e(J)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/vog0;->b:Ll/olg0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/olg0;->b()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget v2, p0, Ll/vog0;->a:I

    .line 12
    .line 13
    if-le v1, v2, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget v2, p0, Ll/vog0;->a:I

    .line 20
    .line 21
    sub-int/2addr v1, v2

    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v0, v2, v1}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Ll/uug0;

    .line 42
    .line 43
    iget-wide v2, v1, Ll/uug0;->a:J

    .line 44
    .line 45
    cmp-long v2, v2, p1

    .line 46
    .line 47
    if-eqz v2, :cond_0

    .line 48
    .line 49
    new-instance v2, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v3, "removeDiskCacheLimit mgId:"

    .line 52
    .line 53
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-wide v3, v1, Ll/uug0;->a:J

    .line 57
    .line 58
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    const-string v3, "RealSudGamePackageManager"

    .line 66
    .line 67
    invoke-static {v3, v2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    iget-object v2, p0, Ll/vog0;->b:Ll/olg0;

    .line 71
    .line 72
    iget-wide v3, v1, Ll/uug0;->a:J

    .line 73
    .line 74
    invoke-virtual {v2, v3, v4}, Ll/olg0;->c(J)V

    .line 75
    .line 76
    .line 77
    new-instance v2, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    iget-object v3, v1, Ll/uug0;->c:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p0, v3}, Ll/vog0;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v3, "/"

    .line 92
    .line 93
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    iget-object v1, v1, Ll/uug0;->d:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    sget-object v2, Ll/ing0;->a:Ljava/lang/String;

    .line 106
    .line 107
    new-instance v2, Ljava/io/File;

    .line 108
    .line 109
    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    new-instance v2, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    const-string v3, "deleteFile result:"

    .line 119
    .line 120
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    const-string v2, "FileUtils"

    .line 131
    .line 132
    invoke-static {v2, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_1
    return-void
.end method

.method public final f(JLjava/lang/String;Ljava/lang/String;Ll/uog0;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v3, p4

    .line 6
    .line 7
    move-object/from16 v4, p5

    .line 8
    .line 9
    iget-object v5, v0, Ll/vog0;->b:Ll/olg0;

    .line 10
    .line 11
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v6

    .line 15
    iget-object v5, v5, Ll/olg0;->a:Landroid/content/SharedPreferences;

    .line 16
    .line 17
    const-string v7, ""

    .line 18
    .line 19
    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    invoke-static {v5}, Ll/rlg0;->a(Ljava/lang/String;)Ll/uug0;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    const/4 v6, 0x0

    .line 28
    if-eqz v5, :cond_2

    .line 29
    .line 30
    iget-object v8, v5, Ll/uug0;->b:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v8

    .line 36
    if-eqz v8, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object v8, v5, Ll/uug0;->d:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v8

    .line 45
    if-nez v8, :cond_2

    .line 46
    .line 47
    new-instance v8, Ljava/io/File;

    .line 48
    .line 49
    iget-object v9, v5, Ll/uug0;->c:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0, v9}, Ll/vog0;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v9

    .line 55
    iget-object v5, v5, Ll/uug0;->d:Ljava/lang/String;

    .line 56
    .line 57
    invoke-direct {v8, v9, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    sget-object v8, Ll/ing0;->a:Ljava/lang/String;

    .line 65
    .line 66
    if-nez v5, :cond_1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    new-instance v8, Ljava/io/File;

    .line 70
    .line 71
    invoke-direct {v8, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    goto :goto_1

    .line 79
    :cond_2
    :goto_0
    move v5, v6

    .line 80
    :goto_1
    if-eqz v5, :cond_c

    .line 81
    .line 82
    iget-object v5, v0, Ll/vog0;->b:Ll/olg0;

    .line 83
    .line 84
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v8

    .line 88
    iget-object v5, v5, Ll/olg0;->a:Landroid/content/SharedPreferences;

    .line 89
    .line 90
    invoke-interface {v5, v8, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    invoke-static {v5}, Ll/rlg0;->a(Ljava/lang/String;)Ll/uug0;

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    iget-object v7, v5, Ll/uug0;->b:Ljava/lang/String;

    .line 99
    .line 100
    const-string v8, "\\."

    .line 101
    .line 102
    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v7

    .line 106
    move-object/from16 v9, p3

    .line 107
    .line 108
    invoke-virtual {v9, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v8

    .line 112
    array-length v9, v7

    .line 113
    array-length v10, v8

    .line 114
    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    .line 115
    .line 116
    .line 117
    move-result v9

    .line 118
    const-wide/16 v10, 0x0

    .line 119
    .line 120
    move v12, v6

    .line 121
    move-wide v13, v10

    .line 122
    :goto_2
    if-ge v12, v9, :cond_4

    .line 123
    .line 124
    aget-object v13, v7, v12

    .line 125
    .line 126
    invoke-static {v13}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 127
    .line 128
    .line 129
    move-result-wide v13

    .line 130
    aget-object v15, v8, v12

    .line 131
    .line 132
    invoke-static {v15}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 133
    .line 134
    .line 135
    move-result-wide v15

    .line 136
    sub-long/2addr v13, v15

    .line 137
    cmp-long v15, v13, v10

    .line 138
    .line 139
    if-eqz v15, :cond_3

    .line 140
    .line 141
    goto :goto_3

    .line 142
    :cond_3
    add-int/lit8 v12, v12, 0x1

    .line 143
    .line 144
    goto :goto_2

    .line 145
    :cond_4
    :goto_3
    cmp-long v9, v13, v10

    .line 146
    .line 147
    const/4 v13, 0x1

    .line 148
    if-nez v9, :cond_9

    .line 149
    .line 150
    move v9, v12

    .line 151
    :goto_4
    array-length v14, v7

    .line 152
    if-ge v9, v14, :cond_6

    .line 153
    .line 154
    aget-object v14, v7, v9

    .line 155
    .line 156
    invoke-static {v14}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 157
    .line 158
    .line 159
    move-result-wide v14

    .line 160
    cmp-long v14, v14, v10

    .line 161
    .line 162
    if-lez v14, :cond_5

    .line 163
    .line 164
    goto :goto_6

    .line 165
    :cond_5
    add-int/lit8 v9, v9, 0x1

    .line 166
    .line 167
    goto :goto_4

    .line 168
    :cond_6
    :goto_5
    array-length v7, v8

    .line 169
    if-ge v12, v7, :cond_8

    .line 170
    .line 171
    aget-object v7, v8, v12

    .line 172
    .line 173
    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 174
    .line 175
    .line 176
    move-result-wide v14

    .line 177
    cmp-long v7, v14, v10

    .line 178
    .line 179
    if-lez v7, :cond_7

    .line 180
    .line 181
    goto :goto_7

    .line 182
    :cond_7
    add-int/lit8 v12, v12, 0x1

    .line 183
    .line 184
    goto :goto_5

    .line 185
    :cond_8
    move v7, v6

    .line 186
    goto :goto_8

    .line 187
    :cond_9
    if-lez v9, :cond_a

    .line 188
    .line 189
    :goto_6
    move v7, v13

    .line 190
    goto :goto_8

    .line 191
    :cond_a
    :goto_7
    const/4 v7, -0x1

    .line 192
    :goto_8
    if-lez v7, :cond_b

    .line 193
    .line 194
    new-instance v1, Ljava/io/File;

    .line 195
    .line 196
    iget-object v2, v5, Ll/uug0;->c:Ljava/lang/String;

    .line 197
    .line 198
    invoke-virtual {v0, v2}, Ll/vog0;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    iget-object v3, v5, Ll/uug0;->d:Ljava/lang/String;

    .line 203
    .line 204
    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    invoke-virtual {v0, v1}, Ll/vog0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-interface {v4, v13, v0, v6}, Ll/uog0;->a(ZLjava/lang/String;Z)V

    .line 216
    .line 217
    .line 218
    return-void

    .line 219
    :cond_b
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/vog0;->g(JLjava/lang/String;Ll/uog0;)V

    .line 220
    .line 221
    .line 222
    return-void

    .line 223
    :cond_c
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/vog0;->g(JLjava/lang/String;Ll/uog0;)V

    .line 224
    .line 225
    .line 226
    return-void
.end method

.method public g(JLjava/lang/String;Ll/uog0;)V
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    const/4 p1, 0x0

    .line 3
    invoke-interface {p4, p0, p3, p1}, Ll/uog0;->a(ZLjava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public abstract h(Ljava/lang/String;Ljava/lang/Object;Ll/bxg0;Ll/klg0;)V
.end method

.method public final i(Ll/lsg0;)V
    .locals 4

    .line 1
    check-cast p1, Ll/tgg0;

    .line 2
    .line 3
    const-string p0, "SudGameLoadingStageLoadPackage"

    .line 4
    .line 5
    const-string v0, "PackageInstallListener.onInstallStart"

    .line 6
    .line 7
    invoke-static {p0, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    sget-object v1, Ll/thg0;->j:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v1, v0}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p1, Ll/tgg0;->a:Ll/thg0;

    .line 16
    .line 17
    iget-boolean v2, v0, Ll/thg0;->f:Z

    .line 18
    .line 19
    if-nez v2, :cond_0

    .line 20
    .line 21
    iget-object v2, v0, Ll/thg0;->c:Ll/mrg0;

    .line 22
    .line 23
    iget-object v0, v0, Ll/thg0;->a:Landroid/content/Context;

    .line 24
    .line 25
    sget v3, Ltech/sud/gip/R$string;->fsm_mgp_game_loading_stage_loadPackage_install_game_package_start:I

    .line 26
    .line 27
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v2, v0}, Ll/mrg0;->c(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object v0, p1, Ll/tgg0;->a:Ll/thg0;

    .line 35
    .line 36
    iget-boolean v2, v0, Ll/thg0;->f:Z

    .line 37
    .line 38
    if-nez v2, :cond_1

    .line 39
    .line 40
    iget-object v2, v0, Ll/thg0;->c:Ll/mrg0;

    .line 41
    .line 42
    iget-object v0, v0, Ll/thg0;->a:Landroid/content/Context;

    .line 43
    .line 44
    sget v3, Ltech/sud/gip/R$string;->fsm_mgp_game_loading_stage_loadPackage_install_game_package_downloading:I

    .line 45
    .line 46
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v2, v0}, Ll/mrg0;->c(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    const-string v0, "PackageInstallListener.onSuccess"

    .line 54
    .line 55
    invoke-static {p0, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v1, v0}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p1, Ll/tgg0;->a:Ll/thg0;

    .line 62
    .line 63
    iget-boolean v0, p0, Ll/thg0;->f:Z

    .line 64
    .line 65
    if-nez v0, :cond_2

    .line 66
    .line 67
    iget-object v0, p0, Ll/thg0;->c:Ll/mrg0;

    .line 68
    .line 69
    iget-object p0, p0, Ll/thg0;->a:Landroid/content/Context;

    .line 70
    .line 71
    sget v1, Ltech/sud/gip/R$string;->fsm_mgp_game_loading_stage_loadPackage_install_game_package_download_finish:I

    .line 72
    .line 73
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {v0, p0}, Ll/mrg0;->c(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p1, Ll/tgg0;->a:Ll/thg0;

    .line 81
    .line 82
    iget-object p0, p0, Ll/thg0;->c:Ll/mrg0;

    .line 83
    .line 84
    const/4 p1, 0x3

    .line 85
    invoke-virtual {p0, p1}, Ll/mrg0;->a(I)V

    .line 86
    .line 87
    .line 88
    :cond_2
    return-void
.end method

.method public j(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vog0;->k(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public abstract k(Ljava/lang/String;)Ljava/lang/String;
.end method
