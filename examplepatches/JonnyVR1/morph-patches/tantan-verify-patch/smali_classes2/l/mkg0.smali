.class public final Ll/mkg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/gip/asr/base/Sudtry;


# static fields
.field public static final c:Ljava/lang/String;


# instance fields
.field public final a:Ltech/sud/gip/asr/base/BaseRealSudASRImpl;

.field public final b:Ll/rwg0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Ll/mkg0;

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
    sput-object v0, Ll/mkg0;->c:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Ltech/sud/gip/asr/base/model/InitASRParamModel;)V
    .locals 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/rwg0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/rwg0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/mkg0;->b:Ll/rwg0;

    .line 10
    .line 11
    invoke-static {}, Ll/mkg0;->c()Lorg/json/JSONArray;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, p1, Ltech/sud/gip/asr/base/model/InitASRParamModel;->supportTextLanguageList:Lorg/json/JSONArray;

    .line 16
    .line 17
    invoke-static {}, Ll/mkg0;->a()Lorg/json/JSONArray;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, p1, Ltech/sud/gip/asr/base/model/InitASRParamModel;->supportNumberLanguageList:Lorg/json/JSONArray;

    .line 22
    .line 23
    invoke-static {}, Ll/mkg0;->b()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-static {}, Ll/utg0;->a()Ljava/util/ArrayList;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    sget-object v3, Ll/mkg0;->c:Ljava/lang/String;

    .line 32
    .line 33
    new-instance v4, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v5, "asrType:"

    .line 36
    .line 37
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-static {v3, v4}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    new-instance v4, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v6, "asrLoadList:"

    .line 53
    .line 54
    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-static {v3, v4}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    new-instance v4, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    const-string v5, "ProxyASRImpl"

    .line 80
    .line 81
    invoke-static {v5, v4}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    new-instance v4, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-static {v5, v2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    iput v1, v0, Ll/rwg0;->a:I

    .line 100
    .line 101
    const/4 v2, 0x1

    .line 102
    const-class v4, Ltech/sud/gip/asr/base/model/InitASRParamModel;

    .line 103
    .line 104
    const-string v6, "asr tx cfg empty"

    .line 105
    .line 106
    const/4 v7, 0x0

    .line 107
    if-eq v1, v2, :cond_0

    .line 108
    .line 109
    const/4 v0, 0x3

    .line 110
    if-eq v1, v0, :cond_3

    .line 111
    .line 112
    const/4 v0, 0x4

    .line 113
    if-eq v1, v0, :cond_6

    .line 114
    .line 115
    goto/16 :goto_5

    .line 116
    .line 117
    :cond_0
    sget-object v1, Ll/utg0;->e:Ll/i0h0;

    .line 118
    .line 119
    if-eqz v1, :cond_1

    .line 120
    .line 121
    iget-object v1, v1, Ll/i0h0;->c:Ll/gvg0;

    .line 122
    .line 123
    if-eqz v1, :cond_1

    .line 124
    .line 125
    iget-object v1, v1, Ll/gvg0;->e:Ll/svg0;

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_1
    move-object v1, v7

    .line 129
    :goto_0
    if-eqz v1, :cond_2

    .line 130
    .line 131
    iget-object v1, v1, Ll/svg0;->a:Ll/vpg0;

    .line 132
    .line 133
    if-eqz v1, :cond_2

    .line 134
    .line 135
    :try_start_0
    const-string v2, "tech.sud.gip.asr.azure.AzureRealSudASRImpl"

    .line 136
    .line 137
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    const-class v3, Ljava/lang/String;

    .line 142
    .line 143
    filled-new-array {v3, v3, v4}, [Ljava/lang/Class;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    iget-object v3, v1, Ll/vpg0;->a:Ljava/lang/String;

    .line 152
    .line 153
    iget-object v1, v1, Ll/vpg0;->b:Ljava/lang/String;

    .line 154
    .line 155
    filled-new-array {v3, v1, p1}, [Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-virtual {v2, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    check-cast v1, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;

    .line 164
    .line 165
    invoke-virtual {v1, v0}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->setMatchASREvent(Ll/srg0;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    .line 167
    .line 168
    move-object v7, v1

    .line 169
    goto/16 :goto_5

    .line 170
    .line 171
    :catch_0
    move-exception v0

    .line 172
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 173
    .line 174
    .line 175
    const-string v0, "not found azure asr impl"

    .line 176
    .line 177
    invoke-static {v5, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 178
    .line 179
    .line 180
    goto :goto_1

    .line 181
    :cond_2
    const-string v0, "asr ms cfg empty"

    .line 182
    .line 183
    invoke-static {v3, v0}, Ltech/sud/gip/logger/SudLogger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    :cond_3
    :goto_1
    sget-object v0, Ll/utg0;->e:Ll/i0h0;

    .line 187
    .line 188
    if-eqz v0, :cond_4

    .line 189
    .line 190
    iget-object v0, v0, Ll/i0h0;->c:Ll/gvg0;

    .line 191
    .line 192
    if-eqz v0, :cond_4

    .line 193
    .line 194
    iget-object v0, v0, Ll/gvg0;->e:Ll/svg0;

    .line 195
    .line 196
    goto :goto_2

    .line 197
    :cond_4
    move-object v0, v7

    .line 198
    :goto_2
    if-eqz v0, :cond_5

    .line 199
    .line 200
    iget-object v0, v0, Ll/svg0;->c:Ltech/sud/gip/core/TccRtssCfg;

    .line 201
    .line 202
    if-eqz v0, :cond_5

    .line 203
    .line 204
    :try_start_1
    const-string v1, "tech.sud.gip.asr.tx.TxRealSudASRImpl"

    .line 205
    .line 206
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    const-class v2, Ltech/sud/gip/core/TccRtssCfg;

    .line 211
    .line 212
    filled-new-array {v4, v2}, [Ljava/lang/Class;

    .line 213
    .line 214
    .line 215
    move-result-object v2

    .line 216
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    check-cast v0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;

    .line 229
    .line 230
    iget-object v1, p0, Ll/mkg0;->b:Ll/rwg0;

    .line 231
    .line 232
    invoke-virtual {v0, v1}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->setMatchASREvent(Ll/srg0;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 233
    .line 234
    .line 235
    move-object v7, v0

    .line 236
    goto :goto_5

    .line 237
    :catch_1
    move-exception v0

    .line 238
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 239
    .line 240
    .line 241
    const-string v0, "not found tx asr impl"

    .line 242
    .line 243
    invoke-static {v5, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 244
    .line 245
    .line 246
    goto :goto_3

    .line 247
    :cond_5
    invoke-static {v5, v6}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 248
    .line 249
    .line 250
    sget-object v0, Ll/mkg0;->c:Ljava/lang/String;

    .line 251
    .line 252
    invoke-static {v0, v6}, Ltech/sud/gip/logger/SudLogger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    :cond_6
    :goto_3
    sget-object v0, Ll/utg0;->e:Ll/i0h0;

    .line 256
    .line 257
    if-eqz v0, :cond_7

    .line 258
    .line 259
    iget-object v0, v0, Ll/i0h0;->c:Ll/gvg0;

    .line 260
    .line 261
    if-eqz v0, :cond_7

    .line 262
    .line 263
    iget-object v0, v0, Ll/gvg0;->n:Ll/jxg0;

    .line 264
    .line 265
    if-eqz v0, :cond_7

    .line 266
    .line 267
    iget-object v0, v0, Ll/jxg0;->a:Ltech/sud/gip/core/model/VolcCfg;

    .line 268
    .line 269
    goto :goto_4

    .line 270
    :cond_7
    move-object v0, v7

    .line 271
    :goto_4
    if-eqz v0, :cond_8

    .line 272
    .line 273
    const-class v1, Ltech/sud/gip/asr/base/Sudif;

    .line 274
    .line 275
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    const-string v2, "SudGIP "

    .line 280
    .line 281
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    new-instance v7, Ll/mug0;

    .line 285
    .line 286
    invoke-direct {v7, p1, v0}, Ll/mug0;-><init>(Ltech/sud/gip/asr/base/model/InitASRParamModel;Ltech/sud/gip/core/model/VolcCfg;)V

    .line 287
    .line 288
    .line 289
    iget-object p1, p0, Ll/mkg0;->b:Ll/rwg0;

    .line 290
    .line 291
    invoke-virtual {v7, p1}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->setMatchASREvent(Ll/srg0;)V

    .line 292
    .line 293
    .line 294
    goto :goto_5

    .line 295
    :cond_8
    invoke-static {v5, v6}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 296
    .line 297
    .line 298
    sget-object p1, Ll/mkg0;->c:Ljava/lang/String;

    .line 299
    .line 300
    invoke-static {p1, v6}, Ltech/sud/gip/logger/SudLogger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    :goto_5
    iput-object v7, p0, Ll/mkg0;->a:Ltech/sud/gip/asr/base/BaseRealSudASRImpl;

    .line 304
    .line 305
    return-void
.end method

.method public static a()Lorg/json/JSONArray;
    .locals 3

    .line 1
    invoke-static {}, Ll/mkg0;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const-string v2, "[\"zh-CN\"]"

    .line 7
    .line 8
    if-eq v0, v1, :cond_3

    .line 9
    .line 10
    const/4 v1, 0x3

    .line 11
    if-eq v0, v1, :cond_1

    .line 12
    .line 13
    const/4 v1, 0x4

    .line 14
    if-eq v0, v1, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    return-object v0

    .line 18
    :cond_0
    invoke-static {}, Ll/utg0;->c()Lorg/json/JSONArray;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    return-object v0

    .line 23
    :cond_1
    sget-object v0, Ll/utg0;->e:Ll/i0h0;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    iget-object v0, v0, Ll/i0h0;->c:Ll/gvg0;

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    iget-object v0, v0, Ll/gvg0;->e:Ll/svg0;

    .line 32
    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    iget-object v0, v0, Ll/svg0;->c:Ltech/sud/gip/core/TccRtssCfg;

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iget-object v0, v0, Ltech/sud/gip/core/TccRtssCfg;->asr_number_language_list:Lorg/json/JSONArray;

    .line 40
    .line 41
    return-object v0

    .line 42
    :cond_2
    :try_start_0
    new-instance v0, Lorg/json/JSONArray;

    .line 43
    .line 44
    invoke-direct {v0, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    .line 47
    return-object v0

    .line 48
    :catch_0
    move-exception v0

    .line 49
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 50
    .line 51
    .line 52
    new-instance v0, Lorg/json/JSONArray;

    .line 53
    .line 54
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 55
    .line 56
    .line 57
    return-object v0

    .line 58
    :cond_3
    sget-object v0, Ll/utg0;->e:Ll/i0h0;

    .line 59
    .line 60
    if-eqz v0, :cond_4

    .line 61
    .line 62
    iget-object v0, v0, Ll/i0h0;->c:Ll/gvg0;

    .line 63
    .line 64
    if-eqz v0, :cond_4

    .line 65
    .line 66
    iget-object v0, v0, Ll/gvg0;->e:Ll/svg0;

    .line 67
    .line 68
    if-eqz v0, :cond_4

    .line 69
    .line 70
    iget-object v0, v0, Ll/svg0;->a:Ll/vpg0;

    .line 71
    .line 72
    if-eqz v0, :cond_4

    .line 73
    .line 74
    iget-object v0, v0, Ll/vpg0;->d:Lorg/json/JSONArray;

    .line 75
    .line 76
    return-object v0

    .line 77
    :cond_4
    :try_start_1
    new-instance v0, Lorg/json/JSONArray;

    .line 78
    .line 79
    invoke-direct {v0, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 80
    .line 81
    .line 82
    return-object v0

    .line 83
    :catch_1
    move-exception v0

    .line 84
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 85
    .line 86
    .line 87
    new-instance v0, Lorg/json/JSONArray;

    .line 88
    .line 89
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 90
    .line 91
    .line 92
    return-object v0
.end method

.method public static b()I
    .locals 7

    .line 1
    invoke-static {}, Ll/utg0;->a()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v3, 0x0

    .line 20
    :catchall_0
    :cond_1
    if-ge v3, v2, :cond_3

    .line 21
    .line 22
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    add-int/lit8 v3, v3, 0x1

    .line 27
    .line 28
    check-cast v4, Ljava/lang/Integer;

    .line 29
    .line 30
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    const/4 v6, 0x1

    .line 35
    if-ne v5, v6, :cond_2

    .line 36
    .line 37
    const-string v4, "tech.sud.gip.asr.azure.AzureRealSudASRImpl"

    .line 38
    .line 39
    :try_start_0
    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    .line 41
    .line 42
    return v6

    .line 43
    :cond_2
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    const/4 v5, 0x3

    .line 48
    if-ne v4, v5, :cond_1

    .line 49
    .line 50
    const-string v4, "tech.sud.gip.asr.tx.TxRealSudASRImpl"

    .line 51
    .line 52
    :try_start_1
    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    .line 54
    .line 55
    return v5

    .line 56
    :cond_3
    :goto_0
    return v1
.end method

.method public static c()Lorg/json/JSONArray;
    .locals 3

    .line 1
    invoke-static {}, Ll/mkg0;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const-string v2, "[\"zh-CN\"]"

    .line 7
    .line 8
    if-eq v0, v1, :cond_3

    .line 9
    .line 10
    const/4 v1, 0x3

    .line 11
    if-eq v0, v1, :cond_1

    .line 12
    .line 13
    const/4 v1, 0x4

    .line 14
    if-eq v0, v1, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    return-object v0

    .line 18
    :cond_0
    invoke-static {}, Ll/utg0;->c()Lorg/json/JSONArray;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    return-object v0

    .line 23
    :cond_1
    sget-object v0, Ll/utg0;->e:Ll/i0h0;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    iget-object v0, v0, Ll/i0h0;->c:Ll/gvg0;

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    iget-object v0, v0, Ll/gvg0;->e:Ll/svg0;

    .line 32
    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    iget-object v0, v0, Ll/svg0;->c:Ltech/sud/gip/core/TccRtssCfg;

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iget-object v0, v0, Ltech/sud/gip/core/TccRtssCfg;->asr_text_language_list:Lorg/json/JSONArray;

    .line 40
    .line 41
    return-object v0

    .line 42
    :cond_2
    :try_start_0
    new-instance v0, Lorg/json/JSONArray;

    .line 43
    .line 44
    invoke-direct {v0, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    .line 47
    return-object v0

    .line 48
    :catch_0
    move-exception v0

    .line 49
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 50
    .line 51
    .line 52
    new-instance v0, Lorg/json/JSONArray;

    .line 53
    .line 54
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 55
    .line 56
    .line 57
    return-object v0

    .line 58
    :cond_3
    sget-object v0, Ll/utg0;->e:Ll/i0h0;

    .line 59
    .line 60
    if-eqz v0, :cond_4

    .line 61
    .line 62
    iget-object v0, v0, Ll/i0h0;->c:Ll/gvg0;

    .line 63
    .line 64
    if-eqz v0, :cond_4

    .line 65
    .line 66
    iget-object v0, v0, Ll/gvg0;->e:Ll/svg0;

    .line 67
    .line 68
    if-eqz v0, :cond_4

    .line 69
    .line 70
    iget-object v0, v0, Ll/svg0;->a:Ll/vpg0;

    .line 71
    .line 72
    if-eqz v0, :cond_4

    .line 73
    .line 74
    iget-object v0, v0, Ll/vpg0;->c:Lorg/json/JSONArray;

    .line 75
    .line 76
    return-object v0

    .line 77
    :cond_4
    :try_start_1
    new-instance v0, Lorg/json/JSONArray;

    .line 78
    .line 79
    invoke-direct {v0, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 80
    .line 81
    .line 82
    return-object v0

    .line 83
    :catch_1
    move-exception v0

    .line 84
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 85
    .line 86
    .line 87
    new-instance v0, Lorg/json/JSONArray;

    .line 88
    .line 89
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 90
    .line 91
    .line 92
    return-object v0
.end method


# virtual methods
.method public final handleGameASR(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mkg0;->a:Ltech/sud/gip/asr/base/BaseRealSudASRImpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ltech/sud/gip/asr/base/Sudtry;->handleGameASR(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final pushAudio(Ljava/nio/ByteBuffer;I)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    throw p0
.end method

.method public final stopASR(Z)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    throw p0
.end method
