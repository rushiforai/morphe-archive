.class public final Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageCheckUpdateModule;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0010%\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0003\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001f\u0010\t\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\t\u0010\nJu\u0010\u0018\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u000c\u001a\u00020\u000b2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000b2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\u0010\u001a\u00020\u000f2\u0012\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u000b0\u00112\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u00132\u001c\u0010\u0017\u001a\u0018\u0012\u0006\u0012\u0004\u0018\u00010\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u0016\u0012\u0004\u0012\u00020\u00080\u0015\u00a2\u0006\u0004\u0008\u0018\u0010\u0019\u00a8\u0006\u001a"
    }
    d2 = {
        "Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageCheckUpdateModule;",
        "",
        "<init>",
        "()V",
        "Ll/zgi;",
        "info",
        "Ll/tgi;",
        "checkResult",
        "",
        "b",
        "(Ll/zgi;Ll/tgi;)V",
        "",
        "bid",
        "baseVersion",
        "currentUrl",
        "",
        "localVersion",
        "",
        "recordData",
        "Ll/ngi;",
        "fepGreyState",
        "Lkotlin/Function2;",
        "",
        "completion",
        "a",
        "(Ll/zgi;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;Ll/ngi;Lkotlin/jvm/functions/Function2;)V",
        "FEP_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final b(Ll/zgi;Ll/tgi;)V
    .locals 5

    .line 1
    sget-object p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->r()Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Ll/zgi;->e()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p1}, Ll/zgi;->d()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {p2}, Ll/tgi;->f()J

    .line 16
    .line 17
    .line 18
    move-result-wide v3

    .line 19
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->B(Ljava/lang/String;Ljava/lang/String;J)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->r()Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1}, Ll/zgi;->e()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p1}, Ll/zgi;->d()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p2}, Ll/tgi;->c()I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    invoke-virtual {p0, v0, p1, p2}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->E(Ljava/lang/String;Ljava/lang/String;I)V

    .line 39
    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public final a(Ll/zgi;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;Ll/ngi;Lkotlin/jvm/functions/Function2;)V
    .locals 16
    .param p1    # Ll/zgi;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p7    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p8    # Ll/ngi;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p9    # Lkotlin/jvm/functions/Function2;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/zgi;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "J",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ll/ngi;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Ll/tgi;",
            "-",
            "Ljava/lang/Throwable;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p7

    .line 2
    .line 3
    move-object/from16 v2, p9

    .line 4
    .line 5
    const-string v3, "Invalid Response Data,response="

    .line 6
    .line 7
    const-string v0, "Data object is null="

    .line 8
    .line 9
    const-string v4, "Empty Response Data,response="

    .line 10
    .line 11
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    invoke-static/range {p2 .. p2}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    const/4 v6, 0x0

    .line 28
    if-eqz v5, :cond_0

    .line 29
    .line 30
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 31
    .line 32
    const-string v1, "Bid is empty"

    .line 33
    .line 34
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-interface {v2, v6, v0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    const/16 v5, -0xbbb

    .line 42
    .line 43
    :try_start_0
    sget-object v7, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 44
    .line 45
    invoke-virtual {v7}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->d()Lcom/hellogroup/fep/feppkg/core/FepPackageConfiguration;

    .line 46
    .line 47
    .line 48
    move-result-object v8

    .line 49
    move-object/from16 v9, p2

    .line 50
    .line 51
    move-object/from16 v10, p3

    .line 52
    .line 53
    move-object/from16 v11, p4

    .line 54
    .line 55
    move-wide/from16 v12, p5

    .line 56
    .line 57
    move-object/from16 v14, p8

    .line 58
    .line 59
    invoke-virtual/range {v8 .. v14}, Lcom/hellogroup/fep/feppkg/core/FepPackageConfiguration;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLl/ngi;)Ljava/util/Map;

    .line 60
    .line 61
    .line 62
    move-result-object v8

    .line 63
    invoke-virtual {v7}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->q()Ll/tc60;

    .line 64
    .line 65
    .line 66
    move-result-object v9

    .line 67
    invoke-virtual {v9}, Ll/tc60;->a()Ll/rk20;

    .line 68
    .line 69
    .line 70
    move-result-object v9

    .line 71
    invoke-virtual {v7}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->d()Lcom/hellogroup/fep/feppkg/core/FepPackageConfiguration;

    .line 72
    .line 73
    .line 74
    move-result-object v10

    .line 75
    invoke-virtual {v10}, Lcom/hellogroup/fep/feppkg/core/FepPackageConfiguration;->b()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v10

    .line 79
    invoke-interface {v9, v10, v8, v6}, Ll/rk20;->a(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v15

    .line 83
    const-string v9, "repData"

    .line 84
    .line 85
    if-eqz v15, :cond_1

    .line 86
    .line 87
    move-object v10, v15

    .line 88
    goto :goto_0

    .line 89
    :cond_1
    const-string v10, "response is empty"

    .line 90
    .line 91
    :goto_0
    invoke-interface {v1, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    if-eqz v15, :cond_4

    .line 95
    .line 96
    invoke-static {v15}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result v9
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 100
    if-eqz v9, :cond_2

    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_2
    :try_start_1
    new-instance v14, Lorg/json/JSONObject;

    .line 104
    .line 105
    invoke-direct {v14, v15}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    const-string v4, "data"

    .line 109
    .line 110
    invoke-virtual {v14, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 111
    .line 112
    .line 113
    move-result-object v10

    .line 114
    if-eqz v10, :cond_3

    .line 115
    .line 116
    sget-object v9, Ll/tgi;->Companion:Ll/tgi$a;

    .line 117
    .line 118
    move-object/from16 v11, p2

    .line 119
    .line 120
    move-wide/from16 v12, p5

    .line 121
    .line 122
    invoke-virtual/range {v9 .. v14}, Ll/tgi$a;->c(Lorg/json/JSONObject;Ljava/lang/String;JLorg/json/JSONObject;)Ll/tgi;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual/range {p1 .. p1}, Ll/zgi;->g()J

    .line 127
    .line 128
    .line 129
    move-result-wide v9

    .line 130
    invoke-virtual {v0, v9, v10}, Ll/tgi;->l(J)V

    .line 131
    .line 132
    .line 133
    move-object/from16 v4, p0

    .line 134
    .line 135
    move-object/from16 v9, p1

    .line 136
    .line 137
    invoke-direct {v4, v9, v0}, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageCheckUpdateModule;->b(Ll/zgi;Ll/tgi;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v7}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->m()Ll/tl5;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    new-instance v7, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageCheckUpdateModule$check$1;

    .line 145
    .line 146
    move-object/from16 v9, p2

    .line 147
    .line 148
    invoke-direct {v7, v9, v0, v8}, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageCheckUpdateModule$check$1;-><init>(Ljava/lang/String;Ll/tgi;Ljava/util/Map;)V

    .line 149
    .line 150
    .line 151
    sget-object v8, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageCheckUpdateModule$check$2;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageCheckUpdateModule$check$2;

    .line 152
    .line 153
    invoke-virtual {v4, v7, v8}, Ll/tl5;->b(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    .line 154
    .line 155
    .line 156
    invoke-interface {v2, v0, v6}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    return-void

    .line 160
    :catch_0
    move-exception v0

    .line 161
    goto :goto_1

    .line 162
    :cond_3
    new-instance v4, Ljava/lang/IllegalArgumentException;

    .line 163
    .line 164
    new-instance v7, Ljava/lang/StringBuilder;

    .line 165
    .line 166
    invoke-direct {v7, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    const-string v0, "em"

    .line 170
    .line 171
    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-direct {v4, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    throw v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 186
    :goto_1
    :try_start_2
    sget-object v4, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 187
    .line 188
    invoke-virtual {v4}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 189
    .line 190
    .line 191
    move-result-object v4

    .line 192
    new-instance v7, Ljava/lang/StringBuilder;

    .line 193
    .line 194
    invoke-direct {v7, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v7, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v3

    .line 204
    invoke-virtual {v4, v5, v3, v0, v1}, Ll/pgi;->c(ILjava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;)V

    .line 205
    .line 206
    .line 207
    invoke-interface {v2, v6, v0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    goto :goto_4

    .line 211
    :catch_1
    move-exception v0

    .line 212
    goto :goto_3

    .line 213
    :cond_4
    :goto_2
    invoke-virtual {v7}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    new-instance v3, Ljava/lang/StringBuilder;

    .line 218
    .line 219
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 229
    const/4 v4, 0x4

    .line 230
    const/4 v7, 0x0

    .line 231
    const/16 v8, -0xbbb

    .line 232
    .line 233
    const/4 v9, 0x0

    .line 234
    move-object/from16 p0, v0

    .line 235
    .line 236
    move-object/from16 p4, v1

    .line 237
    .line 238
    move-object/from16 p2, v3

    .line 239
    .line 240
    move/from16 p5, v4

    .line 241
    .line 242
    move-object/from16 p6, v7

    .line 243
    .line 244
    move/from16 p1, v8

    .line 245
    .line 246
    move-object/from16 p3, v9

    .line 247
    .line 248
    :try_start_3
    invoke-static/range {p0 .. p6}, Ll/pgi;->d(Ll/pgi;ILjava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;ILjava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 249
    .line 250
    .line 251
    :try_start_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 252
    .line 253
    const-string v3, "Empty response"

    .line 254
    .line 255
    invoke-direct {v0, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    invoke-interface {v2, v6, v0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 259
    .line 260
    .line 261
    return-void

    .line 262
    :catch_2
    move-exception v0

    .line 263
    move-object/from16 v1, p4

    .line 264
    .line 265
    :goto_3
    sget-object v3, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 266
    .line 267
    invoke-virtual {v3}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 268
    .line 269
    .line 270
    move-result-object v3

    .line 271
    new-instance v4, Ljava/lang/StringBuilder;

    .line 272
    .line 273
    const-string v7, "Request failed: "

    .line 274
    .line 275
    invoke-direct {v4, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v7

    .line 282
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v4

    .line 289
    invoke-virtual {v3, v5, v4, v0, v1}, Ll/pgi;->c(ILjava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;)V

    .line 290
    .line 291
    .line 292
    invoke-interface {v2, v6, v0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    :goto_4
    return-void
.end method
