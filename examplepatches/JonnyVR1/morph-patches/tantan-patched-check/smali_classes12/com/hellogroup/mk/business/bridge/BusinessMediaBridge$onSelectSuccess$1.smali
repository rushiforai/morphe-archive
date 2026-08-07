.class final Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->O(Lorg/json/JSONObject;Ll/jjw;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Ll/drb;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Lkotlin/Unit;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0010\u0004\u001a\u00020\u0001*\u00020\u0000H\u008a@\u00a2\u0006\u0004\u0008\u0002\u0010\u0003"
    }
    d2 = {
        "Ll/drb;",
        "",
        "invoke",
        "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
        "<anonymous>"
    }
    k = 0x3
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.hellogroup.mk.business.bridge.BusinessMediaBridge$onSelectSuccess$1"
    f = "BusinessMediaBridge.kt"
    l = {}
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $params:Lorg/json/JSONObject;

.field final synthetic $response:Ll/jjw;

.field label:I

.field private p$:Ll/drb;

.field final synthetic this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;Ll/jjw;Lkotlin/coroutines/Continuation;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;->$params:Lorg/json/JSONObject;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;->$response:Ll/jjw;

    .line 6
    .line 7
    const/4 p1, 0x2

    .line 8
    invoke-direct {p0, p1, p4}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 3
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lkotlin/coroutines/Continuation;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;

    iget-object v1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    iget-object v2, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;->$params:Lorg/json/JSONObject;

    iget-object p0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;->$response:Ll/jjw;

    invoke-direct {v0, v1, v2, p0, p2}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;-><init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;Ll/jjw;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Ll/drb;

    iput-object p1, v0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;->p$:Ll/drb;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 19
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v2, ""

    .line 4
    .line 5
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    iget v0, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;->label:I

    .line 9
    .line 10
    if-nez v0, :cond_a

    .line 11
    .line 12
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;->$params:Lorg/json/JSONObject;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string v4, "callback"

    .line 20
    .line 21
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    move-object v4, v0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v4, 0x0

    .line 28
    :goto_0
    iget-object v0, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;->$params:Lorg/json/JSONObject;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v5, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 33
    .line 34
    invoke-static {v5}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->s(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    const-string v6, "type"

    .line 39
    .line 40
    invoke-virtual {v0, v6, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    move-object v5, v0

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    const/4 v5, 0x0

    .line 47
    :goto_1
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .line 51
    .line 52
    new-instance v6, Lorg/json/JSONObject;

    .line 53
    .line 54
    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 55
    .line 56
    .line 57
    const-string v7, "status"

    .line 58
    .line 59
    const/4 v8, 0x0

    .line 60
    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 61
    .line 62
    .line 63
    new-instance v7, Lorg/json/JSONArray;

    .line 64
    .line 65
    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    .line 66
    .line 67
    .line 68
    new-instance v9, Ljava/util/ArrayList;

    .line 69
    .line 70
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 71
    .line 72
    .line 73
    iget-object v10, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;->$response:Ll/jjw;

    .line 74
    .line 75
    if-eqz v10, :cond_2

    .line 76
    .line 77
    invoke-virtual {v10}, Ll/jjw;->a()Lorg/json/JSONObject;

    .line 78
    .line 79
    .line 80
    move-result-object v10

    .line 81
    if-eqz v10, :cond_2

    .line 82
    .line 83
    const-string v11, "mediaPaths"

    .line 84
    .line 85
    invoke-virtual {v10, v11}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 86
    .line 87
    .line 88
    move-result-object v10

    .line 89
    if-eqz v10, :cond_2

    .line 90
    .line 91
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    .line 92
    .line 93
    .line 94
    move-result v11

    .line 95
    move v12, v8

    .line 96
    :goto_2
    if-ge v12, v11, :cond_2

    .line 97
    .line 98
    invoke-virtual {v10, v12}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v13

    .line 102
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 103
    .line 104
    .line 105
    invoke-interface {v0, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    add-int/lit8 v12, v12, 0x1

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :catch_0
    move-exception v0

    .line 112
    move-object v11, v4

    .line 113
    goto/16 :goto_a

    .line 114
    .line 115
    :cond_2
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 116
    .line 117
    .line 118
    move-result-object v10

    .line 119
    :goto_3
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 120
    .line 121
    .line 122
    move-result v11
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 123
    const-string v12, "      size="

    .line 124
    .line 125
    const-string v13, "      path="

    .line 126
    .line 127
    const-string v14, "MediaExtraBridge"

    .line 128
    .line 129
    if-eqz v11, :cond_3

    .line 130
    .line 131
    :try_start_1
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v11

    .line 135
    check-cast v11, Ljava/lang/String;

    .line 136
    .line 137
    new-instance v15, Ljava/io/File;

    .line 138
    .line 139
    invoke-direct {v15, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    invoke-interface {v9, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    new-instance v11, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v15}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v13

    .line 157
    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v15}, Ljava/io/File;->length()J

    .line 164
    .line 165
    .line 166
    move-result-wide v12

    .line 167
    invoke-virtual {v11, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v11

    .line 174
    invoke-static {v14, v11}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    goto :goto_3

    .line 178
    :cond_3
    const-string v10, "OnActivityResult "

    .line 179
    .line 180
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-static {v10, v0}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 188
    .line 189
    .line 190
    move-result-object v9

    .line 191
    :goto_4
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    if-eqz v0, :cond_9

    .line 196
    .line 197
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    check-cast v0, Ljava/io/File;

    .line 202
    .line 203
    new-instance v10, Ljava/lang/StringBuilder;

    .line 204
    .line 205
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v11

    .line 215
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 219
    .line 220
    .line 221
    move-object v11, v4

    .line 222
    const/4 v15, 0x0

    .line 223
    :try_start_2
    invoke-virtual {v0}, Ljava/io/File;->length()J

    .line 224
    .line 225
    .line 226
    move-result-wide v3

    .line 227
    invoke-virtual {v10, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v3

    .line 234
    invoke-static {v14, v3}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    iget-object v3, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 242
    .line 243
    invoke-static {v3}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->u(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v3

    .line 247
    invoke-static {v5, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 251
    const-string v4, "path"

    .line 252
    .line 253
    const-string v10, "data"

    .line 254
    .line 255
    if-eqz v3, :cond_4

    .line 256
    .line 257
    :try_start_3
    new-instance v3, Lorg/json/JSONObject;

    .line 258
    .line 259
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v3, v10, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 263
    .line 264
    .line 265
    move-result-object v3

    .line 266
    invoke-virtual {v3, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    invoke-virtual {v7, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 271
    .line 272
    .line 273
    move-object/from16 v16, v5

    .line 274
    .line 275
    move-object/from16 p1, v15

    .line 276
    .line 277
    goto/16 :goto_8

    .line 278
    .line 279
    :catch_1
    move-exception v0

    .line 280
    goto/16 :goto_a

    .line 281
    .line 282
    :cond_4
    iget-object v3, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 283
    .line 284
    invoke-static {v3}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->t(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v3

    .line 288
    invoke-static {v5, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 289
    .line 290
    .line 291
    move-result v3

    .line 292
    if-eqz v3, :cond_6

    .line 293
    .line 294
    iget-object v3, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 295
    .line 296
    invoke-static {v3}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->x(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Ll/hul;

    .line 297
    .line 298
    .line 299
    move-result-object v3

    .line 300
    if-eqz v3, :cond_5

    .line 301
    .line 302
    new-instance v3, Lorg/json/JSONObject;

    .line 303
    .line 304
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 305
    .line 306
    .line 307
    move-object/from16 p1, v15

    .line 308
    .line 309
    iget-object v15, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 310
    .line 311
    invoke-static {v15}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->x(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Ll/hul;

    .line 312
    .line 313
    .line 314
    move-result-object v15

    .line 315
    invoke-interface {v15, v0}, Ll/hul;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v15

    .line 319
    invoke-virtual {v3, v10, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 320
    .line 321
    .line 322
    move-result-object v3

    .line 323
    invoke-virtual {v3, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 324
    .line 325
    .line 326
    move-result-object v0

    .line 327
    invoke-virtual {v7, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 328
    .line 329
    .line 330
    :goto_5
    move-object/from16 v16, v5

    .line 331
    .line 332
    goto/16 :goto_8

    .line 333
    .line 334
    :cond_5
    move-object/from16 p1, v15

    .line 335
    .line 336
    goto :goto_5

    .line 337
    :cond_6
    move-object/from16 p1, v15

    .line 338
    .line 339
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    .line 340
    .line 341
    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 342
    .line 343
    .line 344
    :try_start_4
    iget-object v15, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 345
    .line 346
    invoke-static {v15}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->r(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Landroid/content/Context;

    .line 347
    .line 348
    .line 349
    move-result-object v15

    .line 350
    invoke-static {v15}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 351
    .line 352
    .line 353
    move-result-object v15

    .line 354
    invoke-virtual {v15}, Ll/m2d0;->f()Ll/a2d0;

    .line 355
    .line 356
    .line 357
    move-result-object v15

    .line 358
    invoke-virtual {v15, v0}, Ll/a2d0;->D0(Ljava/lang/String;)Ll/a2d0;

    .line 359
    .line 360
    .line 361
    move-result-object v15

    .line 362
    sget-object v8, Ll/d4e;->b:Ll/d4e;

    .line 363
    .line 364
    invoke-virtual {v15, v8}, Ll/lr2;->e(Ll/d4e;)Ll/lr2;

    .line 365
    .line 366
    .line 367
    move-result-object v8

    .line 368
    check-cast v8, Ll/a2d0;

    .line 369
    .line 370
    invoke-virtual {v8}, Ll/a2d0;->G0()Ll/ndj;

    .line 371
    .line 372
    .line 373
    move-result-object v8

    .line 374
    invoke-interface {v8}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 375
    .line 376
    .line 377
    move-result-object v8

    .line 378
    check-cast v8, Landroid/graphics/Bitmap;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 379
    .line 380
    :try_start_5
    sget-object v15, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 381
    .line 382
    move-object/from16 v16, v5

    .line 383
    .line 384
    const/16 v5, 0x46

    .line 385
    .line 386
    :try_start_6
    invoke-virtual {v8, v15, v5, v3}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 387
    .line 388
    .line 389
    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getWidth()I

    .line 390
    .line 391
    .line 392
    move-result v5

    .line 393
    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getHeight()I

    .line 394
    .line 395
    .line 396
    move-result v15
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 397
    move-object/from16 v17, v3

    .line 398
    .line 399
    :try_start_7
    invoke-virtual/range {v17 .. v17}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 400
    .line 401
    .line 402
    move-result-object v3

    .line 403
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 404
    .line 405
    .line 406
    invoke-virtual {v8}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 407
    .line 408
    .line 409
    move-object/from16 v18, v8

    .line 410
    .line 411
    const/4 v8, 0x0

    .line 412
    :try_start_8
    invoke-static {v3, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object v3

    .line 416
    new-instance v8, Lorg/json/JSONObject;

    .line 417
    .line 418
    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 419
    .line 420
    .line 421
    invoke-virtual {v8, v10, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 422
    .line 423
    .line 424
    move-result-object v3

    .line 425
    const-string v8, "size"

    .line 426
    .line 427
    invoke-virtual/range {v17 .. v17}, Ljava/io/ByteArrayOutputStream;->size()I

    .line 428
    .line 429
    .line 430
    move-result v10

    .line 431
    invoke-virtual {v3, v8, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 432
    .line 433
    .line 434
    move-result-object v3

    .line 435
    const-string v8, "width"

    .line 436
    .line 437
    invoke-virtual {v3, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 438
    .line 439
    .line 440
    move-result-object v3

    .line 441
    const-string v5, "height"

    .line 442
    .line 443
    invoke-virtual {v3, v5, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 444
    .line 445
    .line 446
    move-result-object v3

    .line 447
    invoke-virtual {v3, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 448
    .line 449
    .line 450
    move-result-object v0

    .line 451
    invoke-virtual {v7, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 452
    .line 453
    .line 454
    :try_start_9
    invoke-virtual/range {v17 .. v17}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 455
    .line 456
    .line 457
    invoke-virtual/range {v18 .. v18}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 458
    .line 459
    .line 460
    move-result v0

    .line 461
    if-nez v0, :cond_7

    .line 462
    .line 463
    invoke-virtual/range {v18 .. v18}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    .line 464
    .line 465
    .line 466
    goto :goto_8

    .line 467
    :catchall_0
    move-exception v0

    .line 468
    move-object/from16 v8, v18

    .line 469
    .line 470
    goto :goto_7

    .line 471
    :catchall_1
    move-exception v0

    .line 472
    :goto_6
    move-object/from16 v18, v8

    .line 473
    .line 474
    goto :goto_7

    .line 475
    :catchall_2
    move-exception v0

    .line 476
    move-object/from16 v17, v3

    .line 477
    .line 478
    goto :goto_6

    .line 479
    :catchall_3
    move-exception v0

    .line 480
    move-object/from16 v17, v3

    .line 481
    .line 482
    move-object/from16 v16, v5

    .line 483
    .line 484
    goto :goto_6

    .line 485
    :catchall_4
    move-exception v0

    .line 486
    move-object/from16 v17, v3

    .line 487
    .line 488
    move-object/from16 v16, v5

    .line 489
    .line 490
    move-object/from16 v8, p1

    .line 491
    .line 492
    :goto_7
    :try_start_a
    invoke-static {v14, v2, v0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    .line 493
    .line 494
    .line 495
    :try_start_b
    invoke-virtual/range {v17 .. v17}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 496
    .line 497
    .line 498
    if-eqz v8, :cond_7

    .line 499
    .line 500
    invoke-virtual {v8}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 501
    .line 502
    .line 503
    move-result v0

    .line 504
    if-nez v0, :cond_7

    .line 505
    .line 506
    invoke-virtual {v8}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    .line 507
    .line 508
    .line 509
    goto :goto_8

    .line 510
    :catchall_5
    move-exception v0

    .line 511
    :try_start_c
    invoke-static {v14, v2, v0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1

    .line 512
    .line 513
    .line 514
    :cond_7
    :goto_8
    move-object v4, v11

    .line 515
    move-object/from16 v5, v16

    .line 516
    .line 517
    const/4 v8, 0x0

    .line 518
    goto/16 :goto_4

    .line 519
    .line 520
    :catchall_6
    move-exception v0

    .line 521
    move-object v3, v0

    .line 522
    :try_start_d
    invoke-virtual/range {v17 .. v17}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 523
    .line 524
    .line 525
    if-eqz v8, :cond_8

    .line 526
    .line 527
    invoke-virtual {v8}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 528
    .line 529
    .line 530
    move-result v0

    .line 531
    if-nez v0, :cond_8

    .line 532
    .line 533
    invoke-virtual {v8}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_7

    .line 534
    .line 535
    .line 536
    goto :goto_9

    .line 537
    :catchall_7
    move-exception v0

    .line 538
    :try_start_e
    invoke-static {v14, v2, v0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 539
    .line 540
    .line 541
    :cond_8
    :goto_9
    throw v3

    .line 542
    :cond_9
    move-object v11, v4

    .line 543
    const-string v0, "images"

    .line 544
    .line 545
    invoke-virtual {v6, v0, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 546
    .line 547
    .line 548
    iget-object v0, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 549
    .line 550
    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 551
    .line 552
    .line 553
    move-result-object v3

    .line 554
    invoke-static {v0, v11, v3}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->y(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_1

    .line 555
    .line 556
    .line 557
    goto :goto_b

    .line 558
    :goto_a
    sget-object v3, Ll/qpl;->b:Ljava/lang/String;

    .line 559
    .line 560
    invoke-static {v3, v2, v0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 561
    .line 562
    .line 563
    iget-object v1, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$onSelectSuccess$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 564
    .line 565
    const-string v3, "-1"

    .line 566
    .line 567
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 568
    .line 569
    .line 570
    move-result-object v0

    .line 571
    invoke-virtual {v1, v11, v3, v2, v0}, Ll/qpl;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 572
    .line 573
    .line 574
    :goto_b
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 575
    .line 576
    return-object v0

    .line 577
    :cond_a
    const/16 p1, 0x0

    .line 578
    .line 579
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 580
    .line 581
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 582
    .line 583
    .line 584
    return-object p1
.end method
