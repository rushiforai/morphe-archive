.class final Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->Y(Lorg/json/JSONObject;)V
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
    c = "com.hellogroup.mk.business.bridge.BusinessMediaBridge$uploadImages$1"
    f = "BusinessMediaBridge.kt"
    l = {}
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $params:Lorg/json/JSONObject;

.field label:I

.field private p$:Ll/drb;

.field final synthetic this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;Lkotlin/coroutines/Continuation;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    iput-object p2, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;->$params:Lorg/json/JSONObject;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 2
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

    new-instance v0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;

    iget-object v1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    iget-object p0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;->$params:Lorg/json/JSONObject;

    invoke-direct {v0, v1, p0, p2}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;-><init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Ll/drb;

    iput-object p1, v0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;->p$:Ll/drb;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 17
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
    iget v0, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;->label:I

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    if-nez v0, :cond_11

    .line 12
    .line 13
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->r(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_10

    .line 23
    .line 24
    iget-object v0, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;->$params:Lorg/json/JSONObject;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    const-string v4, "callback"

    .line 29
    .line 30
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    move-object v4, v0

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move-object v4, v3

    .line 37
    :goto_0
    iget-object v0, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;->$params:Lorg/json/JSONObject;

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    const-string v5, "url"

    .line 42
    .line 43
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    move-object v0, v3

    .line 49
    :goto_1
    invoke-static {v0}, Ll/i8g0;->b(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    if-eqz v5, :cond_2

    .line 54
    .line 55
    iget-object v0, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->L()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    :cond_2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    const-string v6, "1"

    .line 66
    .line 67
    if-eqz v5, :cond_3

    .line 68
    .line 69
    iget-object v0, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 70
    .line 71
    const-string v1, "upload param url is empty"

    .line 72
    .line 73
    invoke-virtual {v0, v4, v6, v1}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->M(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 77
    .line 78
    return-object v0

    .line 79
    :cond_3
    sget-object v5, Ll/ljw;->INSTANCE:Ll/ljw;

    .line 80
    .line 81
    invoke-virtual {v5, v0}, Ll/ljw;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iget-object v5, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;->$params:Lorg/json/JSONObject;

    .line 86
    .line 87
    if-eqz v5, :cond_4

    .line 88
    .line 89
    const-string v3, "images"

    .line 90
    .line 91
    invoke-virtual {v5, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    :cond_4
    const-string v5, "images is empty"

    .line 96
    .line 97
    if-nez v3, :cond_5

    .line 98
    .line 99
    iget-object v0, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 100
    .line 101
    invoke-virtual {v0, v4, v6, v5}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->M(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 105
    .line 106
    return-object v0

    .line 107
    :cond_5
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    .line 108
    .line 109
    .line 110
    move-result v7

    .line 111
    iget-object v8, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 112
    .line 113
    if-gtz v7, :cond_6

    .line 114
    .line 115
    invoke-virtual {v8, v4, v6, v5}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->M(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 119
    .line 120
    return-object v0

    .line 121
    :cond_6
    iget-object v5, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;->$params:Lorg/json/JSONObject;

    .line 122
    .line 123
    const-string v9, "headers"

    .line 124
    .line 125
    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 126
    .line 127
    .line 128
    move-result-object v5

    .line 129
    invoke-static {v8, v5}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->w(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;)Ljava/util/HashMap;

    .line 130
    .line 131
    .line 132
    move-result-object v14

    .line 133
    iget-object v5, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 134
    .line 135
    iget-object v8, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;->$params:Lorg/json/JSONObject;

    .line 136
    .line 137
    const-string v15, "data"

    .line 138
    .line 139
    invoke-virtual {v8, v15}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 140
    .line 141
    .line 142
    move-result-object v8

    .line 143
    invoke-static {v5, v8}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->w(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;)Ljava/util/HashMap;

    .line 144
    .line 145
    .line 146
    move-result-object v11

    .line 147
    invoke-static {}, Ll/gkw;->b()Ll/gkw;

    .line 148
    .line 149
    .line 150
    move-result-object v5

    .line 151
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v5}, Ll/gkw;->a()Ll/ivl;

    .line 155
    .line 156
    .line 157
    move-result-object v9

    .line 158
    new-instance v5, Ljava/util/ArrayList;

    .line 159
    .line 160
    invoke-direct {v5, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 161
    .line 162
    .line 163
    new-instance v8, Ljava/util/ArrayList;

    .line 164
    .line 165
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 166
    .line 167
    .line 168
    const/4 v12, 0x0

    .line 169
    :goto_2
    if-ge v12, v7, :cond_a

    .line 170
    .line 171
    invoke-virtual {v3, v12}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v13

    .line 175
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 176
    .line 177
    .line 178
    move-result v16

    .line 179
    if-eqz v16, :cond_7

    .line 180
    .line 181
    goto :goto_3

    .line 182
    :cond_7
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 183
    .line 184
    .line 185
    invoke-static {v13}, Ll/a6k0;->i(Ljava/lang/String;)Z

    .line 186
    .line 187
    .line 188
    move-result v16

    .line 189
    if-eqz v16, :cond_8

    .line 190
    .line 191
    invoke-static {v13}, Ll/wkw;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v13

    .line 195
    :cond_8
    new-instance v10, Ljava/io/File;

    .line 196
    .line 197
    invoke-direct {v10, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    .line 201
    .line 202
    .line 203
    move-result v13

    .line 204
    if-eqz v13, :cond_9

    .line 205
    .line 206
    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    :cond_9
    const-string v10, "image/jpeg"

    .line 210
    .line 211
    invoke-interface {v8, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    :goto_3
    add-int/lit8 v12, v12, 0x1

    .line 215
    .line 216
    goto :goto_2

    .line 217
    :cond_a
    :try_start_0
    sget-object v3, Lcom/hellogroup/mk/business/MKConfigSetter;->Companion:Lcom/hellogroup/mk/business/MKConfigSetter$Companion;

    .line 218
    .line 219
    invoke-virtual {v3}, Lcom/hellogroup/mk/business/MKConfigSetter$Companion;->b()Ll/ojw;

    .line 220
    .line 221
    .line 222
    move-result-object v3

    .line 223
    if-eqz v3, :cond_b

    .line 224
    .line 225
    iget-object v7, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 226
    .line 227
    invoke-static {v7}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->x(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Ll/hul;

    .line 228
    .line 229
    .line 230
    move-result-object v7

    .line 231
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 232
    .line 233
    .line 234
    invoke-interface {v7}, Ll/hul;->getOriginURL()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v7

    .line 238
    invoke-virtual {v3, v0, v7}, Ll/ojw;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v3

    .line 242
    if-eqz v3, :cond_b

    .line 243
    .line 244
    move-object v10, v3

    .line 245
    :goto_4
    const/4 v0, 0x0

    .line 246
    goto :goto_5

    .line 247
    :catch_0
    move-exception v0

    .line 248
    goto/16 :goto_8

    .line 249
    .line 250
    :cond_b
    move-object v10, v0

    .line 251
    goto :goto_4

    .line 252
    :goto_5
    new-array v3, v0, [Ljava/io/File;

    .line 253
    .line 254
    invoke-interface {v5, v3}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 258
    const-string v5, "null cannot be cast to non-null type kotlin.Array<T>"

    .line 259
    .line 260
    if-eqz v3, :cond_f

    .line 261
    .line 262
    :try_start_1
    move-object v12, v3

    .line 263
    check-cast v12, [Ljava/io/File;

    .line 264
    .line 265
    new-array v3, v0, [Ljava/lang/String;

    .line 266
    .line 267
    invoke-interface {v8, v3}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object v3

    .line 271
    if-eqz v3, :cond_e

    .line 272
    .line 273
    move-object v13, v3

    .line 274
    check-cast v13, [Ljava/lang/String;

    .line 275
    .line 276
    const-string v3, "X-Putong-Cloud-Module"

    .line 277
    .line 278
    invoke-static {}, Ll/sjw;->d()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v5

    .line 282
    invoke-interface {v14, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    const-string v3, "Content-Type"

    .line 286
    .line 287
    const-string v5, "multipart/form-data"

    .line 288
    .line 289
    invoke-interface {v14, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    .line 291
    .line 292
    invoke-interface/range {v9 .. v14}, Ll/ivl;->b(Ljava/lang/String;Ljava/util/Map;[Ljava/io/File;[Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v3

    .line 296
    new-instance v5, Lorg/json/JSONObject;

    .line 297
    .line 298
    invoke-direct {v5, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    const-string v7, "ec"

    .line 302
    .line 303
    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 304
    .line 305
    .line 306
    move-result v7

    .line 307
    if-eqz v7, :cond_d

    .line 308
    .line 309
    const/16 v8, 0xc8

    .line 310
    .line 311
    if-ne v7, v8, :cond_c

    .line 312
    .line 313
    goto :goto_6

    .line 314
    :cond_c
    const/4 v10, 0x1

    .line 315
    goto :goto_7

    .line 316
    :cond_d
    :goto_6
    move v10, v0

    .line 317
    :goto_7
    const-string v0, "em"

    .line 318
    .line 319
    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    const-string v5, "status"

    .line 324
    .line 325
    const-string v7, "message"

    .line 326
    .line 327
    filled-new-array {v5, v7, v15}, [Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v5

    .line 331
    new-instance v7, Ljava/lang/StringBuilder;

    .line 332
    .line 333
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 334
    .line 335
    .line 336
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object v8

    .line 340
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 341
    .line 342
    .line 343
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 344
    .line 345
    .line 346
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object v7

    .line 350
    filled-new-array {v7, v0, v3}, [Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object v0

    .line 354
    invoke-static {v5, v0}, Ll/glw;->b([Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 355
    .line 356
    .line 357
    move-result-object v0

    .line 358
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v0

    .line 362
    iget-object v3, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 363
    .line 364
    invoke-static {v3, v4, v0}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->y(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Ljava/lang/String;Ljava/lang/String;)V

    .line 365
    .line 366
    .line 367
    goto :goto_9

    .line 368
    :cond_e
    new-instance v0, Lkotlin/TypeCastException;

    .line 369
    .line 370
    invoke-direct {v0, v5}, Lkotlin/TypeCastException;-><init>(Ljava/lang/String;)V

    .line 371
    .line 372
    .line 373
    throw v0

    .line 374
    :cond_f
    new-instance v0, Lkotlin/TypeCastException;

    .line 375
    .line 376
    invoke-direct {v0, v5}, Lkotlin/TypeCastException;-><init>(Ljava/lang/String;)V

    .line 377
    .line 378
    .line 379
    throw v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 380
    :goto_8
    const-string v3, "MediaExtraBridge"

    .line 381
    .line 382
    invoke-static {v3, v2, v0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 383
    .line 384
    .line 385
    iget-object v1, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadImages$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 386
    .line 387
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v0

    .line 391
    invoke-virtual {v1, v4, v6, v0}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->M(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 392
    .line 393
    .line 394
    :goto_9
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 395
    .line 396
    return-object v0

    .line 397
    :cond_10
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 398
    .line 399
    return-object v0

    .line 400
    :cond_11
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 401
    .line 402
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 403
    .line 404
    .line 405
    return-object v3
.end method
